import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jejom/models/script_restaurant.dart';

//update User
Future<void> createRestaurantInFirestore(
    String userId, ScriptRestaurant restaurant) async {
  try {
    final Map<String, dynamic> data = restaurant.toJson();

    await FirebaseFirestore.instance
        .collection('script_restaurant')
        .doc(userId)
        .set(data);
  } catch (e) {
    // Handle the error appropriately
    print("Failed to update restaurant in Firestore: $e");
    rethrow; // Optionally rethrow the error to handle it further up the chain
  }
}

Future<ScriptRestaurant?> fetchRestaurantFromFirestore(String userId) async {
  try {
    final restaurantDoc = await FirebaseFirestore.instance
        .collection('script_restaurant')
        .doc(userId)
        .get();
    if (!restaurantDoc.exists) {
      return null;
    }

    print('Restaurant data: ${restaurantDoc.data()}');

    return ScriptRestaurant.fromJson(
        restaurantDoc.data() as Map<String, dynamic>);
  } catch (e) {
    print('Error fetching restaurant: $e');
    return null;
  }
}

Future<List<ScriptRestaurant>?> fetchScriptRestaurantFromFirestore(
    String userId) async {
  final restaurantDoc =
      await FirebaseFirestore.instance.collection('script_restaurant').get();
  if (restaurantDoc.docs.isEmpty) {
    return null;
  }

  final List<ScriptRestaurant> scriptRestaurants = restaurantDoc.docs
      .map((doc) => ScriptRestaurant.fromJson(doc.data()))
      .toList();

  return scriptRestaurants.where((restaurant) => restaurant == userId).toList();
}
