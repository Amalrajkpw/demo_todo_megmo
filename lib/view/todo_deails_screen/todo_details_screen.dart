import 'dart:math';

import 'package:demo_todo_megmo/services/services.dart';
import 'package:demo_todo_megmo/utils/app_padding.dart';
import 'package:demo_todo_megmo/utils/app_sizedbox.dart';
import 'package:demo_todo_megmo/view/home_screen/widgets/add_todo_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TodoDetailsPage extends StatelessWidget {
  final String? title;
  final String? description;
  final bool isCompleted;
  final dynamic id;

  const TodoDetailsPage(
      {Key? key, this.id, this.title,required this.isCompleted, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Todo Details',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Todo:',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            AppSizedBox.sizedBox10vertical,
            Text(
              title.toString(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16.0),
            Text('Description:',
                style: Theme.of(context).textTheme.headlineSmall),
            AppSizedBox.sizedBox10vertical,
            Text(
              description.toString(),
              style: Theme.of(context).textTheme.titleLarge,
              maxLines: 5,
            ),
            AppSizedBox.sizedBox30vertical,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 130.w,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      AppServices.deleteTodo(id);

                      Get.back();
                      AppServices.getData();
                      homeController.refreshAllTodo();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Set the fill color here
                    ),
                    icon: const Icon(Icons.delete),
                    label: const Text('Delete'),
                  ),
                ),
                SizedBox(
                  width: 130.w,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      homeController.isEdit.value = true;
                      print(homeController.isEdit.value.toString());
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return AddTaskBottomSheet(
                            id: id,
                            description: description,
                            string: title,
                            isCompleted: isCompleted,
                          );
                        },
                      );
                      // AppServices.UpdateToDo(id,);

                      AppServices.getData();
                      homeController.refreshAllTodo();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .primary, // Set the fill color here
                    ),
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
