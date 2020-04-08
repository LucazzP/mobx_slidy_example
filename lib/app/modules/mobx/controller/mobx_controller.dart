import 'package:mobx/mobx.dart';
import 'package:mobx_slidy_example/app/shared/extensions.dart';
import 'package:mobx_slidy_example/app/shared/models/todo_model.dart';
import 'package:mobx_slidy_example/app/shared/repositories/todo_repository.dart';

part 'mobx_controller.g.dart';

class MobxController = _MobxControllerBase with _$MobxController;

abstract class _MobxControllerBase with Store {
  final TodoRepository _repo;

  _MobxControllerBase(this._repo) {
    this.getTodos();
  }

  @observable
  ObservableFuture<ObservableList<TodoModel>> listTodos;

  @action
  Future<ObservableList<TodoModel>> getTodos() async {
    listTodos = _repo
        .getTodos()
        .map<ObservableList<TodoModel>>(
            (transform) async => (await transform).asObservable())
        .asObservable();
    return listTodos;
  }

  @action
  void checkTodo(int index) {
    final todo = listTodos.value[index];
    listTodos.value[index] = todo.copyWith(completed: !todo.completed);
  }
}
