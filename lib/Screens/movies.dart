import 'package:flutter/material.dart';
import 'package:networking/Model/movie.dart';
import 'package:networking/Screens/moviedetails.dart';
import 'package:networking/Widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MoviesScreens extends StatefulWidget {
  @override
  _MoviesScreensState createState() => _MoviesScreensState();
}

class _MoviesScreensState extends State<MoviesScreens> {
  Future<List<movie>> futureMovies;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureMovies = fetchMovies();
    _getcounter();
  }

  void selectedMovie(BuildContext ctx,
      {String image, String title, double rating, int releaseYear}) {
    Navigator.push(ctx, MaterialPageRoute(builder: (ctx) {
      return MovieDetailsScreen(image, title, rating, releaseYear);
    }));
  }

  int counter;
  _getcounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = prefs.getInt('counter');
    });
  }

  _valueCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (counter == null) {
        counter = (prefs.getInt('counter') ?? 0) + 1;
      }
      counter = (prefs.getInt('counter') ?? 0) + 1;
    });
    await prefs.setInt('counter', counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hello movies" + " " + counter.toString()),
        ),
        body: FutureBuilder(
          future: futureMovies,
          builder: (context, snapdata) {
            if (snapdata.hasData) {
              final movies = snapdata.data;
              return ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () => selectedMovie(context,
                          image: movies[index].image,
                          title: movies[index].title,
                          rating: movies[index].rating,
                          releaseYear: movies[index].releaseYear),
                      child: MovieItem(_valueCounter,
                          image: movies[index].image,
                          titel: movies[index].title,
                          rating: movies[index].rating,
                          releaseYear: movies[index].releaseYear,
                          genre: movies[index].genre));
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}

Future<List<movie>> fetchMovies() async {
  final response = await http
      .get(Uri.parse("https://api.androidhive.info/json/movies.json"));
  if (response.statusCode == 200) {
    print(response.body);
    return movieFromJson(response.body);
  } else {
    throw Exception('FAILED TO LOAD MOVIES');
  }
}
