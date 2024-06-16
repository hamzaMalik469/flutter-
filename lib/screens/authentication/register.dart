import 'package:flutter/material.dart';
import 'package:project_with_firebase/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    final _formkey = GlobalKey<FormState>();
    String email = '';
    String password = '';
    String error = '';
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 211, 168, 39),
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
              label: const Text('Login'),
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
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Register',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'Please Enter an email' : null,
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
                TextFormField(onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                }),
                ElevatedButton(
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        dynamic result =
                            await _auth.RegisterWithEmailAndPassword(
                                email, password);
                        if (result == null) {
                          setState(() {
                            error = 'Please Enter the Valid Email';
                          });
                        }
                      }
                    },
                    child: const Text('Sign Up')),
              ],
            ),
          ),
        ));
  }
}
