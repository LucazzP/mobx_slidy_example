import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:mobx_slidy_example/app/shared/models/todo_model.dart';
import 'package:mobx_slidy_example/app/shared/repositories/todo_repository.dart';

part 'flutter_bloc_event.dart';
part 'flutter_bloc_state.dart';

class FlutterBlocBloc extends Bloc<FlutterBlocEvent, FlutterBlocState> {
  TodoRepository _repo;

  FlutterBlocBloc(this._repo){
    this.add(GetListTodo());
  }

  List<TodoModel> _listTodo;

  @override
  FlutterBlocState get initialState => FlutterBlocInitial();

  @override
  Stream<FlutterBlocState> mapEventToState(
    FlutterBlocEvent event,
  ) async* {
    switch (event.runtimeType) {
      case GetListTodo:
        yield* _getListTodo(event);
        break;
      case ChangeListTodo:
        yield* _changeListTodo(event);
        break;
      case CheckItemListTodo:
        yield* _checkItemListTodo(event);
        break;
      default:
    } 
  }

  Stream<FlutterBlocState> _getListTodo(GetListTodo event) async*{
    yield Loading(ChangedListTodo);
    try {
      final todos = await _repo.getTodos();
      this.add(ChangeListTodo(todos));
    } on DioError catch (e) {
      yield Error(e.message);
    }
  }

  Stream<FlutterBlocState> _changeListTodo(ChangeListTodo event) async*{
    _listTodo = event.listTodo;
    yield ChangedListTodo(event.listTodo);
  }
  
  Stream<FlutterBlocState> _checkItemListTodo(CheckItemListTodo event) async*{
    final item = _listTodo[event.index];
    _listTodo[event.index] = item.copyWith(completed: !item.completed);
    this.add(ChangeListTodo(List.of(_listTodo)));
  }
}
