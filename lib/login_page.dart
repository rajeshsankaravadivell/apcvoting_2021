
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:webapp/user_management.dart';
 ConfirmationResult confirmationResult;
final TextEditingController nameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final auth = FirebaseAuth.instance;
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var formkey = GlobalKey<FormState>();
  var passwordkey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  String email;
  String otp;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ModalProgressHUD(
      inAsyncCall:  showSpinner,
      child: Scaffold(
        appBar: AppBar(
          title: Text('APC COLLEGE VOTING'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/apc.jpg",
                  width: size.width,
                  height: size.height,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Powered By Digisailor',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.black),
                ),
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
                                  if (value.length < 5)
                                    return " Enter at least 8 character from your email";
                                  else
                                    return null;
                                },
                                controller: nameController,
                                onChanged: (value) {
                                  email = value;
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
                                    hintText: "Email ID",
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
                          // MaterialButton(
                          //   onPressed: () async{
                          //     print(phone);
                          //     FirebaseAuth auth = FirebaseAuth.instance;
                          //     confirmationResult =
                          //         await auth.signInWithPhoneNumber(phone,
                          //             RecaptchaVerifier(
                          //               container: 'recaptcha',
                          //               size: RecaptchaVerifierSize.compact,
                          //               theme: RecaptchaVerifierTheme.dark,
                          //             )
                          //         );
                          //   },
                          //   child: Text(
                          //     'Generate OTP',
                          //     style: TextStyle(
                          //         fontSize: 20,
                          //         fontWeight: FontWeight.bold,
                          //         color: Colors.pink),
                          //   ),
                          // ),
                          SizedBox(
                            height: 10,
                          ),
                          // Form(
                          //   key: passwordkey,
                          //   child: Padding(
                          //     padding: const EdgeInsets.symmetric(horizontal: 90),
                          //     child: TextFormField(
                          //       validator: (String value) {
                          //         if (value.length < 5)
                          //           return " Enter at least 8 character from your email";
                          //         else
                          //           return null;
                          //       },
                          //       controller: passwordController,
                          //       onChanged: (value) {
                          //         otp = value;
                          //       },
                          //       keyboardType: TextInputType.emailAddress,
                          //       decoration: InputDecoration(
                          //           border: OutlineInputBorder(
                          //             borderRadius: BorderRadius.all(
                          //               Radius.circular(32),
                          //             ),
                          //           ),
                          //           enabledBorder: OutlineInputBorder(
                          //             borderRadius: BorderRadius.all(
                          //               Radius.circular(32),
                          //             ),
                          //           ),
                          //           hintText: "OTP",
                          //           hintStyle: TextStyle(
                          //             color: Color(0xFF87837e),
                          //           ),
                          //           suffixIcon: Icon(Icons.confirmation_num),
                          //           filled: true,
                          //           focusColor: Colors.yellow),
                          //       style: GoogleFonts.lato(color: Colors.black),
                          //     ),
                          //   ),
                          // ),
                          SizedBox(height: 10,),
                          Material(
                            elevation: 5.0,
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(30.0),
                            child: MaterialButton(
                              onPressed: () async{
                               try{
                                  await auth.createUserWithEmailAndPassword(email: email, password: null).then((SignedInUser){
                                   UserManagement().StoreNewUser(SignedInUser, context);
                                 });
                                  setState(() {
                                    showSpinner = true;
                                  });
                               }
                               catch (e){
                                 print(e);
                               }
                               setState(() {
                                 formkey.currentState.validate();
                               });
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
}
