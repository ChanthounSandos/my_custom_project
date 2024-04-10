import 'package:flutter/material.dart';
import 'package:my_custom_project/startScreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyDhPP_5lBjDGyIA6o3mhjS1Wl5N1nhdNiA',
          appId: '1:647843101170:android:5ace5d6518ad19c1c5536b',
          messagingSenderId: 'messagingSenderId',
          projectId: 'mycustomfinalproject',
          storageBucket: 'mycustomfinalproject.appspot.com'
      )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: StartScreen()
    );
  }
}