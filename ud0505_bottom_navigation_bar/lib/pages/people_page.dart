import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ud0505_bottom_navigation_bar/models/episodes_response.dart';
import 'package:ud0505_bottom_navigation_bar/models/people_response.dart';
import 'package:http/http.dart' as http;
import 'package:ud0505_bottom_navigation_bar/styles/styles.dart';

class PeoplePage extends StatelessWidget {
  const PeoplePage({Key? key}) : super(key: key);

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
          return const Center(child: CircularProgressIndicator());
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


/////////////// ↓↓↓↓↓↓↓↓↓ GET CHARACTER FIRST EPISODE ↓↓↓↓↓↓↓↓ //////////
  Future<Episode> fetchFirstEpisode(People person) async {
    final response = await http.get(Uri.parse(person.episode.first));

    if (response.statusCode == 200) {
      return Episode.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(" * Burrp * Damn Mor'y, you messed up this data too.");
    }
  }

  Widget getFirstEpisode(People person, TextStyle nameStyle) {
    return FutureBuilder<Episode>(
        future: fetchFirstEpisode(person),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return getEpisodeName(snapshot.data!, nameStyle);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Text("Wait...");
        });
  }


  Text getEpisodeName(Episode episode, TextStyle style) {
    return Text(episode.name, style: style, overflow: TextOverflow.ellipsis);
  }
  ////////////	↑↑↑↑↑↑↑ GET CHARACTER FIRST EPISODE	↑↑↑↑↑↑↑↑ ////////



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
        color: const Color(0xFF3d3e43),
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
                    SizedBox(
                      width: StylesApp.infoWidth,
                      child: Text(
                        person.name,
                        style: StylesApp.nameTitle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      width: StylesApp.infoWidth,
                      child: Row(
                        children: [
                          colorStatus(person.status),
                          Text(
                            '  ${person.status} - ${person.species}',
                            style: StylesApp.subTitle,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5.0),
                      width: StylesApp.infoWidth,
                      child: const Text('Last known location: ',
                          style: StylesApp.infoTitle),
                    ),
                    SizedBox(
                      width: StylesApp.infoWidth,
                      child: Text(
                        person.location.name,
                        style: StylesApp.secondaryInfo,
                      ),
                    ),
                    const SizedBox(
                      width: StylesApp.infoWidth,
                      child: Text(
                        'First seen in:',
                        style: StylesApp.infoTitle,
                      ),
                    ),
                    SizedBox(
                      width: StylesApp.infoWidth,
                        child: getFirstEpisode(person, StylesApp.secondaryInfo))
                  ]),
            )
          ],
        ),
      ),
    );
  }

  //↓↓↓↓↓ Para sacar el color de estado de personaje ↓↓↓↓↓
  Widget colorStatus(String status) {
    if (status.contains('Alive')) {
      return const Icon(Icons.circle,
          size: StylesApp.iconWidth, color: Colors.green);
    } else if (status.contains('Dead')) {
      return const Icon(Icons.circle,
          size: StylesApp.iconWidth, color: Colors.red);
    } else {
      return const Icon(Icons.circle,
          size: StylesApp.iconWidth, color: Colors.orange);
    }
  }
}
