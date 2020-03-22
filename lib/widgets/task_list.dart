import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todeoyflutter/models/task_data.dart';
import 'package:todeoyflutter/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, TaskData taskData, Widget child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.getTasks[index];
            return Card(
              child: TaskTile(
                count: index + 1,
                longPressCallback: () {
                  Provider.of<TaskData>(context, listen: false)
                      .deleteTask(task);
                },
                taskTitle: task.name,
                isChecked: task.isDone,
                checkedBoxCallback: (bool checkBoxState) {
                  Provider.of<TaskData>(context, listen: false)
                      .updateTask(task);
                },
              ),
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
