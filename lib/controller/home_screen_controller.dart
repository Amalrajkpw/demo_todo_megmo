import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController{
  RxBool isChecked = false.obs;

  void toggle() {
    isChecked.value = !isChecked.value;
  }

  final titleController = TextEditingController().obs;
  final descriptionController = TextEditingController().obs;
}