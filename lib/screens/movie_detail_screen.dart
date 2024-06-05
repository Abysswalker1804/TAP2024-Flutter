import 'package:flutter/material.dart';
import 'package:tap2024/models/popular_model.dart';
import 'package:tap2024/network/api_popular.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'dart:ui';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({Key? key}): super (key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late YoutubePlayerController _controller;
  bool isFavorite = false;
  String id='urTgr8EVaJw';
  ApiPopular? apiPopular;

  @override
  void initState(){
    apiPopular=ApiPopular();
    /*final videoId=YoutubePlayer.convertUrlToId('https://www.youtube.com/watch?v=urTgr8EVaJw');
    _controller =YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
      ),
    );*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final popularModel= ModalRoute.of(context)!.settings.arguments as PopularModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(popularModel!.title),
        actions: [
          IconButton(onPressed: (){
            setState(() {
              isFavorite = !isFavorite;
            });
          }, 
          icon: isFavorite ? Icon(Icons.favorite)  : Icon(Icons.favorite_border)
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://image.tmdb.org/t/p/w500'+popularModel.backdropPath, ),
            fit: BoxFit.fill,
            opacity: .5,
          ),
        ),
        child: Column(
          children: [FutureBuilder(
            future: apiPopular!.getVideoKey(popularModel.id.toString()),
            builder: (context,AsyncSnapshot<String?> snapshot) {
              if(snapshot.hasData){
                //_controller.load(snapshot.data!);
                _controller =YoutubePlayerController(
                   initialVideoId: snapshot.data!,
                   flags: const YoutubePlayerFlags(
                   autoPlay: true,
                  ),
                );
                return Container(
                  child: YoutubePlayerBuilder(
                  player: YoutubePlayer(
                    onReady: () {
                    },
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.amber,
                    progressColors: const ProgressBarColors(
                      playedColor: Colors.amber,
                      handleColor: Colors.amberAccent,
                    ),
                  ),
                  builder: (context, player) {
                    return Column(
                      children: [
                        player,
                      ]
                    );
                  },
                            ),
                );
              } else{
                if(snapshot.hasError){
                  return Center(
                    child: Text('Ocurrió un error'),
                  );
                }else{
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
            }}
          ),
          SizedBox(height: 10,),
          Text("Idioma original: "+popularModel.originalLanguage.toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10,),
          Text("Fecha de estreno: "+popularModel.releaseDate,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(popularModel.voteAverage.roundToDouble().toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              Icon(Icons.star, color: Colors.yellow, size: 50,)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Popularidad: "+popularModel.popularity.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(width: 10,),
              Icon(Icons.thumb_up, color: Colors.blue,)
            ],
          ),
          SizedBox(height: 10,),
          Text(popularModel.overview.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ]),
      ),
    );
  }
}



/*class YoutubePlayerDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Youtube Player Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          color: Colors.blueAccent,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
            fontSize: 20,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.blueAccent,
        ),
      ),
      home: MyHomePage(),
    );
  }
}*/