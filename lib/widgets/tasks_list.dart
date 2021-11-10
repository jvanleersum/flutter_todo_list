import 'package:flutter/material.dart';
import 'package:todo_list/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/task_data.dart';
import 'package:todo_list/models/favorite_tasks.dart';

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            final title = task.name;
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.horizontal,
              onDismissed: (direction) {
                if (direction == DismissDirection.endToStart) {
                  setState(() {
                    taskData.removeTask(task);
                  });
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('$title removed')));
                } else if (direction == DismissDirection.startToEnd) {
                  setState(() {
                    Provider.of<FavoriteTasksData>(context, listen: false)
                        .addTask(title);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('$title added to favorites')));
                }
              },
              background: Container(
                color: Colors.amberAccent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.star, color: Colors.white),
                ),
                alignment: Alignment.centerLeft,
              ),
              secondaryBackground: Container(
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.delete, color: Colors.white),
                ),
                alignment: Alignment.centerRight,
              ),
              child: TaskTile(
                taskTitle: task.name,
                isChecked: task.isDone,
                checkboxCallback: (checkboxState) {
                  taskData.updateTask(task);
                },
                longPressCallback: () {
                  taskData.removeTask(task);
                },
              ),
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
