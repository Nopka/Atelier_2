//import 'package:client_mobile/models/task.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
//import 'dart:convert';

class TasksCollection extends ChangeNotifier {
  // void create(String content, bool completed) {
  //   int lastItemIndex = data.taskList.length;
  //   data.taskList.insert(
  //       lastItemIndex,
  //       Task(
  //         id: lastItemIndex,
  //         content: content,
  //         completed: completed,
  //         createdAt: DateTime.now(),
  //       ));
  //   notifyListeners();
  // }

  // void update(Task task, String newContent, bool completed) {
  //   for (var element in data.taskList) {
  //     if (element.id == task.id) {
  //       task.content = newContent;
  //       task.completed = completed;
  //     }
  //   }
  //   notifyListeners();
  // }

  // void delete(Task task) {
  //   data.taskList.removeWhere((taskData) => taskData.id == task.id);
  //   notifyListeners();
  // }

  getData() async {
    String url = "https://jsonplaceholder.typicode.com/todos";
    Dio dio = Dio();
    //List<Event> tasklist = [];
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';
    var response = await dio.get(url);

    if (response.statusCode == 200) {
      //var tasksData = jsonDecode(response.data)[0];
      //log(taskData.toString());
      //print(tasksData);
      //Task.fromJson(tasksData);
      //return data.taskList;
    } else {
      throw Exception("Something gone wrong, ${response.statusCode}");
    }
  }
}
