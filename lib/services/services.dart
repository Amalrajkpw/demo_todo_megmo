import 'dart:convert';
import 'dart:developer';

import 'package:demo_todo_megmo/controller/home_screen_controller.dart';
import 'package:demo_todo_megmo/model/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

final homeController = Get.put(HomeScreenController());

class AppServices {
  static String postUrl = "https://api.nstack.in/v1/todos";
  static String getUrl = 'https://api.nstack.in/v1/todos?page=1&limit=20';

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
      if (response.statusCode == 201) {
        Get.snackbar(
          "Success",
          "Todo posted successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        throw Exception('Failed to post todo');
      }
    } on Exception catch (e) {
      log(e.toString());
      Get.snackbar(
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
        print(response.body.toString());
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
}
