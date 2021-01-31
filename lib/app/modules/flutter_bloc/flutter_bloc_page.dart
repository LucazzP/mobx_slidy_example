import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx_slidy_example/app/modules/flutter_bloc/bloc/flutter_bloc_bloc.dart';

class FlutterBlocPage extends StatefulWidget {
  final String title;
  const FlutterBlocPage({Key key, this.title = "FlutterBloc"})
      : super(key: key);

  @override
  _FlutterBlocPageState createState() => _FlutterBlocPageState();
}

class _FlutterBlocPageState
    extends ModularState<FlutterBlocPage, FlutterBlocBloc> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    var date = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<FlutterBlocBloc, FlutterBlocState>(
        bloc: store,
        condition: (active, next) =>
            next is Loading || next is Error || next is ChangedListTodo,
        builder: (context, state) {
          print(DateTime.now().difference(date));
          if (state is Loading) {
            // Loading
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is Error) {
            // Error
            return Center(
              child: Text(
                state.error,
              ),
            );
          }
          if (state is ChangedListTodo)
            return RefreshIndicator(
              onRefresh: () {
                store.add(GetListTodo());
                return Future.delayed(Duration(milliseconds: 400));
              },
              child: ListView.builder(
                itemCount: state.list.length,
                itemBuilder: (context, index) {
                  final todo = state.list[index];
                  return ListTile(
                    title: Text(todo.title),
                    leading: IconButton(
                      onPressed: () {
                        date = DateTime.now();
                        store.add(CheckItemListTodo(index));
                      },
                      icon: Icon(
                        todo.completed
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                        color: Colors.blue,
                      ),
                    ),
                  );
                },
              ),
            );
          return Container();
        },
      ),
    );
  }
}
