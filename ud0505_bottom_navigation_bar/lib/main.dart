
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ud0505_bottom_navigation_bar/pages/episodes_page.dart';
import 'package:ud0505_bottom_navigation_bar/pages/locations_page.dart';
import 'package:ud0505_bottom_navigation_bar/pages/people_page.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Rick & Morty'),
      initialRoute: '/',
      routes: {
      },
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
 

  int _selectedIndex = 0;
 
  static const List<Widget> _widgetOptions = <Widget>[
    PeoplePage(),
    LocationsPage(),
    EpisodesPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Stack(
          children: [
            //TODO: Buscar imagen
            //Image.network('https://1.bp.blogspot.com/-MqAaujbA00M/W0vPdFLp8jI/AAAAAAAAHug/oen0HzB02Dw9w8mUOX28kHsZpxKg4tx7QCLcBGAs/s1600/Rick%2B%2526%2BMorty.jpg',fit: BoxFit.contain),
            _widgetOptions.elementAt(_selectedIndex)
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Personajes',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.placeOfWorship),
              label: 'Lugares',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.film),
              label: 'Episodios',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue[800],
          onTap: _onItemTapped,
        ));
  }



}
