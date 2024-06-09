import 'package:demo_todo_megmo/utils/routes.dart';
import 'package:demo_todo_megmo/view/controller/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/app_padding.dart';
import '../../../utils/app_sizedbox.dart';
import '../../todo_deails_screen/todo_details_screen.dart';
import 'add_todo_bottomsheet.dart';

class TodoTileWidget extends StatelessWidget {
  const TodoTileWidget({super.key, title,description});

  @override
  Widget build(BuildContext context) {
    final homeScreenController = Get.put(HomeScreenController());
    return InkWell(
      onTap: ()=>Get.toNamed(Routes.todoDetailsRoute),
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
                        'Title',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      AppSizedBox.sizedBox10vertical,
                      SizedBox(
                        width: 260.w,
                        child: Text(
                          'This is a description that spans most of theeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee',
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
                    GestureDetector(
                      onTap: () {
                        homeScreenController.toggle();
                      },
                      child: Obx(() {
                        return Container(
                          width: 24.h,
                          height: 24.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: homeScreenController.isChecked.value
                                ? Colors.blue
                                : Colors.transparent,
                            border: Border.all(
                              color: Colors.blue,
                              width: 2,
                            ),
                          ),
                          child: homeScreenController.isChecked.value
                              ? Icon(
                                  Icons.check,
                                  size: 16.sp,
                                  color: Colors.white,
                                )
                              : null,
                        );
                      }),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
