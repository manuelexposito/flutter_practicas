import 'package:flutter/material.dart';
import 'package:ud0506_login_form/styles/styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello Again!', style: StyleApp.title,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100.0),
              child: Text("Welcome back you've been missed!", style: StyleApp.subtitle, textAlign: TextAlign.center,),
            ),
            //EMAIL
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      helperText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ), //CONTRASEÑA
                  TextFormField(
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      hintText: 'Contraseña',
                      helperText: 'Contraseña',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
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
                ],
              ),
            ),
            Text('Recovery password'),
            
            //--OR CONTINUE WITH--//
            Text('Or continue with'),
            //ROW CON TRES BOTONES: GOOGLE, APPLE, FACEBOOK
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //GOOGLE
                _cardIcon(Icon(Icons.email)),
                //APPLE
                _cardIcon(Icon(Icons.ac_unit)),
                //FACEBOOK
                _cardIcon(Icon(Icons.chair)),
              ],
            ),

            //NOT A MEMBER? JOIN
            RichText(
                text: const TextSpan(children: <TextSpan>[
              TextSpan(text: 'Not a member?', style: TextStyle(color: Colors.black)),
              TextSpan(
                  text: ' Register now',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue)),
            ]))
          ],
        ));
  }

  Widget _cardIcon(Icon icon) {
    return Container(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(width: 3.0, color: Colors.white),
          primary: Colors.black87,
          minimumSize: Size(88, 36),
          padding: EdgeInsets.all(20),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
        // Within the `FirstScreen` widget
        onPressed: () {},
        child: icon,
      ),
    );
  }
}
