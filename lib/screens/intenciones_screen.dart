//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class IntencionesScreen extends StatelessWidget {
  const IntencionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Intenciones :)')),
      body: GridView(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        children: [
          intentCard(title: 'https://itcelaya.edu.mx', fontSize: 20,icon: Icons.web_stories, actionFunction: openWeb,),
          intentCard(title: 'tel: 4111269889', fontSize: 20,icon: Icons.phone_android_rounded, actionFunction: callPhone),
          intentCard(title: 'sms: 4111269889', fontSize: 20, icon: Icons.sms, actionFunction: sendSMS),
          intentCard(title: 'Email: 22030587@itcelaya.edu.mx',fontSize: 15, icon: Icons.email, actionFunction: sendEmail),
        ],
      ),
    );
  }

  openWeb() async{
    Uri uri=Uri.parse('https://itcelaya.edu.mx');
    if(await canLaunchUrl(uri)){
      launchUrl(uri);
    }
  }

  callPhone() async{
    Uri uri=Uri.parse('tel:4111269889');
    if(await canLaunchUrl(uri)){
      launchUrl(uri);
    } 
  }

  sendSMS() async{
    Uri uri=Uri.parse('sms:4111269889');
    if(await canLaunchUrl(uri)){
      launchUrl(uri);
    }
  }

  Future<void> sendEmail() async{
    Uri uri=Uri(
      scheme: 'mailto',
      path: '22030587@itcelaya.edu.mx',
      query: 'subject=Hola Mundo! :) &body=Van a reprobar :)'
    );
    if(await canLaunchUrl(uri)){
      launchUrl(uri);
    }
  }

  //Protocolo 'rest' puerto de http 80,81
  //get,select post,insert put,update delete 

  Widget intentCard({required String title, required IconData icon, double fontSize=25, Function()? actionFunction}){
    return GestureDetector(
      onTap: actionFunction,
      child: Container(
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueAccent[100],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: fontSize,),
            Text(title,style: TextStyle(fontSize: fontSize),)
          ],
        ),
      ),
    );
  }
}