import 'package:flutter/material.dart';

class FavoriteTaskTile extends StatelessWidget {
  final String favoriteTaskTitle;

  FavoriteTaskTile({required this.favoriteTaskTitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        favoriteTaskTitle,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: Icon(Icons.add, color: Colors.blue),
    );
  }
}
