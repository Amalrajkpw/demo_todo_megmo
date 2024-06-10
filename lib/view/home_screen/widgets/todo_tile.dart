import 'package:demo_todo_megmo/model/todo_model.dart';
import 'package:demo_todo_megmo/services/services.dart';
import 'package:demo_todo_megmo/utils/routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/home_screen_controller.dart';
import '../../../utils/app_padding.dart';
import '../../../utils/app_sizedbox.dart';
import '../../todo_deails_screen/todo_details_screen.dart';
import 'add_todo_bottomsheet.dart';

class TodoTileWidget extends StatelessWidget {
  final String title;
  final String description;
  final bool isCompleted;
  final dynamic id;

  const TodoTileWidget(
      {super.key,
      required this.title,
      required this.description,
      required this.isCompleted,
      required this.id});

  @override
  Widget build(BuildContext context) {
    final homeScreenController = Get.put(HomeScreenController());
    return InkWell(
      onTap: () => Get.to(TodoDetailsPage(
        id: id,
        title: title,
        description: description,
        isCompleted: isCompleted,
      )),
      child: Padding(
        padding: AppPadding.padding14,
        child: Container(
            padding: AppPadding.padding14,
            height: 80.h,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 4,
                ),
                bottom: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      AppSizedBox.sizedBox10vertical,
                      SizedBox(
                        width: 260.w,
                        child: Text(
                          description,
                          style: Theme.of(context).textTheme.titleMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ]),
                AppSizedBox.sizedBox10horizontal,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        bool newIsCompleted = !isCompleted;
                        AppServices.updateToDo(
                            id,
                            TodoModel(
                                title: title,
                                description: description,
                                isCompleted: newIsCompleted));
                        AppServices.getData();

                        homeScreenController.update();
                        homeController.isCompletedList.assignAll(homeController
                            .allTodoList
                            .where((todo) => todo.isCompleted)
                            .toList());
                        homeController.refreshCompletedTodo();

                      },
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).colorScheme.primary,
                                width: 2),
                            shape: BoxShape.circle,
                            color: isCompleted
                                ? Theme.of(context).colorScheme.primary
                                : Colors.white),
                        child: Center(
                          child: isCompleted
                              ? const Icon(
                                  Icons.check,
                                  size: 16,
                                  color: Colors.white,
                                )
                              : const SizedBox(),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
