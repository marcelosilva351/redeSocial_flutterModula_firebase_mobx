import 'package:rede_social/app/feed/feed_Page.dart';
import 'package:rede_social/app/feed/feed_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FeedModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => FeedStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => FeedPage()),
  ];
}
