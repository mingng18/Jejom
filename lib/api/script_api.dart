import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jejom/models/language_enum.dart';
import 'package:jejom/models/script_game.dart';
import 'package:jejom/models/script_restaurant.dart';
import 'package:jejom/utils/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

// Fetch all scripts along with their nested collections (eng and kor)
Future<List<ScriptGame>> fetchAllScriptFromFirestore(Language lang) async {
  try {
    final scriptDocs =
        await FirebaseFirestore.instance.collection('script').get();
    List<ScriptGame> scripts = [];

    print("scriptDocs: ${scriptDocs.docs.length}");

    if (scriptDocs.docs.isNotEmpty) {
      for (var scriptDoc in scriptDocs.docs) {
        print(scriptDoc.data());
        final nestedCollection = lang == Language.english ? 'eng' : 'chi';
        final nestedDocs =
            await scriptDoc.reference.collection(nestedCollection).get();

        if (nestedDocs.docs.isNotEmpty) {
          print("nestedDocs: ${nestedDocs.docs[0].data()}");
          Map<String, dynamic> fullData = {
            ...scriptDoc.data(),
            ...nestedDocs.docs[0].data(),
          };
          scripts.add(ScriptGame.fromJson(fullData));
        }
      }
    }
    return scripts;
  } catch (e) {
    debugPrint("Error running fetchAllScriptFromFirestore : $e");
    return [];
  }
}

Future<List<ScriptGame>> fetchResScriptFromFirestore(
    Language lang, String resId) async {
  try {
    final scriptDocs =
        await FirebaseFirestore.instance.collection('script').get();
    List<ScriptGame> scripts = [];

    if (scriptDocs.docs.isNotEmpty) {
      for (var scriptDoc in scriptDocs.docs) {
        String restaurant = scriptDoc.data()['restaurant'] ?? '';

        // Check if the restaurants array contains the given resId
        if (restaurant == resId) {
          final nestedCollection = lang == Language.english ? 'eng' : 'chi';
          final nestedDocs =
              await scriptDoc.reference.collection(nestedCollection).get();

          if (nestedDocs.docs.isNotEmpty) {
            Map<String, dynamic> fullData = {
              ...scriptDoc.data(),
              ...nestedDocs.docs[0].data(),
            };
            scripts.add(ScriptGame.fromJson(fullData));
          }
        }
      }
    }
    return scripts;
  } catch (e) {
    debugPrint("Error running fetchResScriptFromFirestore: $e");
    return [];
  }
}

String cleanJsonString(String jsonString) {
  // Replace problematic control characters
  return jsonString.replaceAll('\n', '\\n').replaceAll('\t', '\\t');
}

// Fetch restaurant details based on its ID
Future<ScriptRestaurant?> fetchResFromFirestore(String restaurantId) async {
  try {
    final scriptDoc = await FirebaseFirestore.instance
        .collection('script_restaurant')
        .doc(restaurantId)
        .get();
    printWrapped("${scriptDoc.data()}");
    if (scriptDoc.exists) {
      return ScriptRestaurant.fromJson(scriptDoc.data()!);
    }
    return null;
  } catch (e) {
    debugPrint("Error running fetchResFromFirestore : $e");
    return null;
  }
}

void printWrapped(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

Future<void> generateScript(String restaurantId, int charactersNum,
    String cafeName, String cafeEnv) async {
  const int maxRetries = 3;
  const Duration timeoutDuration = Duration(seconds: 30);
  const Duration retryDelay = Duration(seconds: 2);

  var url = Uri.parse('http://${Constants.API_URL}/generate_script');

  var body = {
    'characters_num': charactersNum.toString(),
    'cafe_name': cafeName,
    'cafe_environment': cafeEnv,
    'mode': 'test'
  };

  for (int attempt = 0; attempt < maxRetries; attempt++) {
    try {
      print("Attempt ${attempt + 1} of $maxRetries to generate script");

      var client = http.Client();
      var response = await client
          .post(
            url,
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded',
              'Connection': 'keep-alive',
            },
            body: body,
          )
          .timeout(timeoutDuration);

      print("Response received with status: ${response.statusCode}");

      if (response.statusCode == 200) {
        var responseBody = json.decode(response.body);

        var engScript = responseBody['eng_script'];
        var cnScript = responseBody['cn_script'];

        print('Eng Script: $engScript');
        print('Chi Script: $cnScript');

        await uploadScriptToFirestore(restaurantId, cnScript, engScript);

        print('Scripts and ScriptGame saved successfully to Firestore.');
        return;
      } else if (response.statusCode >= 500) {
        // Server error, retry
        if (attempt < maxRetries - 1) {
          print('Server error (${response.statusCode}), retrying...');
          await Future.delayed(retryDelay);
          continue;
        }
      }

      print('Request failed with status: ${response.statusCode}.');
      throw Exception('Failed to generate script: ${response.statusCode}');
    } on TimeoutException {
      print('Request timed out, retrying...');
      if (attempt < maxRetries - 1) {
        await Future.delayed(retryDelay);
        continue;
      }
      throw Exception('Request timed out after $maxRetries attempts');
    } on http.ClientException catch (e) {
      print('Connection error: $e');
      if (attempt < maxRetries - 1) {
        await Future.delayed(retryDelay);
        continue;
      }
      throw Exception('Connection error after $maxRetries attempts: $e');
    } catch (e) {
      print('Error during script generation: $e');
      rethrow;
    }
  }
}

Future<void> uploadScriptToFirestore(String restaurantId,
    Map<String, dynamic> korScript, Map<String, dynamic> engScript) async {
  try {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    String collectionPath = 'script';
    DocumentReference docRef = firestore.collection(collectionPath).doc();
    await docRef.set({
      'restaurant': restaurantId,
    });

    await docRef
        .collection('chi')
        .doc()
        .set({...korScript, 'restaurant': restaurantId});
    await docRef
        .collection('eng')
        .doc()
        .set({...engScript, 'restaurant': restaurantId});

    print('Script uploaded successfully to Firestore: $collectionPath');
  } catch (e) {
    print('Failed to upload script to Firestore: $e');
  }
}
