import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget MovieItem(Function f,
    {String image, String titel, var rating, int releaseYear, List genre}) {
  return Padding(
    padding: EdgeInsets.all(10),
    child: Card(
      child: Row(
        children: [
          Hero(
            tag: image,
            child: Container(
              padding: EdgeInsets.all(10),
              width: 50,
              height: 110,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.cover),
              ),
            ),
          ),
          Expanded(
              child: Container(
            width: 300,
            height: 110,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  title: Text(titel),
                  subtitle: Text("ay 7aga"),
                ),
                Text(rating.toString()),
                Text(releaseYear.toString()),
              ],
            ),
          )),
          IconButton(icon: Icon(Icons.favorite), onPressed: f)
        ],
      ),
    ),
  );
}
