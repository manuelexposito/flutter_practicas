import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ud0505_bottom_navigation_bar/models/people_response.dart';
import 'package:http/http.dart' as http;


class PeoplePage extends StatelessWidget {
   const PeoplePage({ Key? key }) : super(key: key);
   
  //late Future<List<People>> peopleList;
  //List<People> peopleListFetched;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text('Personajes')
    );
  }

 
}
