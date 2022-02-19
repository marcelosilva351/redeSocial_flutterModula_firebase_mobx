

import 'package:rede_social/app/auth/auth_page.dart';
import 'package:rede_social/app/feed/feed_module.dart';
import 'package:rede_social/app/feed/feed_page.dart';
import 'package:rede_social/app/home/home_page.dart';
import 'package:rede_social/app/home/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rede_social/app/userpost/userpost_module.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [

    ChildRoute('/', child: ((context, args) => HomePage())),
    ModuleRoute('/user', module: UserpostModule()),
    ModuleRoute('/feed', module: FeedModule())



    

  ];
}
