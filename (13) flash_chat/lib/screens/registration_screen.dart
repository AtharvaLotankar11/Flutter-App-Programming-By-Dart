import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';  // Import flutter_spinkit for spinner

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  late String email;  // Using 'late' to indicate the variable will be assigned later
  late String password;  // Using 'late' to indicate the variable will be assigned later

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                email = value;
              },
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                password = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password'),
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              title: 'Register',
              colour: Colors.blueAccent,
              onPressed: () async {
                setState(() {
                  showSpinner = true;
                });
                try {
                  // Directly call createUserWithEmailAndPassword and navigate
                  await _auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  // After successful registration, navigate to ChatScreen
                  Navigator.pushNamed(context, ChatScreen.id);
                } catch (e) {
                  print(e); // Handle any registration errors
                } finally {
                  setState(() {
                    showSpinner = false;
                  });
                }
              },
            ),
            // Show spinner while showSpinner is true
            if (showSpinner)
              Center(
                child: SpinKitRing(
                  color: Colors.blueAccent,  // Customize the color
                  size: 50.0,  // Customize the size
                ),
              ),
          ],
        ),
      ),
    );
  }
}
