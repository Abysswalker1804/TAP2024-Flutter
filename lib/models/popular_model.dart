class PopularModel {
  String backdropPath;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  String title;
  double voteAverage;
  int voteCount;

  PopularModel({
    required this.backdropPath,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  factory PopularModel.fromMap(Map<String,dynamic> map){
    return PopularModel(
      backdropPath: map['backdrop_path'] ?? '', 
      id: map['id'] ?? 0, 
      originalLanguage: map['original_language'] ?? '', 
      originalTitle: map['original_title'] ?? '', 
      overview: map['overview'] ?? '', 
      popularity: map['popularity'] ?? 0, 
      posterPath: map['poster_path'] ?? '', 
      releaseDate: map['release_date'] ?? '', 
      title: map['title'] ?? '', 
      voteAverage: map['vote_average'] ?? 0, 
      voteCount: map['vote_count'] ?? 0,);
  }

}

class PopularModelVideoID{
  String id;
  PopularModelVideoID({
    required this.id
  });
  factory PopularModelVideoID.fromMap(Map<String,dynamic> map){
    return PopularModelVideoID(id: map['key']??'',);
  }
}
