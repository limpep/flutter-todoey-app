import 'package:flutter/material.dart';
import 'package:todeoyflutter/models/task_data.dart';
import 'package:todeoyflutter/screens/task_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: MaterialApp(
        home: TasksScreen(),
      ),
      create: (_) => TaskData(),
    );
  }
}
