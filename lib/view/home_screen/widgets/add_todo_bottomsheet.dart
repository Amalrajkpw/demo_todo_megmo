import 'dart:developer';

import 'package:demo_todo_megmo/model/todo_model.dart';
import 'package:demo_todo_megmo/services/services.dart';
import 'package:demo_todo_megmo/utils/app_padding.dart';
import 'package:demo_todo_megmo/utils/app_sizedbox.dart';
import 'package:demo_todo_megmo/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/home_screen_controller.dart';

class AddTaskBottomSheet extends StatelessWidget {
  final string;
  final description;
  final id;
  final bool isCompleted;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final homeController = Get.put(HomeScreenController());

  AddTaskBottomSheet({super.key, this.string, this.description, this.id,this.isCompleted=false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.blue.shade100, Colors.white],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Padding(
          padding: AppPadding.padding14,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppSizedBox.sizedBox20vertical,
                TextFormField(
                  controller: homeController.titleController.value,
                  // initialValue:id != null ?  string :"some",
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: id != null ? string : 'Add ToDo',
                    // hintStyle:
                    //     TextStyle(color: Theme.of(context).colorScheme.primary),
                    labelStyle:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                    border: const OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: homeController.descriptionController.value,
                  // initialValue: id != null ?  description :"some",
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: id != null ? description : 'Description',
                    labelStyle:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                    border: const OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: double.infinity,
                  height: 47.h,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        // Get.back();
                        // log(homeController.isEdit.value.toString());
                        if (id != null) {
                          // Update task
                          TodoModel todoModel = TodoModel(
                            title: homeController.titleController.value.text,
                            description:
                                homeController.descriptionController.value.text,
                            isCompleted: isCompleted,
                          );
                          AppServices.updateToDo(id, todoModel);
                          AppServices.getData();
                          homeController.refreshAllTodo();
                          Get.offNamed(Routes.homeScreenRoute);
                          homeController.titleController.value.clear();
                          homeController.descriptionController.value.clear();
                        } else {
                          // Create task
                          TodoModel todoModel = TodoModel(
                            title: homeController.titleController.value.text,
                            description:
                                homeController.descriptionController.value.text,
                          );

                          AppServices.postData(todoModel);
                          AppServices.getData();
                          homeController.refreshAllTodo();
                          Get.back();
                          homeController.titleController.value.clear();
                          homeController.descriptionController.value.clear();
                        }

                        await AppServices.getData();
                      }
                    },
                    child: const Text('Save'),
                  ),
                ),
                AppSizedBox.sizedBox30vertical,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
