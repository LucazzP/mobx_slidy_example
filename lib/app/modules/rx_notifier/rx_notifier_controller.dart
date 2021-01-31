import 'package:flutter_snow_base/flutter_snow_base.dart';
import 'package:mobx_slidy_example/app/shared/models/todo_model.dart';
import 'package:mobx_slidy_example/app/shared/repositories/todo_repository.dart';
import 'package:rx_notifier/rx_notifier.dart';

class RxNotifierController {
  final TodoRepository _repo;

  RxNotifierController(this._repo) {
    this.getTodos();
  }

  final listTodos = RxNotifier<Resource<List<TodoModel>>>(Resource.loading());

  Future<Resource<List<TodoModel>>> getTodos() async {
    listTodos.value = Resource.loading(data: listTodos.value?.data);
    listTodos.value = await Resource.asFuture(_repo.getTodos);
    return listTodos.value;
  }

  void checkTodo(TodoModel todo) {
    final newList = List<TodoModel>.from(listTodos.value.data);
    final index = newList.indexOf(todo);
    newList[index] = todo.copyWith(completed: !todo.completed);
    listTodos.value = listTodos.value.transformData((data) => newList);
  }
}
