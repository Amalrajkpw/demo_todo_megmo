import 'dart:convert';
import 'dart:developer';

import 'package:demo_todo_megmo/controller/home_screen_controller.dart';
import 'package:demo_todo_megmo/model/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/todo_model.dart';
import '../model/todo_model.dart';

final homeController = Get.put(HomeScreenController());

class AppServices {
  static String postUrl = "https://api.nstack.in/v1/todos";
  static String getUrl = 'https://api.nstack.in/v1/todos?page=1&limit=20';
  static String deleteUrl = "https://api.nstack.in/v1/todos/";
  static String updateUrl = "https://api.nstack.in/v1/todos/";

  //post method
  static Future postData(TodoModel todoModel) async {
    final uri = Uri.parse(postUrl);

    try {
      final response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "title": todoModel.title,
          "description": todoModel.description,
          "is_completed": todoModel.isCompleted,
        }),
      );
      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 201) {
        Get.snackbar(
          "Success",
          "Todo posted successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        await getData();
        homeController.refreshAllTodo();
      } else {
        throw Exception(response.statusCode.toString());

      }
    } on Exception catch (e) {
      log(e.toString());
     return Get.snackbar(
        "Try again ",
        e.toString(),
      );
    }
  }

  // Get method

  static Future<List<TodoGetModel>> getData() async {
    final uri = Uri.parse(getUrl);

    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        dynamic jsonResponse = jsonDecode(response.body);
        homeController.allTodoList.assignAll((jsonResponse['items'] as List)
            .map((item) => TodoGetModel(
                  id: item['_id'],
                  title: item['title'],
                  description: item['description'],
                  isCompleted: item['is_completed'],
                ))
            .toList());

        return homeController.allTodoList;
      } else {
        throw Exception('Failed to load todos');
      }
    } catch (e) {
      log(e.toString());
      Get.snackbar(
        "Error",
        "Failed to load todos",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return <TodoGetModel>[];
    }
  }


  // Delete Method

  static Future deleteTodo(String id) async {
    final uri = Uri.parse(deleteUrl + id);

    try {
      final response = await http.delete(
        uri,
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        Get.snackbar(
          "Deleted",
          "Deleted ToDo from your list",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        await getData();
        homeController.refreshAllTodo();
        return true;
      } else {
        // Failed to delete todo
        throw Exception('Failed to delete todo');
      }
    } catch (e) {
      // Exception occurred
      log(e.toString());
      Get.snackbar(
        "Error",
        "Failed to delete todo",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
  }

  // Update Method

  static Future updateToDo(String id,TodoModel todoModel) async {

    final uri = Uri.parse(updateUrl + id);

    try {
      final response = await http.put(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "title": todoModel.title,
          "description": todoModel.description,
          "is_completed": todoModel.isCompleted
        }),
      );
      if (response.statusCode == 200) {
        Get.snackbar(
          "Updated",
          "Updated ToDo",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        await getData();
        homeController.refreshAllTodo();
        homeController.isCompletedList.assignAll(homeController
            .allTodoList
            .where((todo) => todo.isCompleted)
            .toList());
        homeController.refreshCompletedTodo();
        return true;
      } else {
        // Failed to delete todo
        throw Exception('Failed to update todo');
      }
    } catch (e) {
      // Exception occurred
      log(e.toString());
      Get.snackbar(
        "Error",
        "Failed to update todo",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
  }
}
