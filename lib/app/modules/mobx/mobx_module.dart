import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx_slidy_example/app/modules/mobx/controller/mobx_controller.dart';
import 'package:mobx_slidy_example/app/modules/mobx/mobx_page.dart';
import 'package:mobx_slidy_example/app/shared/repositories/todo_repository.dart';

class MobxModule extends ChildModule {
  @override
  final List<Bind> binds = [
    Bind((i) => MobxController(i.get<TodoRepository>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => MobxPage()),
  ];
}
