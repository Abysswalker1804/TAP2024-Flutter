
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
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
        suffixIcon: Icon(Icons.check),
        label: Text('Correo Electrónico',style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),),
        icon: Icon(Icons.person),
        hintStyle: TextStyle(fontWeight: FontWeight.bold)
      ),
    );

    final txtPwd=TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        suffixIcon: Icon(Icons.visibility_off),
        label: Text('Contraseña', style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),),
        icon: Icon(Icons.key),
        hintStyle: TextStyle(fontWeight: FontWeight.bold)
      ),
    );

    final olvidarCont=Align(
      alignment: Alignment.centerRight,
      child: Text('¿Olvidó su contraseña?', style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 13,
        color: Colors.black,
      ),),
    );

    final btnValidar=Positioned(
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
    );

    final txtSign=Align(
      alignment: Alignment.bottomRight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('¿Aún no tiene cuenta?'),
          Text('Crear una', style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,//Añadir un Widget
          ),),
        ],
      ),
    );

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
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
                height: (MediaQuery.of(context).size.height)*.4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 127, 139, 128).withOpacity(.8),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    txtUser,
                    txtPwd,
                    const SizedBox(height: 20,),
                    olvidarCont,
                    const SizedBox(height: 20,),
                    btnValidar,
                    const SizedBox(height: 20,),
                    txtSign,
                  ],
                ),
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