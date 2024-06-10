import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/todo_model.dart';
import '../services/services.dart';

class HomeScreenController extends GetxController {
  RxBool isChecked = false.obs;

  void toggle() {
    isChecked.value = !isChecked.value;
  }

  final titleController = TextEditingController().obs;
  final descriptionController = TextEditingController().obs;
  final RxBool isEdit = false.obs;

  var allTodoList = <TodoGetModel>[].obs;
  var isCompletedList = <TodoGetModel>[].obs;

  void refreshAllTodo() {
    allTodoList.refresh();
    update();
  }



  void refreshCompletedTodo() {
    isCompletedList.refresh();
    update();
  }
}
