import 'dart:ffi';

import 'package:demo_todo_megmo/utils/app_padding.dart';
import 'package:demo_todo_megmo/utils/app_sizedbox.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/home_screen_controller.dart';

class AddTaskBottomSheet extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final homeController = Get.put(HomeScreenController());

  AddTaskBottomSheet({super.key});

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
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Add ToDo',
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
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                    border: const OutlineInputBorder(),
                  ),
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
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        Get.back();
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
