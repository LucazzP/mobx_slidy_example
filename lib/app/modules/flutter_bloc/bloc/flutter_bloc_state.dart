part of 'flutter_bloc_bloc.dart';

@immutable
abstract class FlutterBlocState {}

class FlutterBlocInitial extends FlutterBlocState {}

class ChangedListTodo extends FlutterBlocState {
  final List<TodoModel> list;

  ChangedListTodo(this.list);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ChangedListTodo &&
              runtimeType == other.runtimeType &&
              list == other.list;

  @override
  int get hashCode => list.hashCode;
}

class Loading extends FlutterBlocState {
  final Type event;

  Loading(this.event);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Loading &&
              runtimeType == other.runtimeType &&
              event == other.event;

  @override
  int get hashCode => event.hashCode;
}

class Error extends FlutterBlocState {
  final String error;

  Error(this.error);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Error &&
              runtimeType == other.runtimeType &&
              error == other.error;

  @override
  int get hashCode => error.hashCode;
}