import 'package:flutter/material.dart';
import 'package:todo_list/screens/favorites_screen.dart';
import 'package:todo_list/widgets/tasks_list.dart';
import 'package:todo_list/popup_screens/add_task_screen.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/task_data.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskCount = Provider.of<TaskData>(context).taskCount;
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen(),
              ),
            ),
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.star,
                        size: 30.0,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return FavoriteTasksScreen();
                        }));
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "My To Do's",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "$taskCount Tasks",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: (taskCount == 0),
            child: Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0))),
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8.0, top: 30),
                    child: Text(
                      'No tasks yet! Add some and get to work 💪',
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: (taskCount != 0),
            child: Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0))),
                child: TasksList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
