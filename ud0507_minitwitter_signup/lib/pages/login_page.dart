import 'package:flutter/material.dart';
import 'package:ud0506_login_form/styles/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

bool _passwordVisible = false;

@override
void initState() {
  _passwordVisible = false;
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: StyleApp.bgWhite,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 60.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               Text(
                'Hello Again!',
                style: StyleApp.title,
              ),
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(
                  "Welcome back you've been missed!",
                  style: StyleApp.subtitle,
                  textAlign: TextAlign.center,
                ),
              ),
              //EMAIL
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 15.0),
                      padding:
                          EdgeInsets.symmetric(vertical: 2.5, horizontal: 15.0),
                      decoration: StyleApp.formInput,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Enter username',
                            border: InputBorder.none),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ), //CONTRASEÑA
                    Container(
                      decoration: StyleApp.formInput,
                      padding:
                          EdgeInsets.symmetric(vertical: 2.5, horizontal: 15.0),
                      child: TextFormField(
                        obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: 'Password',
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                })),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      //width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 150),
                      child: TextButton(
                        style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 13),
                            alignment: Alignment.centerRight),
                        onPressed: () {},
                        child: const Text(
                          'Recovery password',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),

                    //SUBMIT
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(50),
                        primary: StyleApp.primaryBtnColor,
                      ),
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

              //--OR CONTINUE WITH--//
              Text('Or continue with'),
              //ROW CON TRES BOTONES: GOOGLE, APPLE, FACEBOOK
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //GOOGLE
                  _btnIcon(FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.red,
                  )),
                  //APPLE
                  _btnIcon(FaIcon(FontAwesomeIcons.apple)),
                  //FACEBOOK
                  _btnIcon(FaIcon(
                    FontAwesomeIcons.facebook,
                    color: Colors.blue,
                  )),
                ],
              ),

              //NOT A MEMBER? JOIN
              RichText(
                  text: const TextSpan(children: <TextSpan>[
                TextSpan(
                    text: 'Not a member?',
                    style: TextStyle(color: Colors.black)),
                TextSpan(
                    text: ' Register now',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue)),
              ]))
            ],
          ),
        ));
  }

  Widget _btnIcon(Widget icon) {
    return Container(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(width: 3.0, color: Colors.white),
          primary: Colors.black87,
          minimumSize: Size(80, 36),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
