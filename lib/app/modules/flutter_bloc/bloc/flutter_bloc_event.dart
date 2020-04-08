part of 'flutter_bloc_bloc.dart';

@immutable
abstract class FlutterBlocEvent {}

class GetListTodo extends FlutterBlocEvent {
  GetListTodo();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is GetListTodo &&
              runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class ChangeListTodo extends FlutterBlocEvent {
  final List<TodoModel> listTodo;

  ChangeListTodo(this.listTodo);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ChangeListTodo &&
              runtimeType == other.runtimeType &&
              listTodo == other.listTodo;

  @override
  int get hashCode => listTodo.hashCode;
}

class CheckItemListTodo extends FlutterBlocEvent {
  final int index;

  CheckItemListTodo(this.index);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CheckItemListTodo &&
              runtimeType == other.runtimeType &&
              index == other.index;

  @override
  int get hashCode => index.hashCode;
}