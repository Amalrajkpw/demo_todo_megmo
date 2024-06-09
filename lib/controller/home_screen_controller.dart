import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/todo_model.dart';

class HomeScreenController extends GetxController{
  RxBool isChecked = false.obs;

  void toggle() {
    isChecked.value = !isChecked.value;
  }

  final titleController = TextEditingController().obs;
  final descriptionController = TextEditingController().obs;

  var allTodoList = <TodoGetModel>[].obs;
}