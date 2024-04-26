//import 'dart:js';

import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tap2024/value_listener.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tópicos Avanzados'),),
      drawer: menuLateral(context),
    );
  }
}

Widget menuLateral(BuildContext context){
  return Drawer(
    child: Container(
      decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/FNH.png'),
                opacity: 0.5,
                )
            ),
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
            ),
            accountName:  Text('Tadeo Palma Avila'), 
            accountEmail:  Text("22030587@itcelaya.edu.mx"),
            ),
            ListTile(
              tileColor: Colors.white,
              title: const Text('Login'),
              subtitle: const Text('Dirección de Youtube'),
              leading: const Icon(Icons.key),
              trailing: const Icon(Icons.chevron_right),
              onTap: ()=>Navigator.pushNamed(context,"/login2")
            ),
            ListTile(
              tileColor: Colors.white,
              title: const Text('Intenciones'),
              subtitle: const Text('Acciones implicitas'),
              leading: const Icon(Icons.key),
              trailing: const Icon(Icons.chevron_right),
              onTap: ()=>Navigator.pushNamed(context,"/intent")
            ),
            DayNightSwitcher(
              isDarkModeEnabled: ValueListener.isDark.value,
              onStateChanged: (isDarkModeEnabled){
                ValueListener.isDark.value=!ValueListener.isDark.value;
              },
            ),
        ],
      ),
    ),
  );
}