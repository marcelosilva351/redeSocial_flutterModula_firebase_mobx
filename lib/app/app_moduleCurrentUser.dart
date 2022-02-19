import 'package:flutter_modular/flutter_modular.dart';
import 'package:rede_social/app/auth/auth_module.dart';
import 'package:rede_social/app/auth/auth_store.dart';
import 'package:rede_social/app/home/home_module.dart';


class AppModuleCurrentUser extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthStore()),


  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: AuthModule()),

  ];

}