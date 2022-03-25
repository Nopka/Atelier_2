//import 'package:client_mobile/models/task.dart';
import 'package:client_mobile/models/event.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
//import 'dart:convert';

class EventsCollection extends ChangeNotifier {
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

  Future<Event> getData() async {
    String url = "http://api.events.local:62360/events";
    Dio dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';
    var response = await dio.get(url);
    print(response);
    if (response.statusCode == 200) {
      var data = response.data;
      print(data);
      return data;
    } else {
      throw Exception("Something gone wrong, ${response.statusCode}");
    }
  }
}
