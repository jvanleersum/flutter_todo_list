import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/task_data.dart';
import 'package:todo_list/models/favorite_tasks.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String taskTitle = "";
    final favoriteTasksCount =
        Provider.of<FavoriteTasksData>(context).favoriteTasksCount;
    return Container(
        color: Color(0xff757575),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Add Task",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 30,
                      fontWeight: FontWeight.w400),
                ),
                TextField(
                  autofocus: true,
                  textAlign: TextAlign.center,
                  onChanged: (newValue) {
                    taskTitle = newValue;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.lightBlueAccent),
                  ),
                  onPressed: () {
                    if (taskTitle != "") {
                      Provider.of<TaskData>(context, listen: false)
                          .addTask(taskTitle);
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    "Add",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

// Visibility(
// child: Row(
// children: [
// Text("Add favorite:"),
// CupertinoScrollbar(
// child: Consumer<FavoriteTasksData>(
// builder: (context, favoriteTasksData, child) {
// return ListView.builder(
// itemBuilder: (context, index) {
// final task = favoriteTasksData.favoriteTasks[index];
// final title = task.name;
// return Dismissible(
// key: UniqueKey(), child: Text(title));
// });
// }),
// ),
// ],
// ),
// ),
