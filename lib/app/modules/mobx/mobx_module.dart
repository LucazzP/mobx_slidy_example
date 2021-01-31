import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx_slidy_example/app/app_module.dart';
import 'package:mobx_slidy_example/app/modules/mobx/controller/mobx_controller.dart';
import 'package:mobx_slidy_example/app/modules/mobx/mobx_page.dart';
import 'package:mobx_slidy_example/app/shared/repositories/todo_repository.dart';

class MobxModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MobxController(AppModule.to.get<TodoRepository>())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => MobxPage()),
      ];

  static Inject get to => Inject<MobxModule>.of();
}
