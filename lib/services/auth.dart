import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // User _userFromFirebaseUserList(FirebaseUser user){
  //   return user!=null ? User(uid:user.uid);
  // }

  Future signInWithEmail() async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword();
      FirebaseUser user = result.user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
