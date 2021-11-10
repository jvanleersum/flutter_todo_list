import 'package:flutter/material.dart';
import 'package:todo_list/widgets/favorites_tile.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/favorite_tasks.dart';

class FavoriteTasksList extends StatefulWidget {
  @override
  _FavoriteTasksListState createState() => _FavoriteTasksListState();
}

class _FavoriteTasksListState extends State<FavoriteTasksList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteTasksData>(
      builder: (context, favoriteTasksData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = favoriteTasksData.favoriteTasks[index];
            final title = task.name;
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                  favoriteTasksData.removeTask(task);
                });
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('$title removed')));
              },
              background: Container(
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.delete, color: Colors.white),
                ),
                alignment: Alignment.centerRight,
              ),
              child: FavoriteTaskTile(
                favoriteTaskTitle: task.name,
              ),
            );
          },
          itemCount: favoriteTasksData.favoriteTasksCount,
        );
      },
    );
  }
}
