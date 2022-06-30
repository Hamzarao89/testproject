import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  Future addUser(String userId, Map<String, dynamic> userInfo) {
    return FirebaseFirestore.instance
        .collection("user")
        .doc(userId)
        .set(userInfo);
  }

  Future<DocumentSnapshot> getUser(String userId) async {
    return FirebaseFirestore.instance.collection("user").doc(userId).get();
  }
}
