import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx_slidy_example/app/modules/flutter_bloc/bloc/flutter_bloc_bloc.dart';
import 'package:mobx_slidy_example/app/modules/flutter_bloc/flutter_bloc_page.dart';
import 'package:mobx_slidy_example/app/shared/repositories/todo_repository.dart';

class FlutterBlocModule extends ChildModule {
  @override
  final List<Bind> binds = [
    Bind((i) => FlutterBlocBloc(i.get<TodoRepository>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => FlutterBlocPage()),
  ];
}
