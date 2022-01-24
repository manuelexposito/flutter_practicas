import 'package:flutter/material.dart';
import 'package:ud0506_login_form/pages/login_page.dart';
import 'package:ud0506_login_form/pages/onboarding_page.dart';
import 'package:ud0506_login_form/pages/signup_page.dart';

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
      initialRoute: "/",
      routes: {
        //'/' : (context) => const OnBoardingPage(),
        '/register' : (context) => const SignUpPage(),
        '/login': (context) => const LoginPage()
      },
      home: const MyHomePage(title: 'App'),
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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return const OnBoardingPage();
  }
}


/*

Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Hello Again!'),
        Text("Wellcome back you've been!"),
        //EMAIL
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ), //CONTRASEÑA
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
        Text('Recovery password'),
        //SUBMIT
        ElevatedButton(
          onPressed: () {
            // Validate returns true if the form is valid, or false otherwise.
            if (_formKey.currentState!.validate()) {
              // If the form is valid, display a snackbar. In the real world,
              // you'd often call a server or save the information in a database.
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Processing Data')),
              );
            }
          },
          child: const Text('Sign in'),
        ),
        //--OR CONTINUE WITH--//
        Text('Or continue with'),
        //ROW CON TRES BOTONES: GOOGLE, APPLE, FACEBOOK
        Row(
          children: [],
        ),
        //NOT A MEMBER? JOIN
        RichText(text: TextSpan(children: const <TextSpan>[]))
      ],
    ));

*/