import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_drive_clone/utils/firebase_utils.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  // instance of firebase auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // instance of google sign in
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  // using the Rx from getx to create a reactive variable to get the current state
  // of the user

  // passing the currentUser from the FirebaseAuth.instance as input to get
  // the details of the current user
  final Rx<User?> currentFirebaseUser =
      Rx<User?>(FirebaseAuth.instance.currentUser);

  // onInit() method that will be called when the object of this controller
  // class is initialized
  @override
  void onInit() {
    super.onInit();
    print(currentFirebaseUser);
    // using the bindStream() method from the currentFirebaseUser to stream
    // the details of the current user

    // passing _firebaseAuth.authStateChanges() as input to the bindStream()
    // method to listen to the current state changes in the auth of the user
    currentFirebaseUser.bindStream(_firebaseAuth.authStateChanges());
  }

  // the method below is used to login user into the app
  void login(/*{required email, required String password}*/) async {
    GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    print(googleUser);
    if (googleUser != null) {
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );
      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(authCredential);
      User? user = userCredential.user;
      if (user != null) {
        FirebaseUtils().usersCollection.doc(user.uid).set({
          "userName": user.displayName,
          "profilePicture": user.photoURL,
          "userEmail": user.email,
          "uid": user.uid,
          "createdAt": DateTime.now(),
        });
      }
    }
  }
}
