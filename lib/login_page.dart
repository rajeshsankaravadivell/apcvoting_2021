import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:webapp/User.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'admin_page.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:webapp/user_management.dart';

ConfirmationResult confirmationResult;
AnimationController _controller;
Animation<double> _animation;
String email;
String password;
var DocId;
final auth = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final referenceDataBase = FirebaseDatabase.instance;
  var scaffoldkey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();
  var passwordkey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  bool showSpinner = false;
  var dobController = new MaskedTextController(mask: '00/00/0000');
  var studentIdController = MaskedTextController(mask: '00000');
  @override
  Widget build(BuildContext context) {
    final ref = referenceDataBase.reference();
    Size size = MediaQuery.of(context).size;
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        key: scaffoldkey,
        appBar: AppBar(
          title: Text('APC COLLEGE VOTING'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Image.asset(
                    "assets/images/apc.jpg",

                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Powered By ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.black),
                ),
                digiimage(),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xFFFDF5E6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Column(
                        children: [
                          Form(
                            key: formkey,
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: TextFormField(
                                validator: (String value) {
                                  if (value.length < 4)
                                    return " Enter at 4 character from your student ID";
                                  else
                                    return null;
                                },
                                controller: studentIdController,
                                onChanged: (value) {
                                  email = value;
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(32),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(32),
                                      ),
                                    ),
                                    labelText: "Student ID",
                                    labelStyle: TextStyle(
                                      color: Color(0xFF87837e),
                                    ),
                                    hintStyle: TextStyle(
                                      color: Color(0xFF87837e),
                                    ),
                                    suffixIcon: Icon(Icons.email),
                                    filled: true,
                                    focusColor: Colors.yellow),
                                style: GoogleFonts.lato(color: Colors.black),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Form(
                            key: passwordkey,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              child: TextFormField(
                                obscureText: false,
                                validator: (String value) {
                                  if (value.length < 5)
                                    return " enter your DOB (month/date/last 2 digit of year)";
                                  else
                                    return null;
                                },
                                controller: dobController,
                                onChanged: (value) {
                                  password = value;
                                },
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(32),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(32),
                                      ),
                                    ),
                                    labelText: "  (mm/dd/yyyy)",
                                    labelStyle: TextStyle(
                                      color: Color(0xFF87837e),
                                    ),
                                    hintStyle: TextStyle(
                                      color: Color(0xFF87837e),
                                    ),
                                    suffixIcon: Icon(Icons.security_outlined),
                                    filled: true,
                                    focusColor: Colors.yellow),
                                style: GoogleFonts.lato(color: Colors.black),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Material(
                            elevation: 5.0,
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(30.0),
                            child: MaterialButton(
                              onPressed: () async {
                                try {
                                  authorizeAccess(context);
                                  setState(() {
                                    showSpinner = false;
                                  });
                                } catch (e) {
                                  print(e);
                                }
                              },
                              child: Text(
                                'LOGIN',
                                style: TextStyle(color: Colors.white),
                              ),
                              minWidth: 100,
                              height: 42.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    height: 300,
                    width: 500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  authorizeAccess(BuildContext context) {
    Firestore.instance.collection('/mycollection').get().then((value) => print(value.size));
    Firestore.instance
        .collection('/mycollection')
        .where('id', isEqualTo: email)
        .getDocuments()
        .then((docs) {
      if (docs.documents[0].exists) {
        if (docs.documents[0].get('DOB') == password) {
          if (docs.documents[0].get('login_check') == '0') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserPage(),
              ),
            );
          } else {
            print('error');
            var snackbar = SnackBar(
                content:
                    Text('your vote had been counted already sorry you cannot vote again'));
            scaffoldkey.currentState.showSnackBar(snackbar);
            setState(() {
              formkey.currentState.validate();
              passwordkey.currentState.validate();
            });
          }

          print(snapshot.data.docs.length);
          // print(docs.documents[0].id);
          DocId = docs.documents[0].id;
          print(DocId);
        } else {
          print('error');
          var snackbar = SnackBar(
              content: Text('please check Student ID and Date Of Birth'));
          scaffoldkey.currentState.showSnackBar(snackbar);
          setState(() {
            formkey.currentState.validate();
            passwordkey.currentState.validate();
          });
        }
      }
    });
  }
}

Widget digiimage() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Expanded(
          child: ScaleTransition(
        scale: _animation,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Container(
            child: Image(
              image: AssetImage('assets/images/digi.jpg'),
              fit: BoxFit.cover,
            ),height: 400,width: 400,
          ),
        ),
      )),
    ],
  );
}
