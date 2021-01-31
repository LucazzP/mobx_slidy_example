import 'package:mobx_slidy_example/app/modules/rx_notifier/rx_notifier_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx_slidy_example/app/modules/rx_notifier/rx_notifier_page.dart';

class RxNotifierModule extends ChildModule {
  @override
  final List<Bind> binds = [
    Bind((i) => RxNotifierController(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => RxNotifierPage()),
  ];
}
