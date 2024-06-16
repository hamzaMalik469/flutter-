import 'package:flutter/material.dart';
import 'package:project_with_firebase/models/user.dart';
import 'package:project_with_firebase/screens/home/home.dart';
import 'package:project_with_firebase/screens/wrapper.dart';
import 'package:project_with_firebase/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UseR>.value(
      initialData: UseR(uid: 'Loading...'),
      value: AuthService().user,
      child: const MaterialApp(
        home: Home(),
      ),
    );
  }
}
