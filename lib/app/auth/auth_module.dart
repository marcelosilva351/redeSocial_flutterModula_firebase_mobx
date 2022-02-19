import 'package:rede_social/app/auth/auth_Page.dart';
import 'package:rede_social/app/auth/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rede_social/app/home/home_module.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => AuthPage()),
    ModuleRoute('/home', module: HomeModule())
  ];
}
