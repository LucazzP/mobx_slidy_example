import 'package:mobx_slidy_example/app/app_module.dart';
import 'package:mobx_slidy_example/app/modules/flutter_bloc/bloc/flutter_bloc_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx_slidy_example/app/modules/flutter_bloc/flutter_bloc_page.dart';
import 'package:mobx_slidy_example/app/shared/repositories/todo_repository.dart';

class FlutterBlocModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => FlutterBlocBloc(AppModule.to.get<TodoRepository>())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => FlutterBlocPage()),
      ];

  static Inject get to => Inject<FlutterBlocModule>.of();
}
