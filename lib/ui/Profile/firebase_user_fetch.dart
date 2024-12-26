// firestore_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  // Function to fetch the user's name and email from Firestore
  Future<Map<String, String>> fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;

    // Return an empty map if the user is not signed in
    if (user == null) {
      return {};
    }

    try {
      // Fetch data from the 'recruiter' collection using the user's UID
      DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
          .collection('recruiter')
          .doc(user.uid)
          .get();

      if (docSnapshot.exists) {
        // Extract name and email from Firestore document
        String name = docSnapshot.get('name') ?? '';
        String email = docSnapshot.get('email') ?? '';
        String phone = docSnapshot.get('phone') ?? '';

        // Return the data as a map
        return {
          'name': name,
          'email': email,
          'phone': phone
        };
      } else {
        return {}; // Return an empty map if the document doesn't exist
      }
    } catch (e) {
      print("Error fetching user data: $e");
      return {}; // Return an empty map in case of an error
    }
  }
}
