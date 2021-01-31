import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx_slidy_example/app/app_controller.dart';
import 'package:mobx_slidy_example/app/app_widget.dart';
import 'package:mobx_slidy_example/app/modules/flutter_bloc/flutter_bloc_module.dart';
import 'package:mobx_slidy_example/app/modules/home/home_module.dart';
import 'package:mobx_slidy_example/app/modules/mobx/mobx_module.dart';
import 'package:mobx_slidy_example/app/modules/rx_notifier/rx_notifier_module.dart';
import 'package:mobx_slidy_example/app/shared/dio/custom_dio.dart';
import 'package:mobx_slidy_example/app/shared/repositories/todo_repository.dart';

class AppModule extends MainModule {
  @override
  final List<Bind> binds = [
    Bind((i) => AppController()),
    Bind((i) => CustomDio()),
    Bind((i) => TodoRepository(i.get<CustomDio>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ModuleRoute('/mobx', module: MobxModule()),
    ModuleRoute('/flutter_bloc', module: FlutterBlocModule()),
    ModuleRoute('/rx_notifier', module: RxNotifierModule()),
  ];

  @override
  final Widget bootstrap = AppWidget();
}
