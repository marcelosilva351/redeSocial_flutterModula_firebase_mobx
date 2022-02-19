import 'package:rede_social/app/userpost/userpost_page.dart';
import 'package:rede_social/app/userpost/userpost_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserpostModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => UserpostStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/:email', child: (_, args) => UserpostPage(args.params['email'])),
  ];
}
