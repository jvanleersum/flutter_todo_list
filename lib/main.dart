import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/favorite_tasks.dart';
import 'package:todo_list/models/task_data.dart';
import 'screens/tasks_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TaskData()),
        ChangeNotifierProvider(create: (context) => FavoriteTasksData())
      ],
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
