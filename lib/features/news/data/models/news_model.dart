class Movie {
  final String? image;
  final String? title;

  Movie({this.image, this.title});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(image: json["backdrop_path"], title: json["original_title"]);
  }


}
