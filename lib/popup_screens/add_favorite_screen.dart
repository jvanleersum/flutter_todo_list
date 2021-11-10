import 'package:flutter/material.dart';
import 'package:todo_list/models/favorite_tasks.dart';
import 'package:provider/provider.dart';

class AddFavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String favoriteTaskTitle = "";
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
                  "Add Favorite Task",
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
                    favoriteTaskTitle = newValue;
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
                    if (favoriteTaskTitle != "") {
                      Provider.of<FavoriteTasksData>(context, listen: false)
                          .addTask(favoriteTaskTitle);
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
