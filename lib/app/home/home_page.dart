import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:rede_social/app/auth/auth_store.dart';
import 'package:rede_social/app/home/home_store.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {



  @override
  HomePageState createState() => HomePageState();
}
class HomePageState extends State<HomePage> {
  final HomeStore controller = Modular.get();
  final AuthStore controllerAuth = Modular.get();
  @override
  void initState() {
    // TODO: implement initState
    controller.getUserPhoto(FirebaseAuth.instance.currentUser!.email!);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Perfil'),
        actions: [
          Row(
            children: [
              IconButton(onPressed: () async{
                controllerAuth.stringResultLogar = '';
                controllerAuth.controllerEmail.text ='';
                controllerAuth.controllerSenha.text = '';
                await controllerAuth.logout();
                Modular.to.pop();
                

              }, icon: Icon(Icons.logout)),
              SizedBox(width: 12,)
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 80, 20, 20),
        child: Container(
          height: 400,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black54, offset: Offset(1,2))]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 60,),
              Center(
                child: Observer(
                  builder: (context){return GestureDetector(
                    onTap: (){
                      controller.changeFoto(FirebaseAuth.instance.currentUser!.email!);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white,width: 2),
                        borderRadius: const BorderRadius.all(Radius.circular(120)),
                        image: DecorationImage(fit: controller.userPhotoUrl == '' ? BoxFit.cover : BoxFit.fitWidth,image: NetworkImage(controller.userPhotoUrl == '' ? 'https://th.bing.com/th/id/R.e2981720d54bd5c7869ed4918473dbf5?rik=5rHKSgVfbcm%2fsg&pid=ImgRaw&r=0' : controller.userPhotoUrl))
                      ),
                    ),
                  );},
                ),
              ),
              const SizedBox(height: 20),
              Text(FirebaseAuth.instance.currentUser!.email!, style: TextStyle(fontSize: 20),),
                          const SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 130,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                      child: GestureDetector(
                        onTap: (){
                            Modular.to.pushNamed('./feed/');

                        },
                        child: Center(child: Text('Feed', style: TextStyle(color: Colors.blue, fontSize: 24, fontWeight: FontWeight.w400),))),
                    ),
                    GestureDetector(
                      onTap: (){
                        Modular.to.pushNamed('./user/${FirebaseAuth.instance.currentUser!.email!}');
                      },
                      child: Container(
                        width: 130,
                        height: 45,
                         decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(12))
                        ),
                        child: Center(child: Text('Meus posts', style: TextStyle(color: Colors.blue,fontSize: 24, fontWeight: FontWeight.w400),)),
                    
                      ),
                    )
                  ],
                ),
              )
              


            ],
          ),
        ),
      ),
    );
  }
}