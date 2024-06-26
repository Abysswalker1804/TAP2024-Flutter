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
  String videoKey;

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
    required this.videoKey,
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
      voteCount: map['vote_count'] ?? 0,
      videoKey: map['key'] ?? '',
      );
      
  }

}

class PopularModelVideoID{
  String key;
  PopularModelVideoID({
    required this.key
  });
  factory PopularModelVideoID.fromMap(Map<String,dynamic> map){
    return PopularModelVideoID(key: map['key']??'',);
  }

}
