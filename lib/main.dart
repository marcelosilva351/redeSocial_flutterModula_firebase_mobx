import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rede_social/app/app_moduleCurrentUser.dart';
import 'package:rede_social/app/app_widgetCurrentUser.dart';
import 'app/app_module.dart';
import 'app/app_widget.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  var user = await FirebaseAuth.instance.currentUser;

  runApp(Phoenix(child:  ModularApp(module: AppModule(), child: AppWidget())));

  

  
  
  
  
  }

  

