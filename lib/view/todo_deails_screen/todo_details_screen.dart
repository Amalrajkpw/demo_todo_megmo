import 'package:demo_todo_megmo/utils/app_padding.dart';
import 'package:demo_todo_megmo/utils/app_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodoDetailsPage extends StatelessWidget {
  const TodoDetailsPage({
    Key? key,
    this.title,
    this.description,
  }) : super(key: key);
  final   title;
  final   description;

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
              'title',
              style: Theme.of(context).textTheme.titleLarge,
            ),
         const    SizedBox(height: 16.0),
            Text('Description:',
                style: Theme.of(context).textTheme.headlineSmall),
            AppSizedBox.sizedBox10vertical,
            Text('desdriddddddddddddddddddddddd', style: Theme.of(context).textTheme.titleLarge,maxLines: 5,),
            AppSizedBox.sizedBox30vertical,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 130.w,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Delete logic
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
                      // Edit logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary, // Set the fill color here
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
