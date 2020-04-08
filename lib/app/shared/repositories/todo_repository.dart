import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:mobx_slidy_example/app/shared/models/todo_model.dart';

class TodoRepository extends Disposable {
  final Dio _client;

  TodoRepository(this._client);

  Future<List<TodoModel>> getTodos() async {
    final response =
        await _client.get<List>('https://jsonplaceholder.typicode.com/todos/');
    return response.data.map<TodoModel>((element) => TodoModel.fromMap(element)).toList();
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
