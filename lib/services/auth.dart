import 'package:firebase_auth/firebase_auth.dart';

import 'package:project_with_firebase/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _email = '';
  String _password = '';
  //create user object base on firebase user
  UseR _userFromFirebaseUser(User user) {
    return UseR(uid: user.uid);
  }

  //Auth change user Stream
  Stream<UseR> get user {
    return _auth.authStateChanges().map((event) {
      if (event != null) {
        return _userFromFirebaseUser(event);
      } else {
        // Handle the case where event is null (user is not authenticated)
        return UseR(
            uid: ''); // Provide an appropriate default or empty user object
      }
    });
  }

  //sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //sign in with email and password

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign up using email
  Future RegisterWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
