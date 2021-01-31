import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_snow_base/flutter_snow_base.dart';
import 'package:rx_notifier/rx_notifier.dart';

import 'rx_notifier_controller.dart';

class RxNotifierPage extends StatefulWidget {
  final String title;
  const RxNotifierPage({Key key, this.title = "RxNotifier"}) : super(key: key);

  @override
  _RxNotifierPageState createState() => _RxNotifierPageState();
}

class _RxNotifierPageState
    extends ModularState<RxNotifierPage, RxNotifierController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    var date = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: PreferredSize(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
            child: TextField(
              onChanged: (text) {
                date = DateTime.now();
                store.search(text);
              },
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          preferredSize: Size.fromHeight(70),
        ),
      ),
      body: RxBuilder(
        builder: (_) {
          print(DateTime.now().difference(date));
          return ListViewResourceWidget(
            resource: store.filteredListTodos,
            refresh: store.getTodos,
            loadingTileQuantity: 1,
            loadingTile: Center(
              child: CircularProgressIndicator(),
            ),
            tileMapper: (todo) => ListTile(
              title: Text(todo.title),
              leading: IconButton(
                onPressed: () {
                  date = DateTime.now();
                  store.checkTodo(todo);
                },
                icon: Icon(
                  todo.completed
                      ? Icons.check_box
                      : Icons.check_box_outline_blank,
                  color: Colors.blue,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
