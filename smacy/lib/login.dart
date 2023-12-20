import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smacy/bottomNavBar.dart';
import 'package:smacy/download.dart';
import 'package:smacy/register.dart';
import 'package:smacy/home.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smacy/utils/utils.dart';
import 'main.dart';

class loginform extends StatefulWidget {
  const loginform({super.key});

  @override
  loginform_ createState() => loginform_();
}

class loginform_ extends State<loginform> {
  bool loading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  void login() {
    setState(() {
      loading = true;
    });
    _auth
        .signInWithEmailAndPassword(
            email: _emailTextController.text,
            password: _passwordTextController.text)
        .then((value) {
      Utils().toastMessage("Login Success");
      setState(() {
        loading = false;
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => navBar()),
      );
    }).onError((error, stackTrace) {
      Utils().toastMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            child: Form(
              key: _formKey,
              child: Column(
                      children: [
              SizedBox(height: 55),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 300, 0),
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    );
                  },
                ),
              ),
              SizedBox(height: 50),
              Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1.0,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Archivo',
                  ),
                ),
              ),
              SizedBox(height: 50),
              Container(
                padding: EdgeInsets.only(right: 295),
                child: Text(
                  'Email',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Archivo',
                  ),
                ),
              ),
              SizedBox(height: 5),
              Center(
                child: SizedBox(
                    width: 340,
                    height: 72,
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailTextController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
            
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        //labelText: 'Email',
                        hintText: 'example@mail.com',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(right: 270),
                child: Text(
                  'Password',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Archivo',
                  ),
                ),
              ),
              SizedBox(height: 5),
              Center(
                child: SizedBox(
                    width: 340,
                    height: 72,
                    child: TextField(
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordTextController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        //labelText: 'Email',
                        hintText: 'Password',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    )),
              ),
              SizedBox(height: 4),
              Container(
                padding: EdgeInsets.only(right: 220),
                child: Text(
                  'Forget Password?',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Archivo',
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 127, 232, 28),
                      elevation: 3,
                      side: BorderSide(
                          width: 1, color: Color.fromARGB(255, 127, 232, 28)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.fromLTRB(148, 13, 148, 13)),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      login();
                    }
                  },
                  child: loading?CircularProgressIndicator(color: Colors.white,):Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Archivo',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(left: 100),
                      child: Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Archivo',
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(11, 26, 13, 1),
                            padding: EdgeInsets.fromLTRB(0, 10, 10, 10)),
                        onPressed: () {},
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Color.fromARGB(255, 127, 232, 28),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Archivo',
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
                      ],
                    ),
            )));
  }
}
