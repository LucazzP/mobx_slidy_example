import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx_slidy_example/app/modules/home/home_controller.dart';
import 'package:mobx_slidy_example/app/modules/home/home_page.dart';

class HomeModule extends ChildModule {
  @override
  final List<Bind> binds = [
    Bind((i) => HomeController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
  ];
}
