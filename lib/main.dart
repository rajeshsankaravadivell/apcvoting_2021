import 'package:flutter/material.dart';
import 'package:webapp/admin.dart';
import 'package:webapp/admin_page.dart';
import 'package:webapp/form.dart';
import 'package:webapp/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:webapp/multi_form.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AdminPage()
    );
  }
}

