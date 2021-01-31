import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'controller/mobx_controller.dart';

class MobxPage extends StatefulWidget {
  final String title;
  const MobxPage({Key key, this.title = "Mobx"}) : super(key: key);

  @override
  _MobxPageState createState() => _MobxPageState();
}

class _MobxPageState extends ModularState<MobxPage, MobxController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    var date = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (_) {
          print(DateTime.now().difference(date));
          if (store.listTodos == null ||
              store.listTodos.status == FutureStatus.pending) {
            // Loading
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (store.listTodos.error != null) {
            // Error
            return Center(
              child: Text(
                store.listTodos.error.toString(),
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () => store.getTodos(),
            child: ListView.builder(
              itemCount: store.listTodos.value.length,
              itemBuilder: (context, index) {
                final todo = store.listTodos.value[index];
                return ListTile(
                  title: Text(todo.title),
                  leading: IconButton(
                    onPressed: () {
                      date = DateTime.now();
                      store.checkTodo(index);
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
        },
      ),
    );
  }
}
