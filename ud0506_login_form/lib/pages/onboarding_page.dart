import 'package:flutter/material.dart';
import 'package:ud0506_login_form/styles/styles.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);
  //final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleApp.bgWhite,
      body: Container(
        //alignment: Alignment.center,
        padding: EdgeInsets.all(15.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 400,
                width: 400,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Image.asset('assets/images/portada.png',
                      fit: BoxFit.cover),
                )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.0),
              child: Text(
                'Discover your Dream job Here',
                textAlign: TextAlign.center,
                style: StyleApp.title,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 60.0),
              child: Text(
                'Explore all the most exiting jobs roles based on your interest And study major',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              height: 50,
              width: 220,
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Stack(
                alignment: Alignment.centerLeft,
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //DOS BOTONES
                  Container(
                    margin: EdgeInsets.only(left: 100),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(width: 1.0, color: Colors.white),
                        backgroundColor: Colors.grey[400],
                        primary: Colors.black87,
                        minimumSize: Size(88, 36),
                        padding: EdgeInsets.symmetric(
                            horizontal: 38.0, vertical: 16.5),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      // Within the `FirstScreen` widget
                      onPressed: () {
                        // Navigate to the second screen using a named route.
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text('Sign In'),
                    ),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      primary: Colors.black87,
                      minimumSize: Size(88, 36),
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 16.5),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Text('Register'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
