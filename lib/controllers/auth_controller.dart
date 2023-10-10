// the code below is used to create a controller for auth
// ignore_for_file: unnecessary_overrides, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_drive_clone/utilities/collection_utils.dart';
import 'package:google_sign_in/google_sign_in.dart';

// the class inherits from the GetxController class
class AuthController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // the code below is used to create a reactive variable using Getx to get the
  // details of the current user and if the user exists then navigate him
  // to the home page

  // passing the value of current User as initial value to the user variable
  Rx<User?> user = Rx<User?>(FirebaseAuth.instance.currentUser);

  // the method below is the init method that will be called when this
  // controller is initialized
  @override
  void onInit() {
    super.onInit();
    print("onInit() method called");
    // using the bindStream() method from the reactive user instance to add a stream to
    // the reactive user instance to listen to the changes in the user values

    // passing the authStateChanges() method from the _firebaseAuth instance
    // to listen to the auth state changes in the user
    user.bindStream(_firebaseAuth.authStateChanges());
  }

  // the method below is used to for logging the user into the app using google auth
  Future<void> login() async {
    try {
      // sigin the user using google auth
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        GoogleSignInAuthentication googleSignInAuth =
            await googleUser.authentication;
        AuthCredential credentials = GoogleAuthProvider.credential(
          idToken: googleSignInAuth.idToken,
          accessToken: googleSignInAuth.accessToken,
        );
        UserCredential userCredential =
            await _firebaseAuth.signInWithCredential(credentials);

        // getting details of the user
        User? user = userCredential.user;

        // if value of user is not null then saving the details of the user
        // in firebase firestore users collection with name of the doc equal to the
        // uid of the user
        if (user != null) {
          userCollection.doc(user.uid).set({
            "username": user.displayName,
            "profilePhoto": user.photoURL,
            "email": user.email,
            "uid": user.uid,
            "createdAt": DateTime.now(),
          });
        } else {
          print("Unable to add the user to the cloud firestore");
        }
      }
    } catch (e) {
      print("Error while logging in the user");
      print(e);
    }
  }
}
