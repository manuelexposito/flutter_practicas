import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ud0506_popcorn_home_page/models/movie_response.dart';
import 'package:ud0506_popcorn_home_page/styles/styles.dart';
import 'package:http/http.dart' as http;

const String API_KEY = '7dc7796c134309232ef44a970cf4df72';
const String GET_POPULAR_MOVIES_URL =
    'https://api.themoviedb.org/3/movie/popular?api_key=${API_KEY}&language=es-ES&page=1';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Movie>> movieList;

  int _selectedIndex = 0;

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    movieList = fetchMovies();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                //FOTO
                CircleAvatar(
                  child: Icon(Icons.person),
                  maxRadius: 15.0,
                ),
                //NOMBRE
                Text(
                  'Nombre y Apellidos',
                  style: Styles.username,
                )
                //BOTON
              ],
            ),
            //MOVIE, SERIES, TV SHOWS...
            Padding(
              padding: const EdgeInsets.only(right: 180.0),
              child: Text(
                'Movie, Series, TV Shows...',
                style: Styles.textTitle,
              ),
            ),
            //BUSCADOR
            Container(
              padding: EdgeInsets.all(10.0),
              color: Colors.grey,
              child: Text('Aquí estará el buscador'),
            ),
            //NEWEST MOVIES
            const Text(
              'Newest',
              style: Styles.categoryTitle,
            ),
            //TODO: Comprobar fallo con este método
            //_getMovieList()

            //POPULAR MOVIES
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF4d4efd),
        unselectedItemColor: Color(0xFFdfe1ed),
        showSelectedLabels: false,
        onTap: _onItemTapped,
      ),
    );
  }

  Future<List<Movie>> fetchMovies() async {
    final response = await http.get(Uri.parse(GET_POPULAR_MOVIES_URL));

    if (response.statusCode == 200) {
      return MoviesResponse.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('No se cargaron peliculas');
    }
  }

  Widget _getMovieList() {
    return FutureBuilder<List<Movie>>(
        future: fetchMovies(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return popularMoviesList(snapshot.data!);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(child: CircularProgressIndicator());
        });
  }

  Widget popularMoviesList(List<Movie> popularList) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: popularList.length,
      itemBuilder: (context, index) {
        return _popularMovieCard(popularList.elementAt(index)); //la tarjeta
      },
    );
  }

  Widget _popularMovieCard(Movie movie) {
    return Column(
      children: [
        Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Image.network(movie.posterPath)),
        Text(movie.title),
        Row(
          children: [
            FaIcon(
              FontAwesomeIcons.star,
              color: Colors.yellow,
            ),
            Text(movie.popularity.toString())
          ],
        )
      ],
    );
  }
}
