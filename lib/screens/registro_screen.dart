import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({super.key});

  @override
  State<RegistroScreen> createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  TextEditingController usrNickname=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController psswdController=TextEditingController();
  TextEditingController psswdConfirmationController= TextEditingController();
  TextEditingController urlController=TextEditingController();
  TextEditingController phoneController=TextEditingController();

  File ? selectedImage;

  void validateImagen(){
    if(selectedImage==null){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('NO ha seleccionado una imagen'))
      );
    }
  }

  void validateUsrNickname(){
    RegExp regex=RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9]).{5,}$');
    if(!regex.hasMatch(usrNickname.text.trim())){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nombre de usuario NO válido'))
      );
    }
  }

  void validateEmail(){
    final bool isValid=EmailValidator.validate(emailController.text.trim());
    if(!isValid){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Correo NO válido'))
      );
    }
  }

  bool validatePasswd(){
    const passwdRegex=r'^(?=.*[0-9])(?=.*[!@#$%^&*()-_+=])(.{6,})$';
    if(!RegExp(passwdRegex).hasMatch(psswdController.text.trim())){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Contraseña NO válida'))
      );
      return false;
    }else{
      return true;
    }
  }

  void validateURL(){
    RegExp regexURL=RegExp(r'^(https?|ftp):\/\/[^\s/$.?#].[^\s]*$');
    if(!regexURL.hasMatch(urlController.text.trim())){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('URL NO válida'))
      );
    }
  }

  void validatePhoneNumb(){
    if(!phoneController.text.trim().isNotEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Número telefónico NO válido'))
      );
    }
  }

  Future selectFromGalery() async{
    final imagenRetornada=await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      selectedImage=File(imagenRetornada!.path);
    });
  }

  Future selectFromCamera() async{
    final imagenRetornada=await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      selectedImage=File(imagenRetornada!.path);
    });
  }

  Future accionarBottonSheet(BuildContext context){ //Caja de intenciones
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context){
        return SizedBox(
         height: 200,
         child: Center(
           child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    color: const Color.fromARGB(255, 194, 253, 229),
                    child: const Text('Desde Galería'),
                    onPressed: () => selectFromGalery(),
                  ),

                  const SizedBox(width: 25,),

                  MaterialButton(
                    color: const Color.fromARGB(255, 194, 253, 229),
                    child: const Text('Desde la cámara'),
                    onPressed: () => selectFromCamera(),
                  ),
                ],
              ),
              const SizedBox(height: 25,),
              ElevatedButton(
                child: const Text('Cerrar'),
                onPressed: (){
                  Navigator.pop(context);
                  },
              ),
            ],
           ),
          ),
        );
      }
    );
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
            const SizedBox(height: 20,),
            selectedImage != null ? Image.file(selectedImage!, height: 50, width: 50,) : const Text('Seleccione una imagen de avatar'),
                            //    Imagen ^
            const SizedBox(height: 25,),

            MaterialButton(     //Boton de imagen
              color: const Color.fromARGB(255, 121, 167, 123),
              child: const Text('Seleccionar una imagen'),
              onPressed: (){
                accionarBottonSheet(context);
              }),

            const SizedBox(height: 25,),

            TextFormField(//          Campo de usuario
              controller: usrNickname,
              decoration: const InputDecoration(
                hintText: 'Nombre de usuario',
                icon: Icon(Icons.person)
              ),
            ),

            const SizedBox(height: 25,),

            TextFormField(//          Campo de correo
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Correo electrónico',
                icon: Icon(Icons.mail)
              ),
            ),

            const SizedBox(height: 25,),
            
            TextFormField(//          Campo contraseña
              controller: psswdController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Contraseña',
                icon: Icon(Icons.lock)
              ),
            ),

            const SizedBox(height: 20,),
            //                        Indicaciones Contraseña
            const Text(
              '>La contraseña debe de tener mínimo 6 carácteres\n>Al menos un número\n>Al menos un carácter especial',
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
            
            const SizedBox(height: 15,),
            
            TextFormField(//          Campo contraseña confirmación
              controller: psswdConfirmationController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Confirmar contraseña',
                icon: Icon(Icons.password)
              ),
            ),

            const SizedBox(height: 25,),

            TextFormField(
              controller: urlController,
              decoration: const InputDecoration(
                hintText: 'URL de GIT',
                icon: Icon(Icons.code)
              ),
            ),

            const SizedBox(height: 25,),

            IntlPhoneField(//         Campo de Teléfono
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: 'Número telefónico',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
              
            ),
            
            const SizedBox(height: 25,),

            TextButton(//              Boton registrar
              onPressed:()=>{
                validateImagen(),
                setState(() {
                  Future.delayed(const Duration(milliseconds: 500));
                  validateUsrNickname();
                }),
                setState(() {
                  Future.delayed(const Duration(milliseconds: 500));
                  validateEmail();
                }),
                setState(() {
                  Future.delayed(const Duration(milliseconds: 500));
                  if(validatePasswd()){
                    if(psswdController.text.trim()==psswdConfirmationController.text.trim()){
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Las contraseñas coinciden'))
                      );
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Las contraseñas NO coinciden'))
                      );
                    }
                  }
                }),
                setState(() {
                  Future.delayed(const Duration(milliseconds: 500));
                  validateURL();
                }),
                setState(() {
                  Future.delayed(const Duration(milliseconds: 500));
                  validatePhoneNumb();
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
