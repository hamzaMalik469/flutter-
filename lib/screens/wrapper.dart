import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_with_firebase/screens/authentication/authenticate.dart';
import 'package:project_with_firebase/screens/home/home.dart';

import 'loadingScreen.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    //this will wrap for home screen or authenticate

    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          if (user == null) {
            // User is not signed in, navigate to the sign-in screen
            return const Authenticate();
          } else {
            // User is signed in, navigate to the home screen
            return const Home();
          }
        } else {
          // Still waiting for the connection to establish
          return const LoadingScreen();
        }
      },
    );
  }
}
