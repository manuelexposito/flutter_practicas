import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ud0505_bottom_navigation_bar/models/episodes_response.dart';
import 'package:http/http.dart' as http;
import 'package:ud0505_bottom_navigation_bar/styles/styles.dart';

class EpisodesPage extends StatelessWidget {
  const EpisodesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Episode>>(
        future: fetchEpisodes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return episodeList(snapshot.data!);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(child: CircularProgressIndicator());
        });
  }

  Future<List<Episode>> fetchEpisodes() async {
    final response =
        await http.get(Uri.parse('https://rickandmortyapi.com/api/episode/'));

    if (response.statusCode == 200) {
      return EpisodesResponse.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception("Nah. Somethin' went wrong.");
    }
  }

  Widget episodeList(List<Episode> episodeList) {
    return Container(
      height: 800,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: episodeList.length,
          itemBuilder: (context, index) {
            return episodeCard(episodeList.elementAt(index));
          }),
    );
  }

  Widget episodeCard(Episode episode) {
    return Container(
        height: 155,
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
                    child: Text(episode.name, style: StylesApp.nameTitle,
                    overflow: TextOverflow.ellipsis,)),
                Container(
                    margin: EdgeInsets.only(top: 10.0),
                    width: StylesApp.infoWidth,
                    child: const Text('Release date: ',
                        style: StylesApp.infoTitle)),
                SizedBox(
                  width: StylesApp.infoWidth,
                  child: Text(
                    episode.airDate,
                    style: StylesApp.subTitle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                    width: StylesApp.infoWidth,
                    child: Text('Appearances: ',
                        style: StylesApp.infoTitle,)),
                SizedBox(
                    width: StylesApp.infoWidth,
                    child: Text(episode.characters.length.toString(),
                        style: StylesApp.secondaryInfo,
                        overflow: TextOverflow.ellipsis,)),
              ],
            ),
          ),
        ));
  }
}
