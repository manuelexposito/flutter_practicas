import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ud0506_login_form/models/auth_model.dart';
import 'package:ud0506_login_form/styles/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

const _apiKey = "UDEMYANDROID";

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

bool _passwordVisible = false;

@override
void initState() {
  _passwordVisible = false;
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  Future<AuthResponse>? _futureSignup;
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                'Welcome!',
                style: StyleApp.title,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(
                  "New here?",
                  style: StyleApp.subtitle,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                  child: buildForm(
                      context)) //(_futureSignup == null) ? buildForm(context) : buildFutureBuilder(),)
            ],
          ),
        ));
  }
  //////////////////

  FutureBuilder<AuthResponse> buildFutureBuilder() {
    return FutureBuilder<AuthResponse>(
        future: _futureSignup,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Text(snapshot.data!.username));
          } else if (snapshot.hasError) {
            return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Center(child: Text('${snapshot.error}')));
          }
          return const Center(child: CircularProgressIndicator());
        });
  }

  Future<AuthResponse> _signUp(BuildContext context) async {
    AuthDto _authDto = AuthDto(
        username: usernameController.text,
        email: emailController.text,
        password: passwordController.text,
        code: _apiKey);

    Map<String, String> headers = {'Content-Type': 'application/json'};

    final response = await http.post(
        Uri.parse('https://www.minitwitter.com:3001/apiv1/auth/login'),
        headers: headers,
        body: jsonEncode(_authDto.toJson()));

    if (response.statusCode == 201) {
      return AuthResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('No se pudo registrar');
    }
  }

  /////////////////
  Widget buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 15.0),
            padding: EdgeInsets.symmetric(vertical: 1, horizontal: 15.0),
            decoration: StyleApp.formInput,
            child: TextFormField(
              controller: usernameController,
              decoration: InputDecoration(
                  hintText: 'Username', border: InputBorder.none),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 15.0),
            padding: EdgeInsets.symmetric(vertical: 1, horizontal: 15.0),
            decoration: StyleApp.formInput,
            child: TextFormField(
              controller: emailController,
              decoration:
                  InputDecoration(hintText: 'Email', border: InputBorder.none),
              validator: (value) {
                if (value == null || value.isEmpty || !value.contains('@')) {
                  return 'Wrong format';
                }
                return null;
              },
            ),
          ), //CONTRASEÑA
          Container(
            decoration: StyleApp.formInput,
            padding: EdgeInsets.symmetric(vertical: 1, horizontal: 15.0),
            child: TextFormField(
              controller: passwordController,
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
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.w800),
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
                /*ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("¡Registrado!")),
                );*/
                setState(() {
                  _futureSignup = _signUp(context);
                });
              }
            },
            child: const Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}
