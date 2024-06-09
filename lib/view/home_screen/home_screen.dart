import 'package:demo_todo_megmo/utils/app_padding.dart';
import 'package:demo_todo_megmo/utils/app_sizedbox.dart';

import 'package:demo_todo_megmo/view/home_screen/widgets/add_todo_bottomsheet.dart';
import 'package:demo_todo_megmo/view/home_screen/widgets/todo_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui';

import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'ToDo',
            style: TextStyle(
                fontSize: 20.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue.shade100, Colors.white],
              ),
            ),
            child: Column(
              children: [
                TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 5.h,
                  indicatorColor: Theme.of(context).colorScheme.primary,
                  tabs: const [
                    Tab(text: 'All Tasks'),
                    Tab(text: 'Completed'),
                  ],
                ),
                AppSizedBox.sizedBox20vertical,
                Expanded(
                  child: TabBarView(children: [
                    ListView.separated(
                        separatorBuilder: (context, int) =>
                            AppSizedBox.sizedBox20vertical,
                        itemCount: 10,
                        itemBuilder: (context, index) => TodoTileWidget(
                              title: int,
                              description: int,
                            )),
                    ListView.separated(
                        separatorBuilder: (context, int) =>
                            AppSizedBox.sizedBox20vertical,
                        itemCount: 10,
                        itemBuilder: (context, index) => TodoTileWidget(
                              title: int,
                              description: int,
                            )),
                  ]),
                )
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          backgroundColor: Theme.of(context).colorScheme.primary,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return AddTaskBottomSheet();
              },
            );
          },
          label: Row(
            children: [
              const Icon(
                Icons.add,
                color: Colors.white,
              ),
              AppSizedBox.sizedBox10horizontal,
              Text(
                'Add ToDo',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
