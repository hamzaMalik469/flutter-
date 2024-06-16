import 'package:flutter/material.dart';

import '../../services/auth.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 5, 117, 208),
        title: const Text('Firebase project'),
        centerTitle: true,
        actions: <Widget>[
          ElevatedButton.icon(
            onPressed: () async {
              await _auth.signOut();
            },
            icon: const Icon(Icons.person),
            label: const Text('Log out'),
            style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 5, 117, 208)),
              elevation: MaterialStatePropertyAll(0.0),
              iconSize: MaterialStatePropertyAll(20),
            ),
          ),
        ],
      ),
    );
  }
}
