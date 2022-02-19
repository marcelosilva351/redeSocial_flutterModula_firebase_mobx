import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rede_social/app/auth/auth_store.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  final String title;
  const AuthPage({Key? key, this.title = 'AuthPage'}) : super(key: key);
  @override
  AuthPageState createState() => AuthPageState();
}
class AuthPageState extends State<AuthPage> {
  final AuthStore controller = Modular.get();
  @override
  void initState() {
    if(FirebaseAuth.instance.currentUser != null){
          Modular.to.pushNamed('/home/');


    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: 
          Container(
            width: 300,
            height:340,
            child: 
            Card(color: Colors.blue, elevation: 10, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 50,),
                  Container(
                    height: 80,
                    width: double.infinity,
                    child: TextField(
                      controller: controller.controllerEmail,
                      decoration: const InputDecoration(
                      hintText: 'Email',
                  
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),    
                                      ),
                      hoverColor: Colors.black,
                      focusColor: Colors.black
                  ),
                     )),
                        Container(
                    height: 80,
                    width: double.infinity,
                    child: TextField(
                      controller: controller.controllerSenha,
                      decoration:const InputDecoration(
                      hintText: 'Senha',
                  
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),    
                                      ),
                      hoverColor: Colors.black,
                      focusColor: Colors.black
                  ),
                     )),
                     const SizedBox(height: 10,),
                     GestureDetector(
                       onTap: (){
                         controller.resultLogin();
                       },
                       child: Container(
                         height: 40,
                         width: double.infinity,
                         decoration:const BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.all(Radius.circular(20))
                         ),
                         child: Center(child: Text('Logar', style: TextStyle(color: Colors.black),)),
                       ),
                     ),
                    const SizedBox(height: 10,),
                    Observer(builder: (context){
                      return Text(controller.stringResultLogar);
                    })
                ]),
            ),),),
        )
      ),
    );
  }
}