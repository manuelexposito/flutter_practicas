import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        Container(
          color: Colors.grey,
        ),
        Center(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 260),
              child: Card(
                child: Container(
                    padding: EdgeInsets.only(
                        left: 10, top: 30, bottom: 30, right: 130),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('20:55',
                                        style: TextStyle(fontSize: 20)),
                                    Text('SALIDA',
                                        style: TextStyle(fontSize: 10),
                                        textAlign: TextAlign.center)
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('22:05',
                                        style: TextStyle(fontSize: 20)),
                                    Text('LLEGADA',
                                        style: TextStyle(fontSize: 10),
                                        textAlign: TextAlign.center)
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      DecoratedBox(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 6, vertical: 3),
                                          child: Text(
                                            'MAD',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 3),
                                        child: Text('Madrid'),
                                      )
                                    ],
                                  ),
                                  RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan(children: [
                                        WidgetSpan(
                                            child: Image.asset(
                                                "assets/images/iberia.png",
                                                width: 20)),
                                        TextSpan(
                                            text: " Iberia 7448",
                                            style:
                                                TextStyle(color: Colors.grey))
                                      ])),
                                  Text(
                                    'Duración 2h 10m',
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ]),
                            Column(),
                            Row(
                                    children: [
                                      DecoratedBox(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 6, vertical: 3),
                                          child: Text(
                                            'LHR',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 3),
                                        child: Text('Londres'),
                                      )
                                    ],
                                  )
                          ],
                        )
                      ],
                    )),
              )),
        )
      ],
    ));
  }
}
