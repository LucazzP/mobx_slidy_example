import 'package:flutter_snow_base/flutter_snow_base.dart';
import 'package:mobx_slidy_example/app/shared/models/todo_model.dart';
import 'package:mobx_slidy_example/app/shared/repositories/todo_repository.dart';
import 'package:rx_notifier/rx_notifier.dart';

class RxNotifierController {
  final TodoRepository _repo;

  RxNotifierController(this._repo) {
    this.getTodos();
  }

  final _listTodos = RxNotifier<Resource<List<TodoModel>>>(Resource.loading());
  final _textSearch = RxNotifier<String>('');

  Resource<List<TodoModel>> get listTodos => _listTodos.value;
  Resource<List<TodoModel>> get filteredListTodos => listTodos.transformData(
        (data) => data == null || _textSearch.value.isEmpty
            ? data
            : data
                .where((element) => element.title.contains(_textSearch.value))
                .toList(),
      );

  Future<Resource<List<TodoModel>>> getTodos() async {
    _listTodos.value = Resource.loading(data: listTodos?.data);
    _listTodos.value = await Resource.asFuture(_repo.getTodos);
    return listTodos;
  }

  void checkTodo(TodoModel todo) {
    final newList = List<TodoModel>.from(listTodos.data);
    final index = newList.indexOf(todo);
    newList[index] = todo.copyWith(completed: !todo.completed);
    _listTodos.value = listTodos.transformData((data) => newList);
  }

  void search(String text) {
    _textSearch.value = text;
  }
}
