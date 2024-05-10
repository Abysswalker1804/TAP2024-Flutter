import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({super.key});

  @override
  State<RegistroScreen> createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController usrNickname=TextEditingController();

  void validateEmail(){
    final bool isValid=EmailValidator.validate(emailController.text.trim());
    if(isValid){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Correo válido'))
      );
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Correo NO válido'))
      );
    }
  }

  void validateUsrNickname(){
    if(usrNickname.text.trim().isNotEmpty && usrNickname.text.trim().length>5){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nombre de usuario válido'))
      );
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nombre de usuario NO válido'))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 121, 167, 123),
        title: const Text('Registro'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: usrNickname,
              decoration: const InputDecoration(
                hintText: 'Nombre de usuario',
              ),
            ),

            const SizedBox(height: 25,),

            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Correo electrónico'
              ),
            ),

            const SizedBox(height: 25,),

            TextButton(
              onPressed:()=>{
                validateUsrNickname(),
                setState(() {
                  Future.delayed(const Duration(seconds: 1));
                  validateEmail();
                }),
              }, 
              child: const Text(
                'Registrar',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 14, 95, 17),
                  fontSize: 20,
                ),  
              )
            ),
          ],
        ),
      ),
    );
  }
}