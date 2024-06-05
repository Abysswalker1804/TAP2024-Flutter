class ActorModel {
  bool adult;
  int gender;
  int id;
  String knownForDepartment;
  String name;
  String originalName;
  double popularity;
  String profilePath;
  int castId;
  String character;
  String creditId;
  int order;

  ActorModel({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
  });

  factory ActorModel.fromMap(Map<String,dynamic> map){
    return ActorModel(
      adult: map['adult'], 
      gender: map['gender'] ?? 0, 
      id: map['id'] ?? 0, 
      knownForDepartment: map['known_for_department'] ?? '', 
      name: map['name'], 
      originalName: map['original_name']??'', 
      popularity: map['popularity']?? 0, 
      profilePath: map['profile_path'] ??'', 
      castId: map['cast_id']?? 0, 
      character: map['character']??'', 
      creditId: map['credit_id'] ?? '', 
      order: map['order'] ?? 0,
      );
  }
}
