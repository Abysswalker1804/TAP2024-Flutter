import 'package:flutter/material.dart';
import 'package:tap2024/models/ActorModel.dart';

class ActorView extends StatelessWidget {
  ActorView({super.key,this.actorModel});

  ActorModel? actorModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(actorModel!.name),
          SizedBox(height: 5,),
          Text('Interpretando a: ${actorModel!.character}')
        ],
      ),
    );
  }
}