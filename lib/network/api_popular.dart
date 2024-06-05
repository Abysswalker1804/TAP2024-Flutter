import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:tap2024/models/ActorModel.dart';
import 'package:tap2024/models/popular_model.dart';
import 'package:tap2024/models/videoModel.dart';

class ApiPopular{
  Uri uri =Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=23c70b0f2860ec282f0d2bb5732bf07e&language=es-MX&page=1');
  

  Future<List<PopularModel>?> getAllPopular( ) async{
    Response response=await http.get(uri);
    if(response.statusCode==200){
      final jsonPopular=jsonDecode(response.body)['results'] as List;
      return jsonPopular.map((popular) => PopularModel.fromMap(popular)).toList();
    }
    return null;
  }

  Future<List<PopularModel>?> getImage(String path) async{
    Uri url=Uri.parse('https://image.tmdb.org/t/p/w500$path');
    Response response=await http.get(url);
    if(response.statusCode==200){
      final jsonPopular=jsonDecode(response.body)['results'] as List;
      return jsonPopular.map((popular) => PopularModel.fromMap(popular)).toList();
    }
    return null;
  }

  Future<String?> getVideoKey(String key) async {
  Uri url = Uri.parse('https://api.themoviedb.org/3/movie/$key/videos?api_key=23c70b0f2860ec282f0d2bb5732bf07e');
  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body)['results'] as List;
      
      final key= jsonData.map((item) => VideoModel.fromMap(item)).toList();
      return key.first.key;
    } else {
      print('Error en la solicitud: ${response.statusCode}');
    }
  } catch (e) {
    print('Error al obtener los datos: $e');
  }
  return null;
}
  Future<List<ActorModel>?> getActors(String movieId) async{
    Uri url=Uri.parse('https://api.themoviedb.org/3/movie/$movieId/credits?api_key=23c70b0f2860ec282f0d2bb5732bf07e');
    final response = await http.get(url);
    if(response.statusCode==200){
      final jsonData=jsonDecode(response.body)["cast"] as List;
      return jsonData.map((item) => ActorModel.fromMap(item)).toList();
    }
    return null;
  }
}

