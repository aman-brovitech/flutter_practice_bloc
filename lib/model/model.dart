class Movie {
  final String id;
  final String title;
  final String releaseDate;

  Movie({required this.id, required this.title, required this.releaseDate});
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      releaseDate: json['releaseDate'],
    );
  }
}
