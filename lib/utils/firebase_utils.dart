import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseUtils {
  CollectionReference<Map<String, dynamic>> usersCollection =
      FirebaseFirestore.instance.collection("users");
}
