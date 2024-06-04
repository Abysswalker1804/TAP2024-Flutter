import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:tap2024/models/popular_model.dart';

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

  Future<List<PopularModel>?> getVideoID(String id) async{
    Uri url= Uri.parse('https://api.themoviedb.org/3/movie/$id/videos?api_key=23c70b0f2860ec282f0d2bb5732bf07e');
    Response response=await http.get(url);
    if(response.statusCode==200){
      final jsonPopular=jsonDecode(response.body)['results'] as List;
      return jsonPopular.map((popular) => PopularModel.fromMap(popular)).toList();
    }
    return null;
  }
}

