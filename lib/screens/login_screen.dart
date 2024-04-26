
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tap2024/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isValidating=true;
  @override
  Widget build(BuildContext context) {
    final txtUser=TextFormField(
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        hintText: 'Correo Electrónico',
        hintStyle: TextStyle(fontWeight: FontWeight.bold)
      ),
    );

    final txtPwd=TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        icon: Icon(Icons.key),
        hintText: 'Contraseña',
        hintStyle: TextStyle(fontWeight: FontWeight.bold)
      ),
    );

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/FNH.png'),
            fit: BoxFit.fill,
            opacity: .7,
          ),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 100,
              height: 200,
              child:Image.asset('assets/fnhS.png')
            ),
            Positioned(
              bottom: 150,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 120,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 127, 139, 128).withOpacity(.8),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(
                  children: [
                    txtUser,
                    txtPwd
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 90,
              child: ElevatedButton.icon(
                onPressed: (){
                  isValidating=!isValidating;
                  setState(() {});
                  Future.delayed(const Duration(
                    milliseconds: 6980,
                  ),).then((value) => Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      )
                    )
                  );
                },
                label: const Text('Validar usuario'),
                icon: const Icon(Icons.login),
              ),
            ),
            Positioned(
              top: 250,
              child: SizedBox(
                height: 150,
                child: !isValidating ? Image.asset('assets/loading.gif'): Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}