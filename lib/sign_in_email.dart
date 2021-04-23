import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignInSignUpResult {
  final User user;
  final String message;
  SignInSignUpResult({this.user, this.message});
}

Future<SignInSignUpResult> createUser({String email, String pass}) async {
  try {
    UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email, password: pass);
    return SignInSignUpResult(user: result.user);
  } catch (e) {
    return SignInSignUpResult(message: e.toString());
  }
}

Future<SignInSignUpResult> signInWithEmail({String email, String pass}) async {
  try {
    UserCredential result =
        await _auth.signInWithEmailAndPassword(email: email, password: pass);
    return SignInSignUpResult(user: result.user);
  } catch (e) {
    return SignInSignUpResult(message: e.toString());
  }
}

Future<void> signOutEmail() async {
  _auth.signOut();
  print("User Signed Out");
}
