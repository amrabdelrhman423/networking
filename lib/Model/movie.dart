import 'dart:convert';

List<movie> movieFromJson(String str) =>
    List<movie>.from(json.decode(str).map((x) => movie.fromJson(x)));
String movieToJson(List<movie> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class movie {
  String title;
  String image;
  double rating;
  int releaseYear;
  List<String> genre;

  movie({this.title, this.image, this.rating, this.releaseYear, this.genre});

  movie.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    rating = json['rating'].toDouble();
    releaseYear = json['releaseYear'];
    genre = json['genre'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    data['rating'] = this.rating;
    data['releaseYear'] = this.releaseYear;
    data['genre'] = this.genre;
    return data;
  }
}
