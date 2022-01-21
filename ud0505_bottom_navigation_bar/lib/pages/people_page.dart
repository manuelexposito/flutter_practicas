import 'package:flutter/material.dart';
import 'package:ud0505_bottom_navigation_bar/models/people_response.dart';
import 'package:http/http.dart' as http;

class PeoplePage extends StatelessWidget {
  PeoplePage({Key? key, Future<List<People>>? peopleListFuture}) : super(key: key);

  late Future<List<People>> peopleListFetched;
  //final List<People> peopleListFetched;
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<People>>(
        future: peopleListFetched,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return peopleList(snapshot.data!);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        });
  }

  Widget peopleList(List<People> peopleList) {
    return Container(
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: peopleList.length,
          itemBuilder: (context, index) {
            return peopleCard(peopleList.elementAt(index));
          }),
    );
  }

  Widget peopleCard(People person) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        children: [
          //FOTO
          Image.network(person.image),
          //INFO
          Column(
            children: [Text(person.name), Text(person.status)],
          )
        ],
      ),
    );
  }
}


