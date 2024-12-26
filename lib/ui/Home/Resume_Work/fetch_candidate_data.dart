import 'package:cloud_firestore/cloud_firestore.dart';

class CandidatesService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Function to fetch all candidate data
  Future<List<Map<String, dynamic>>> fetchAllCandidates() async {
    try {
      // Fetch all documents from the 'candidates' collection
      QuerySnapshot snapshot = await _firestore.collection('candidates').get();

      // Convert the documents to a list of maps
      List<Map<String, dynamic>> candidates = snapshot.docs.map((doc) {
        return {
          'name': doc['name'],
          'email': doc['email'],
          'phone': doc['phone'],
          'address': doc['address'],
          'position': doc['position'],
          'salary': doc['salary'],
          'degree': doc['degree'],
          'university': doc['university'],
          'years_of_experience': doc['years_of_experience'],
          'skills': doc['skills'],
        };
      }).toList();

      return candidates;
    } catch (e) {
      // Handle any errors
      throw Exception('Error fetching candidates: $e');
    }
  }
}
