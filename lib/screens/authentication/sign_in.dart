import 'package:flutter/material.dart';
import 'package:project_with_firebase/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  const SignIn({required this.toggleView});
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    String email = '';
    String password = '';
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 166, 117, 43),
          title: const Text('Firebase Project'),
          centerTitle: true,
          elevation: 0.0,
          actions: <Widget>[
            ElevatedButton.icon(
              onPressed: () async {
                widget.toggleView();
              },
              icon: const Icon(Icons.person),
              label: const Text(
                'Rigister',
                style: TextStyle(color: Colors.black),
              ),
              style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Color.fromARGB(255, 166, 117, 43)),
                elevation: MaterialStatePropertyAll(0.0),
                iconSize: MaterialStatePropertyAll(20),
              ),
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'LOG IN',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                TextFormField(
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),
                TextFormField(onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                }),
                ElevatedButton(
                    onPressed: () async {
                      await _auth.signInWithEmailAndPassword(email, password);
                    },
                    child: Text('Sign In')),
              ],
            ),
          ),
        ));
  }
}
