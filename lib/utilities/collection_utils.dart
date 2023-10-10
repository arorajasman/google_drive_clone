// the code below is for creating a user collection to add the users in the
// firebase cloud firestore
import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference<Map<String, dynamic>> userCollection =
    FirebaseFirestore.instance.collection("users");
