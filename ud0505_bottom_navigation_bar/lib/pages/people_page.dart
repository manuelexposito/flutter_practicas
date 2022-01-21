

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ud0505_bottom_navigation_bar/models/people_response.dart';
import 'package:http/http.dart' as http;

class PeoplePage extends StatelessWidget {
  const PeoplePage({Key? key}) : super(key: key);

  
  //static late Future<List<People>> peopleListFetched;
  //final List<People> peopleListFetched;
  
  


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<People>>(
        future: fetchPeople(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return peopleList(snapshot.data!);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return  Center(child: CircularProgressIndicator());
        });
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

  Widget peopleList(List<People> peopleList) {
    return Container(
      height: 800,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: peopleList.length,
          itemBuilder: (context, index) {
            return peopleCard(peopleList.elementAt(index));
          }),
    );
  }

  Widget peopleCard(People person) {
    return Container(
      height: 135,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Row(
          children: [
            //FOTO
            Image.network(person.image),
            //INFO
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text(person.name), Text(person.status)],
            )
          ],
        ),
      ),
    );
  }
}


