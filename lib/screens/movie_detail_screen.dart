import 'dart:js';

import 'package:flutter/material.dart';
import 'package:tap2024/models/popular_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({super.key});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  bool isFavorite=false; 
  final api=TMDBApi();
  
  int MovieId=0;


  @override
  Widget build(BuildContext context) {
    final popularModel = ModalRoute.of(context)!.settings.arguments as PopularModel;
    void setURL(){
      MovieId=popularModel.id;
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text(popularModel.title),
        actions: [
          IconButton(onPressed: () {
            setState(() {
              isFavorite=!isFavorite;
            });
          },  
          icon : isFavorite? const Icon(Icons.star, color: Colors.yellow) : const Icon(Icons.star_border, color: Colors.black))
        ],
      ),
    );
  }
}
class TMDBApi {
  final String apiKey = '23c70b0f2860ec282f0d2bb5732bf07e';

  Future<String?> getTrailerUrl(String movieTitle) async {
    // Paso 1: Obtener la ID de la película
    final searchUrl = 'https://api.themoviedb.org/3/search/movie?api_key=$apiKey&query=$movieTitle';
    final searchResponse = await http.get(Uri.parse(searchUrl));

    if (searchResponse.statusCode == 200) {
      final searchData = jsonDecode(searchResponse.body);

      if (searchData['results'].isNotEmpty) {
        final movieId = searchData['results'][0]['id'];

        // Paso 2: Obtener los videos de la película
        final videoUrl = 'https://api.themoviedb.org/3/movie/$movieId/videos?api_key=$apiKey';
        final videoResponse = await http.get(Uri.parse(videoUrl));

        if (videoResponse.statusCode == 200) {
          final videoData = jsonDecode(videoResponse.body);

          for (var video in videoData['results']) {
            if (video['type'] == 'Trailer' && video['site'] == 'YouTube') {
              return 'https://www.youtube.com/watch?v=${video['key']}';
            }
          }
        }
      }
    }
    return null;
  }
}