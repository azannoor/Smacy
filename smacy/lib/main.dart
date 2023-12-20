import 'package:flutter/material.dart';
import 'package:smacy/bottomNavBar.dart';
import 'package:smacy/register.dart';
import 'package:smacy/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(11, 26, 13, 1),
        primaryColor: const Color.fromRGBO(173, 225, 0, 1),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('picture/a2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: 500,
            margin: EdgeInsets.only(top: 0),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.black.withOpacity(0.3),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            )),
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(20, 500, 0, 0),
                child: Text(
                  'Watch Movies',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    fontFamily: 'Archivo',
                  ),
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(18, 0, 85, 0),
                //color: Colors.red,
                child: Text(
                  'For Free',
                  style: TextStyle(
                    color: Color.fromARGB(255, 127, 232, 28),
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    fontFamily: 'Archivo',
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 600,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 127, 232, 28),
                      elevation: 3,
                      side: BorderSide(
                          width: 1, color: Color.fromARGB(255, 127, 232, 28)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      padding: EdgeInsets.fromLTRB(140, 13, 140, 13),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => register()));
                    },
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Archivo',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 80),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          elevation: 3,
                          side: BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 127, 232, 28)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          padding: EdgeInsets.fromLTRB(165, 13, 165, 13)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => loginform()));
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Color.fromARGB(255, 127, 232, 28),
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Archivo',
                        ),
                      ),
                    ),
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
