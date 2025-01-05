import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ApiServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Get All Records.....
  Future<List<QueryDocumentSnapshot>> getRecords(String collection) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection(collection)
          .orderBy('createdAt', descending: true)
          .get();
      if (snapshot.docs.isEmpty) {
        return [];
      } else {
        return snapshot.docs;
      }
    } catch (error) {
      throw Exception("Error $error");
    }
  }

  // Get All Records where.......
  Future<List<QueryDocumentSnapshot>> getRecordsWhere(
      String collection, String key, String value) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection(collection)
          .where(key, isEqualTo: value)
          .orderBy('createdAt', descending: true)
          .get();
      return snapshot.docs;
    } catch (error) {
      throw Exception("Error $error");
    }
  }

  // Get Single Record Where.......
  Future<Map<String, dynamic>> getSingleWhere(
      String collection, String key, String value) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection(collection)
          .where(key, isEqualTo: value)
          .get();
      if (snapshot.docs.isEmpty) {
        return {};
      }
      return snapshot.docs.first.data() as Map<String, dynamic>;
    } catch (error) {
      print("The errror is from here...........");
      throw Exception("$error");
    }
  }

  // Get Record By Id.....
  Future<Map<String, dynamic>> getRecordById(
      String collection, String id) async {
    try {
      DocumentSnapshot snapshot =
          await _firestore.collection(collection).doc(id).get();
      return snapshot.data() as Map<String, dynamic>;
    } catch (error) {
      throw Exception("Error $error");
    }
  }

  // Update record....
  Future<String> updateRecordWhere(String collection, String key, String value,
      Map<String, dynamic> data) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection(collection)
          .where(key, isEqualTo: value)
          .get();
      if (snapshot.docs.isEmpty) {
        return "No Record Found";
      } else {
        await snapshot.docs.first.reference.update(data);
        return "Record Updated Successfully";
      }
    } catch (error) {
      throw Exception("Error updating record $error");
    }
  }

  Future<String> updateRecordById(
      String collection, String id, Map<String, dynamic> data) async {
    try {
      DocumentSnapshot snapshot =
          await _firestore.collection(collection).doc(id).get();
      if (!snapshot.exists) {
        return "No Record Found";
      } else {
        await snapshot.reference.update(data);
        return "Record Updated Successfully";
      }
    } catch (error) {
      throw Exception("Error updating record $error");
    }
  }

  // delete record where......
  Future<bool> deleteRecordWhere(
      String collection, String key, String value) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection(collection)
          .where(key, isEqualTo: value)
          .get();
      if (snapshot.docs.isEmpty) {
        return false;
      } else {
        await snapshot.docs.first.reference.delete();
        return true;
      }
    } catch (error) {
      throw Exception("Error Deleting record $error");
    }
  }

  Future<bool> deleteRocords(
      String collection, String key, String value) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection(collection)
          .where(key, isEqualTo: value)
          .get();
      if (snapshot.docs.isEmpty) {
        return false;
      } else {
        for (var doc in snapshot.docs) {
          await doc.reference.delete();
        }
        return true;
      }
    } catch (error) {
      throw Exception("Error Deleting record $error");
    }
  }

  Future<String> addRecord(
      String collection, String? docId, Map<String, dynamic> data) async {
    try {
      if (collection == 'users') {
        // Use the specified docId for users collection
        await _firestore.collection(collection).doc(docId).set(data);
      } else {
        // Generate a new document ID
        DocumentReference docRef = _firestore.collection(collection).doc();

        data['id'] = docRef.id;
        await _firestore.collection(collection).doc(docRef.id).set(data);
      }
      return "Record Added Successfully";
    } catch (error) {
      throw Exception("Error adding record to $collection: $error");
    }
  }

  Future<bool> deleteById(String collection, String id) async {
    try {
      await _firestore.collection(collection).doc(id).delete();
      return true;
    } catch (error) {
      throw Exception("Error deleting record $error");
    }
  }
}
