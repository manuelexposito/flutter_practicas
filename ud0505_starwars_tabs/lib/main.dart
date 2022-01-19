import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:ud0504_starwars/people_response.dart';
import 'package:ud0504_starwars/planet_response.dart';
import 'package:ud0504_starwars/styles.dart';

import 'people_response.dart';
import 'planet_response.dart';

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
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

//OPCIONES DE LISTA
enum ListSelection { characters, planets }

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//const String jsonPpl = '{"count":82,"next":"https://swapi.dev/api/people/?page=2&format=json","previous":null,"results":[{"name":"Luke Skywalker","height":"172","mass":"77","hair_color":"blond","skin_color":"fair","eye_color":"blue","birth_year":"19BBY","gender":"male","homeworld":"https://swapi.dev/api/planets/1/","films":["https://swapi.dev/api/films/1/","https://swapi.dev/api/films/2/","https://swapi.dev/api/films/3/","https://swapi.dev/api/films/6/"],"species":[],"vehicles":["https://swapi.dev/api/vehicles/14/","https://swapi.dev/api/vehicles/30/"],"starships":["https://swapi.dev/api/starships/12/","https://swapi.dev/api/starships/22/"],"created":"2014-12-09T13:50:51.644000Z","edited":"2014-12-20T21:17:56.891000Z","url":"https://swapi.dev/api/people/1/"},{"name":"C-3PO","height":"167","mass":"75","hair_color":"n/a","skin_color":"gold","eye_color":"yellow","birth_year":"112BBY","gender":"n/a","homeworld":"https://swapi.dev/api/planets/1/","films":["https://swapi.dev/api/films/1/","https://swapi.dev/api/films/2/","https://swapi.dev/api/films/3/","https://swapi.dev/api/films/4/","https://swapi.dev/api/films/5/","https://swapi.dev/api/films/6/"],"species":["https://swapi.dev/api/species/2/"],"vehicles":[],"starships":[],"created":"2014-12-10T15:10:51.357000Z","edited":"2014-12-20T21:17:50.309000Z","url":"https://swapi.dev/api/people/2/"},{"name":"R2-D2","height":"96","mass":"32","hair_color":"n/a","skin_color":"white, blue","eye_color":"red","birth_year":"33BBY","gender":"n/a","homeworld":"https://swapi.dev/api/planets/8/","films":["https://swapi.dev/api/films/1/","https://swapi.dev/api/films/2/","https://swapi.dev/api/films/3/","https://swapi.dev/api/films/4/","https://swapi.dev/api/films/5/","https://swapi.dev/api/films/6/"],"species":["https://swapi.dev/api/species/2/"],"vehicles":[],"starships":[],"created":"2014-12-10T15:11:50.376000Z","edited":"2014-12-20T21:17:50.311000Z","url":"https://swapi.dev/api/people/3/"},{"name":"Darth Vader","height":"202","mass":"136","hair_color":"none","skin_color":"white","eye_color":"yellow","birth_year":"41.9BBY","gender":"male","homeworld":"https://swapi.dev/api/planets/1/","films":["https://swapi.dev/api/films/1/","https://swapi.dev/api/films/2/","https://swapi.dev/api/films/3/","https://swapi.dev/api/films/6/"],"species":[],"vehicles":[],"starships":["https://swapi.dev/api/starships/13/"],"created":"2014-12-10T15:18:20.704000Z","edited":"2014-12-20T21:17:50.313000Z","url":"https://swapi.dev/api/people/4/"},{"name":"Leia Organa","height":"150","mass":"49","hair_color":"brown","skin_color":"light","eye_color":"brown","birth_year":"19BBY","gender":"female","homeworld":"https://swapi.dev/api/planets/2/","films":["https://swapi.dev/api/films/1/","https://swapi.dev/api/films/2/","https://swapi.dev/api/films/3/","https://swapi.dev/api/films/6/"],"species":[],"vehicles":["https://swapi.dev/api/vehicles/30/"],"starships":[],"created":"2014-12-10T15:20:09.791000Z","edited":"2014-12-20T21:17:50.315000Z","url":"https://swapi.dev/api/people/5/"},{"name":"Owen Lars","height":"178","mass":"120","hair_color":"brown, grey","skin_color":"light","eye_color":"blue","birth_year":"52BBY","gender":"male","homeworld":"https://swapi.dev/api/planets/1/","films":["https://swapi.dev/api/films/1/","https://swapi.dev/api/films/5/","https://swapi.dev/api/films/6/"],"species":[],"vehicles":[],"starships":[],"created":"2014-12-10T15:52:14.024000Z","edited":"2014-12-20T21:17:50.317000Z","url":"https://swapi.dev/api/people/6/"},{"name":"Beru Whitesun lars","height":"165","mass":"75","hair_color":"brown","skin_color":"light","eye_color":"blue","birth_year":"47BBY","gender":"female","homeworld":"https://swapi.dev/api/planets/1/","films":["https://swapi.dev/api/films/1/","https://swapi.dev/api/films/5/","https://swapi.dev/api/films/6/"],"species":[],"vehicles":[],"starships":[],"created":"2014-12-10T15:53:41.121000Z","edited":"2014-12-20T21:17:50.319000Z","url":"https://swapi.dev/api/people/7/"},{"name":"R5-D4","height":"97","mass":"32","hair_color":"n/a","skin_color":"white, red","eye_color":"red","birth_year":"unknown","gender":"n/a","homeworld":"https://swapi.dev/api/planets/1/","films":["https://swapi.dev/api/films/1/"],"species":["https://swapi.dev/api/species/2/"],"vehicles":[],"starships":[],"created":"2014-12-10T15:57:50.959000Z","edited":"2014-12-20T21:17:50.321000Z","url":"https://swapi.dev/api/people/8/"},{"name":"Biggs Darklighter","height":"183","mass":"84","hair_color":"black","skin_color":"light","eye_color":"brown","birth_year":"24BBY","gender":"male","homeworld":"https://swapi.dev/api/planets/1/","films":["https://swapi.dev/api/films/1/"],"species":[],"vehicles":[],"starships":["https://swapi.dev/api/starships/12/"],"created":"2014-12-10T15:59:50.509000Z","edited":"2014-12-20T21:17:50.323000Z","url":"https://swapi.dev/api/people/9/"},{"name":"Obi-Wan Kenobi","height":"182","mass":"77","hair_color":"auburn, white","skin_color":"fair","eye_color":"blue-gray","birth_year":"57BBY","gender":"male","homeworld":"https://swapi.dev/api/planets/20/","films":["https://swapi.dev/api/films/1/","https://swapi.dev/api/films/2/","https://swapi.dev/api/films/3/","https://swapi.dev/api/films/4/","https://swapi.dev/api/films/5/","https://swapi.dev/api/films/6/"],"species":[],"vehicles":["https://swapi.dev/api/vehicles/38/"],"starships":["https://swapi.dev/api/starships/48/","https://swapi.dev/api/starships/59/","https://swapi.dev/api/starships/64/","https://swapi.dev/api/starships/65/","https://swapi.dev/api/starships/74/"],"created":"2014-12-10T16:16:29.192000Z","edited":"2014-12-20T21:17:50.325000Z","url":"https://swapi.dev/api/people/10/"}]}';

//const String jsonPlanets ='{"count":60,"next":"https://swapi.dev/api/planets/?page=2&format=json","previous":null,"results":[{"name":"Tatooine","rotation_period":"23","orbital_period":"304","diameter":"10465","climate":"arid","gravity":"1 standard","terrain":"desert","surface_water":"1","population":"200000","residents":["https://swapi.dev/api/people/1/","https://swapi.dev/api/people/2/","https://swapi.dev/api/people/4/","https://swapi.dev/api/people/6/","https://swapi.dev/api/people/7/","https://swapi.dev/api/people/8/","https://swapi.dev/api/people/9/","https://swapi.dev/api/people/11/","https://swapi.dev/api/people/43/","https://swapi.dev/api/people/62/"],"films":["https://swapi.dev/api/films/1/","https://swapi.dev/api/films/3/","https://swapi.dev/api/films/4/","https://swapi.dev/api/films/5/","https://swapi.dev/api/films/6/"],"created":"2014-12-09T13:50:49.641000Z","edited":"2014-12-20T20:58:18.411000Z","url":"https://swapi.dev/api/planets/1/"},{"name":"Alderaan","rotation_period":"24","orbital_period":"364","diameter":"12500","climate":"temperate","gravity":"1 standard","terrain":"grasslands, mountains","surface_water":"40","population":"2000000000","residents":["https://swapi.dev/api/people/5/","https://swapi.dev/api/people/68/","https://swapi.dev/api/people/81/"],"films":["https://swapi.dev/api/films/1/","https://swapi.dev/api/films/6/"],"created":"2014-12-10T11:35:48.479000Z","edited":"2014-12-20T20:58:18.420000Z","url":"https://swapi.dev/api/planets/2/"},{"name":"Yavin IV","rotation_period":"24","orbital_period":"4818","diameter":"10200","climate":"temperate, tropical","gravity":"1 standard","terrain":"jungle, rainforests","surface_water":"8","population":"1000","residents":[],"films":["https://swapi.dev/api/films/1/"],"created":"2014-12-10T11:37:19.144000Z","edited":"2014-12-20T20:58:18.421000Z","url":"https://swapi.dev/api/planets/3/"},{"name":"Hoth","rotation_period":"23","orbital_period":"549","diameter":"7200","climate":"frozen","gravity":"1.1 standard","terrain":"tundra, ice caves, mountain ranges","surface_water":"100","population":"unknown","residents":[],"films":["https://swapi.dev/api/films/2/"],"created":"2014-12-10T11:39:13.934000Z","edited":"2014-12-20T20:58:18.423000Z","url":"https://swapi.dev/api/planets/4/"},{"name":"Dagobah","rotation_period":"23","orbital_period":"341","diameter":"8900","climate":"murky","gravity":"N/A","terrain":"swamp, jungles","surface_water":"8","population":"unknown","residents":[],"films":["https://swapi.dev/api/films/2/","https://swapi.dev/api/films/3/","https://swapi.dev/api/films/6/"],"created":"2014-12-10T11:42:22.590000Z","edited":"2014-12-20T20:58:18.425000Z","url":"https://swapi.dev/api/planets/5/"},{"name":"Bespin","rotation_period":"12","orbital_period":"5110","diameter":"118000","climate":"temperate","gravity":"1.5 (surface), 1 standard (Cloud City)","terrain":"gas giant","surface_water":"0","population":"6000000","residents":["https://swapi.dev/api/people/26/"],"films":["https://swapi.dev/api/films/2/"],"created":"2014-12-10T11:43:55.240000Z","edited":"2014-12-20T20:58:18.427000Z","url":"https://swapi.dev/api/planets/6/"},{"name":"Endor","rotation_period":"18","orbital_period":"402","diameter":"4900","climate":"temperate","gravity":"0.85 standard","terrain":"forests, mountains, lakes","surface_water":"8","population":"30000000","residents":["https://swapi.dev/api/people/30/"],"films":["https://swapi.dev/api/films/3/"],"created":"2014-12-10T11:50:29.349000Z","edited":"2014-12-20T20:58:18.429000Z","url":"https://swapi.dev/api/planets/7/"},{"name":"Naboo","rotation_period":"26","orbital_period":"312","diameter":"12120","climate":"temperate","gravity":"1 standard","terrain":"grassy hills, swamps, forests, mountains","surface_water":"12","population":"4500000000","residents":["https://swapi.dev/api/people/3/","https://swapi.dev/api/people/21/","https://swapi.dev/api/people/35/","https://swapi.dev/api/people/36/","https://swapi.dev/api/people/37/","https://swapi.dev/api/people/38/","https://swapi.dev/api/people/39/","https://swapi.dev/api/people/42/","https://swapi.dev/api/people/60/","https://swapi.dev/api/people/61/","https://swapi.dev/api/people/66/"],"films":["https://swapi.dev/api/films/3/","https://swapi.dev/api/films/4/","https://swapi.dev/api/films/5/","https://swapi.dev/api/films/6/"],"created":"2014-12-10T11:52:31.066000Z","edited":"2014-12-20T20:58:18.430000Z","url":"https://swapi.dev/api/planets/8/"},{"name":"Coruscant","rotation_period":"24","orbital_period":"368","diameter":"12240","climate":"temperate","gravity":"1 standard","terrain":"cityscape, mountains","surface_water":"unknown","population":"1000000000000","residents":["https://swapi.dev/api/people/34/","https://swapi.dev/api/people/55/","https://swapi.dev/api/people/74/"],"films":["https://swapi.dev/api/films/3/","https://swapi.dev/api/films/4/","https://swapi.dev/api/films/5/","https://swapi.dev/api/films/6/"],"created":"2014-12-10T11:54:13.921000Z","edited":"2014-12-20T20:58:18.432000Z","url":"https://swapi.dev/api/planets/9/"},{"name":"Kamino","rotation_period":"27","orbital_period":"463","diameter":"19720","climate":"temperate","gravity":"1 standard","terrain":"ocean","surface_water":"100","population":"1000000000","residents":["https://swapi.dev/api/people/22/","https://swapi.dev/api/people/72/","https://swapi.dev/api/people/73/"],"films":["https://swapi.dev/api/films/5/"],"created":"2014-12-10T12:45:06.577000Z","edited":"2014-12-20T20:58:18.434000Z","url":"https://swapi.dev/api/planets/10/"}]}';

class _MyHomePageState extends State<MyHomePage> {
  // List<Person> pplList = PeopleResponse.fromJson(jsonDecode(jsonPpl)).results;
  //List<Planet> planetList =PlanetResponse.fromJson(jsonDecode(jsonPlanets)).results;
  late Future<List<Person>> pplList;
  late Future<List<Planet>> planetList;
  ListSelection selectedList = ListSelection.characters;
  @override
  void initState() {
    pplList = fetchPeople();
    planetList = fetchPlanets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.people)),
                Tab(icon: Icon(Icons.circle))
              ],
            ),
            title: const Text('Star Wars'),
          ),
          body: Stack(
            children: [
              Image.network(
                'https://sm.mashable.com/mashable_in/photo/default/nasa-galaxy_9pu4.jpg',
                fit: BoxFit.fitHeight,
                height: MediaQuery.of(context).size.height,
              ),
              TabBarView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _getTitle('Personajes'),
                      FutureBuilder<List<Person>>(
                          future: pplList,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return _peopleList(snapshot.data!);
                            } else if (snapshot.hasError) {
                              return Text('${snapshot.error}');
                            }
                            return const CircularProgressIndicator();
                          })
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _getTitle('Planetas'),
                      FutureBuilder<List<Planet>>(
                          future: planetList,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return _planetList(snapshot.data!);
                            } else if (snapshot.hasError) {
                              return Text('${snapshot.error}');
                            }
                            return const CircularProgressIndicator();
                          })
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getTitle(String title) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 15),
        child: Text(title, style: Styles.textTitle));
  }

  Future<List<Person>> fetchPeople() async {
    final response = await http.get(Uri.parse('https://swapi.dev/api/people/'));

    if (response.statusCode == 200) {
      return PeopleResponse.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('No se cargó ningún personaje');
    }
  }

  Future<List<Planet>> fetchPlanets() async {
    final response =
        await http.get(Uri.parse('https://swapi.dev/api/planets/'));

    if (response.statusCode == 200) {
      return PlanetResponse.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('No se cargó ningún planeta');
    }
  }

  Widget _peopleList(List<Person> peopleList) {
    return Container(
        height: 270,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: peopleList.length,
            itemBuilder: (context, index) {
              return personCard(peopleList.elementAt(index),
                  'https://starwars-visualguide.com/assets/img/characters/${index + 1}.jpg');
            }));
  }

  Widget _planetList(List<Planet> planetList) {
    return Container(
        height: 205,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: planetList.length,
          itemBuilder: (context, index) {
            return _planetCard(planetList.elementAt(index),
                'https://starwars-visualguide.com/assets/img/planets/${index + 1}.jpg');
          },
        ));
  }

  Widget _planetCard(Planet planet, String url) {
    return Container(
      width: 170,
      child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: [
              Image.network(
                url,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.network(
                    'https://starwars-visualguide.com/assets/img/placeholder.jpg',
                    fit: BoxFit.fitWidth,
                    width: MediaQuery.of(context).size.width,
                    height: 165,
                  );
                },
              ),
              Text(
                planet.name,
                style: Styles.textName,
              )
            ],
          )),
    );
  }

  Widget personCard(Person person, String url) {
    return Container(
      width: 170,
      child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: [
              Image.network(
                url,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  person.name,
                  style: Styles.textName,
                ),
              ),
            ],
          )),
    );
  }

}
