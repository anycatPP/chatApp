import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth_provider_base.dart';
import 'package:google_sign_in/google_sign_in.dart';

class _AndroidAuthProvider implements AuthProviderBase {
  @override
  Future<FirebaseApp> initialize() async {
    return await Firebase.initializeApp(
        name: 'The chat crew',
        options: FirebaseOptions(
            apiKey: "AIzaSyDKEcU3P538WxzqoOH9ELZ3gk4DwOYTh1Y",
            authDomain: "testing-3550c.firebaseapp.com",
            databaseURL:
                "https://testing-3550c-default-rtdb.asia-southeast1.firebasedatabase.app",
            projectId: "testing-3550c",
            storageBucket: "testing-3550c.appspot.com",
            messagingSenderId: "1056401955163",
            appId: "1:1056401955163:android:004a16aa38ead6e5e3e27e",
            measurementId: "G-CNBB9V5S9M"));
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

class AuthProvider extends _AndroidAuthProvider {}
