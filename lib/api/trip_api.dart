import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:jejom/models/trip.dart';
import 'package:jejom/utils/constants/constants.dart';
import 'package:http/http.dart' as http;

class TripApi {
  static const int maxRetries = 3;
  static const Duration retryDelay = Duration(seconds: 2);
  static const Duration timeoutDuration = Duration(minutes: 10);

  checkInitInput(String prompt) async {
    var url = Uri.parse('http://${Constants.API_URL}/check_init_input');

    var body = {
      'query': prompt,
    };

    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: body,
    );

    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      print('Check Response: $responseBody');
      return responseBody;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  Future<dynamic> generateTrip(String query, String userProps) async {
    var url = Uri.parse('http://${Constants.API_URL}/generate_trip');
    var body = {
      'query': query,
      "user_props": userProps,
    };

    for (int attempt = 0; attempt < maxRetries; attempt++) {
      try {
        var client = http.Client();
        var response = await client.post(
          url,
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            'Connection': 'keep-alive',
            'Accept': 'application/json',
          },
          body: body,
        ).timeout(timeoutDuration);

        if (response.statusCode == 200) {
          var responseBody = json.decode(response.body);
          print('Trip Response: ${responseBody['data']}');
          return responseBody['data'];
        } else if (response.statusCode >= 500) {
          // Server error, retry
          if (attempt < maxRetries - 1) {
            print('Server error (${response.statusCode}), retrying...');
            await Future.delayed(retryDelay);
            continue;
          }
        }
        
        print('Request failed with status: ${response.statusCode}.');
        return null;
      } on TimeoutException {
        print('Request timed out, retrying...');
        if (attempt < maxRetries - 1) {
          await Future.delayed(retryDelay);
          continue;
        }
        rethrow;
      } on http.ClientException catch (e) {
        print('Connection error: $e');
        if (attempt < maxRetries - 1) {
          await Future.delayed(retryDelay);
          continue;
        }
        rethrow;
      } catch (e) {
        print('Error during API request: $e');
        rethrow;
      }
    }
    return null;
  }

  Future<void> addTripToFirebase(
      String userId, Map<String, dynamic> trip) async {
    // Add trip to Firebase
    try {
      await FirebaseFirestore.instance
          .collection('trips')
          .add({"userId": userId, ...trip});
    } catch (e) {
      print('Error adding trip to Firebase: $e');
    }
  }

  Future<List<Trip>> fetchTripFromFirebase(String userId) async {
    try {
      var trip = await FirebaseFirestore.instance
          .collection('trips')
          // .where('userId', isEqualTo: userId)
          .get();
      print('Trip fetched from Firebase: ${trip.docs}');
      final trips = trip.docs.map((doc) => Trip.fromJson(doc.data())).toList();

      print("Fetched Trips are: $trips");
      return trips;
    } catch (e) {
      print('Error fetching trip from Firebase: $e');
      return [];
    }
  }

  // Future<void> updateTripInFirebase(
  //     String userId, Map<String, dynamic> trip) async {
  //   try {
  //     var tripDoc = await fetchTripFromFirebase(userId);
  //     await tripDoc.reference.update(trip);
  //   } catch (e) {
  //     print('Error updating trip in Firebase: $e');
  //   }
  // }

  Future<void> deleteTripFromFirebase(String tripId) async {
    try {
      await FirebaseFirestore.instance.collection('trips').doc(tripId).delete();
    } catch (e) {
      print('Error deleting trip from Firebase: $e');
    }
  }
}
