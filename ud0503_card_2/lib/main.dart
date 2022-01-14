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
      children: [
        Container(
          color: Colors.grey,
        ),
        Card(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 180),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //ROW EL MAS BARATO, BUENA PUNTUACIÓN // 45 OFERTAS
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('El más barato. Buena puntuación',
                          style: TextStyle(
                              color: Colors.greenAccent[400],
                              fontWeight: FontWeight.w500)),
                      Text('45 ofertas', style: TextStyle(color: Colors.grey))
                    ],
                  ),
                ),
                //FOTO COCHE
                Image.asset('assets/images/car.jpg', width: 150),
                //NOMBRE
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 680,
                        child: Text(
                          'Mini',
                          style: TextStyle(fontSize: 17.0),
                        ),
                      ),
                      //ROW 2-3 PUERTAS · CITROEN ETC ETC
                      Row(
                        children: [
                          Text('2-3 puertas',
                              style: TextStyle(color: Colors.grey)),
                          Text('· Citroen C1 Diesel o similar',
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      //ROW ICONOS
                      Container(
                        width: 240,
                        //color: Colors.blue,
                        margin: EdgeInsets.only(right: 110),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Image.asset('assets/images/gear_shift.png',
                                      width: 20),
                                  Text('Man.'),
                                ],
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.all(5),
                                child: Row(children: [
                                  Icon(Icons.ac_unit, size: 15),
                                  Text('A/A')
                                ])),
                            Container(
                              margin: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    size: 15,
                                  ),
                                  Text('4')
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.luggage,
                                    size: 15,
                                  ),
                                  Text('1')
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                //ROW $35 + BOTON SELECCIONAR
                Divider(
                  color: Colors.grey,
                  height: 2,
                ),
                Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$35',
                          style: TextStyle(color: Colors.blue, fontSize: 15),
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          child: const Text(
                            'SELECCIONAR',
                            style: TextStyle(color: Colors.blue, fontSize: 15),
                          ),
                          onPressed: () {/* ... */},
                        )
                      ],
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5))
              ],
            ),
          ),
        )
      ],
    ));
  }
}
