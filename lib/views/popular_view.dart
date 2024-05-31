import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tap2024/models/popular_model.dart';

class PopularView extends StatelessWidget {
 PopularView({super.key,this.popularModel});

  PopularModel? popularModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CachedNetworkImage(
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
              imageUrl: 'https://image.tmdb.org/t/p/w500/${popularModel!.backdropPath}',
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbBznjz44UMQEBvKX3FppyjMFajU47p-7Hs1A8Y91kpA&s'),
            ),
            Container(
              height: 60,
              color: const Color.fromARGB(171, 0, 0, 0),
              child: ListTile(
                title: Text(popularModel!.title, style: const TextStyle(color: Colors.white),),
                subtitle: Text(popularModel!.overview, style: const TextStyle(color: Colors.white), maxLines: 1,),
                trailing: IconButton(
                  onPressed: () => Navigator.pushNamed(context, '/detail', arguments: popularModel), 
                  icon: const Icon(
                    Icons.chevron_right, 
                    color: Colors.white,
                    ),
                  ),
              ),
            ),
          ],
        ),
      )
    );
  }
}