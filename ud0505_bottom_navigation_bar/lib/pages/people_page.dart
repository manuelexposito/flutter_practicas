import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ud0505_bottom_navigation_bar/models/people_response.dart';
import 'package:http/http.dart' as http;
import 'package:ud0505_bottom_navigation_bar/styles/styles.dart';

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
          return Center(child: CircularProgressIndicator());
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
        color: Color(0xFF3d3e43),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Row(
          children: [
            //FOTO
            Image.network(person.image),
            //INFO
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 230,
                      child: Text(
                        person.name,
                        style: StylesApp.nameTitle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    colorStatus(person.status),
                    RichText(
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: person.status, style: StylesApp.subTitle),
                          const TextSpan(
                              text: ' - ', style: StylesApp.subTitle),
                          TextSpan(
                              text: person.species, style: StylesApp.subTitle)
                        ],
                      ),
                    ),
                    const Text('Last known location: ', style: StylesApp.infoTitle),
                    Text(person.location.name, style: StylesApp.secondaryInfo,),
                    const Text('First seen in:', style: StylesApp.infoTitle,),
                    //falta el capitulo, que necesita sacarlo de una petición
                    //Text(person.origin.name, style: StylesApp.secondaryInfo)

                  ]),
            )
          ],
        ),
      ),
    );
  }

  Widget colorStatus(String status){
    if(status.contains('Alive')){
      return Icon(Icons.circle, color: Colors.green);
    } else if(status.contains('Dead')){
      return Icon(Icons.circle, color: Colors.red);
    } else{
      return Icon(Icons.circle, color: Colors.orange);
    }
  }


}
