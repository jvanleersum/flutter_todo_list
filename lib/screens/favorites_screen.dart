import 'package:flutter/material.dart';
import 'package:todo_list/models/favorite_tasks.dart';
import 'package:todo_list/popup_screens/add_favorite_screen.dart';
import 'package:todo_list/widgets/favorite_tasks_list.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/screens/tasks_screen.dart';

class FavoriteTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoriteTasksCount =
        Provider.of<FavoriteTasksData>(context).favoriteTasksCount;
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amberAccent,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddFavoriteScreen(),
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
                        Icons.list,
                        size: 30.0,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return TasksScreen();
                        }));
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Favorite To Do's",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "$favoriteTasksCount Favorite Tasks",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: (favoriteTasksCount == 0),
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
                      'No favorite tasks yet! Add some and make your life easier ⭐',
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: (favoriteTasksCount != 0),
            child: Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0))),
                child: FavoriteTasksList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
