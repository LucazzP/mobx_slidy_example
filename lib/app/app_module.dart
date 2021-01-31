import 'package:mobx_slidy_example/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:mobx_slidy_example/app/app_widget.dart';
import 'package:mobx_slidy_example/app/modules/flutter_bloc/flutter_bloc_module.dart';
import 'package:mobx_slidy_example/app/modules/home/home_module.dart';
import 'package:mobx_slidy_example/app/modules/mobx/mobx_module.dart';
import 'package:mobx_slidy_example/app/shared/dio/custom_dio.dart';
import 'package:mobx_slidy_example/app/shared/repositories/todo_repository.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => CustomDio()),
        Bind((i) => TodoRepository(AppModule.to.get<CustomDio>())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
        ModularRouter('/mobx', module: MobxModule()),
        ModularRouter('/flutter_bloc', module: FlutterBlocModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
