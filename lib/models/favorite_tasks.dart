import 'dart:collection';
import 'package:flutter/material.dart';
import 'task.dart';

class FavoriteTasksData extends ChangeNotifier {
  List<Task> _favoriteTasks = [];

  UnmodifiableListView<Task> get favoriteTasks {
    return UnmodifiableListView(_favoriteTasks);
  }

  int get favoriteTasksCount {
    return _favoriteTasks.length;
  }

  void addTask(String newTaskName) {
    _favoriteTasks.add(Task(name: newTaskName));
    notifyListeners();
  }

  void removeTask(Task task) {
    _favoriteTasks.remove(task);
    notifyListeners();
  }
}
