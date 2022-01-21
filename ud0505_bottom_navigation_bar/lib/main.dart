import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ud0505_bottom_navigation_bar/models/people_response.dart';
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
        // When navigating to the "/" route, build the FirstScreen widget.
        // '/people': (context) => const People(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        // '/second': (context) => const SecondScreen(),
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
  late Future<List<People>> charactersList;

  ////////INIT//////////
  @override
  void initState() {
    charactersList = fetchPeople();
    super.initState();
  }
  /////////INIT/////////

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Personajes',
      style: optionStyle,
    ),
    Text(
      'Lugares',
      style: optionStyle,
    ),
    Text(
      'Episodios',
      style: optionStyle,
    ),
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
            _changePage()
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

  Future<List<People>> fetchPeople() async {
    final response =
        await http.get(Uri.parse('https://rickandmortyapi.com/api/character/'));

    if (response.statusCode == 200) {
      return PeopleResponse.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception("Oh geez Rick... there's nobody here.");
    }
  }

  Widget _changePage() {
    switch (_selectedIndex) {
      case 0:
        return PeoplePage(peopleListFuture: charactersList);
      case 1:
        return LocationsPage();
      case 2:
        return EpisodesPage();
    }

    return PeoplePage();
  }
}
