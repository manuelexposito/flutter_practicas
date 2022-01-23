import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ud0505_bottom_navigation_bar/models/episodes_response.dart';
import 'package:http/http.dart' as http;
import 'package:ud0505_bottom_navigation_bar/models/locations_response.dart';

import 'package:ud0505_bottom_navigation_bar/models/people_response.dart';
import 'package:ud0505_bottom_navigation_bar/styles/styles.dart';

class LocationsPage extends StatelessWidget {
  const LocationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Place>>(
        future: fetchLocations(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return locationsList(snapshot.data!);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(child: CircularProgressIndicator());
        });
  }

  Future<List<Place>> fetchLocations() async {
    final response =
        await http.get(Uri.parse('https://rickandmortyapi.com/api/location/'));

    if (response.statusCode == 200) {
      return LocationsResponse.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception("Is this... the Void?");
    }
  }

  Widget locationsList(List<Place> locationsList) {
    return Container(
      height: 800,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: locationsList.length,
          itemBuilder: (context, index) {
            return placeCard(locationsList.elementAt(index));
          }),
    );
  }

  Widget placeCard(Place place) {
    return Container(
        height: 145,
        child: Card(
          clipBehavior: Clip.antiAlias,
          color: Color(0xFF3d3e43),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: StylesApp.infoWidth,
                    child: Text(place.name, style: StylesApp.nameTitle)),
                SizedBox(
                  width: StylesApp.infoWidth,
                  child: Text('${place.type} - ${place.dimension}', style: StylesApp.subTitle, overflow: TextOverflow.ellipsis,),
                ),
                Container(
                    margin: EdgeInsets.only(top: 10.0),
                    width: StylesApp.infoWidth,
                    child: const Text('Known residents: ', style: StylesApp.infoTitle)),
                 SizedBox(
                    width: StylesApp.infoWidth,
                    child: Text(place.residents.length.toString(), style: StylesApp.secondaryInfo)),
              ],
            ),
          ),
        ));
  }


}
