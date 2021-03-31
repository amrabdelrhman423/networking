import 'package:flutter/material.dart';

class MovieDetailsScreen extends StatelessWidget {
  String image;
  String titel;
  double rateing;
  int realseYear;

  MovieDetailsScreen(this.image, this.titel, this.rateing, this.realseYear);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titel),
      ),
      body: Column(
        children: [
          Hero(
            tag: image,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .5,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              )),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: ListTile(
              title: Text(titel),
              subtitle: Text(realseYear.toString()),
            ),
          ),
        ],
      ),
    );
  }
}
