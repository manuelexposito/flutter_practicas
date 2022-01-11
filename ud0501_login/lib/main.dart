import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFE62F16)),
      color: const Color(0xFFE62F16),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            children: [
              Image.asset(
                'assets/images/path_logo.png',
                fit: BoxFit.cover,
                width: 180,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 130),
                child: Text(
                  'Beautiful, Private Sharing',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.5), fontSize: 15),
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200.0,
                child: Container(
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.only(bottom: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text('Sign Up',
                          style: TextStyle(
                              color: Color(0xFFE62F16),
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    )),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 8),
                child: Text(
                  'Already have a Path account?',
                  style: TextStyle(color: Colors.white.withOpacity(0.5)),
                ),
              ),
              SizedBox(
                width: 200.0,
                child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white.withOpacity(0.5))),
                  child: Center(
                    child: Text('Log In',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 20)),
                  ),
                ),
              ),
              Container(
                width: 200.0,
                margin: EdgeInsets.only(bottom: 40),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "By using Path, you agree to Path's ",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.5), fontSize: 12),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Terms of Use',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.white)),
                        TextSpan(text: ' and '),
                        TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.white))
                      ],
                    )),
              )
            ],
          )
        ],
      ),
    ));
  }
}
