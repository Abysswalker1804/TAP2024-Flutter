import 'package:flutter/material.dart';
import 'package:tap2024/models/popular_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({Key? key}): super (key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late YoutubePlayerController _controller;
  bool isFavorite = false;
  String id='urTgr8EVaJw';

  @override
  void initState(){
    final videoId=YoutubePlayer.convertUrlToId('https://www.youtube.com/watch?v=urTgr8EVaJw');
    _controller =YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final popularModel = ModalRoute.of(context)!.settings.arguments as PopularModel;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(popularModel.title),
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
      body: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        onReady: ()=> debugPrint('Ready'),
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