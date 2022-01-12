import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:ud0502_login_2/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/pexels-nathan-cowley-1199590.jpg',
            fit: BoxFit.cover,
          ),
          Positioned(
              top: 40,
              right: 20,
              child: RichText(
                  text: TextSpan(
                      text: 'Skip',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: AppStyle.mediumTextWeight),
                      recognizer: TapGestureRecognizer()))),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //LOGO
              Image.asset(
                'assets/images/red-bull-logo-512x512.png',
                width: 250,
              ),
              //SIGN IN TO GET THE MOST OF RED BULL
              Container(
                margin: AppStyle.dividerMargin,
                width: 350,
                child: Text(
                  'Sign in to get the most of Red Bull',
                  style: AppStyle.textTitle,
                  textAlign: TextAlign.center,
                ),
              ),
              //CREATE AN ACCOUNT TO SAVE FAV...
              Container(
                  margin: AppStyle.dividerMargin,
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                      'Create an account to save favorites and download videos to watch anytime you want.',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: AppStyle.smallTextSize),
                      textAlign: TextAlign.center)),
              //LOGIN FACEBOOK
              Container(
                margin: AppStyle.dividerMargin,
                child: SignInButtonBuilder(
                    backgroundColor: AppStyle.facebookColor,
                    padding: AppStyle.buttonPadding,
                    onPressed: () {},
                    icon: Icons.facebook,
                    text: 'Continue with Facebook'),
              ),
              //LOGIN GOOGLE
              SignInButton(Buttons.Google,
                  padding: AppStyle.buttonPadding,
                  text: 'Continue with Google',
                  onPressed: () {}),
              //CONTINUE WITH EMAIL
              Container(
                margin: AppStyle.dividerMargin,
                child: Text(
                  'Continue with Email',
                  style: AppStyle.signInGrayText,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
