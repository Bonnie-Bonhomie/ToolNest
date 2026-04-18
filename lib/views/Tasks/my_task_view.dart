import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tool_nest/config/AppRoutes/route_name.dart';
import 'package:tool_nest/core/app_color.dart';
import 'package:tool_nest/core/app_text_string.dart';
import 'package:tool_nest/core/resources/constant.dart';
import 'package:tool_nest/data/models/task_model.dart';
import 'package:tool_nest/utils/action_title_container.dart';
import 'package:tool_nest/utils/custom_app_bar.dart';
import 'package:tool_nest/utils/value_container.dart';
import 'package:tool_nest/viewModels/task_view_model.dart';
import 'package:tool_nest/views/Tasks/add_tasks.dart';

class MyTasksView extends StatefulWidget {
  const MyTasksView({super.key});

  @override
  State<MyTasksView> createState() => _MyTasksViewState();
}

class _MyTasksViewState extends State<MyTasksView> {
  formatD(DateTime date) {
    final formatDate = DateFormat("MMM d, yyyy").format(date);
    return formatDate;
  }

  List<String> stages = ['All', 'Ongoing', 'Completed'];
  dynamic expandKey;

  @override
  Widget build(BuildContext context) {
    final watchModel = context.watch<TaskViewModel>();
    return Scaffold(
      appBar: CustomAppBar(title: AppText.appName),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.addTask);
        },
        backgroundColor: AppColors.primary,
        elevation: 3.0,
        tooltip: 'Add task here',
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Column(
        children: [
          ActionTitleCont(title: 'My Tasks'),
          Container(
            width: 250,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.borderGrey,
            ),
            child: Row(
              children: [
                taskStage(
                  select: watchModel.filter == FilterType.all,
                  title: 'All',
                  onSelect: (val) {
                    context.read<TaskViewModel>().setFilter(FilterType.all);
                  },
                ),
                taskStage(
                  select: watchModel.filter == FilterType.onGoing,
                  title: 'Ongoing',
                  onSelect: (val) {
                    context.read<TaskViewModel>().setFilter(FilterType.onGoing);
                  },
                ),
                taskStage(
                  select: watchModel.filter == FilterType.completed,
                  title: 'Completed',
                  onSelect: (val) {
                    context.read<TaskViewModel>().setFilter(
                      FilterType.completed,
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Consumer<TaskViewModel>(
              builder: (key, provider, child) {
                if (provider.tasks.isEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.workspaces_filled, size: 50),
                      Text(
                        'No Task',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        'All your task will be displayed here',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.all(20),
                  itemCount: provider.tasks.length,
                  itemBuilder: (context, index) {
                    final task = provider.tasks[index];
                    final key = provider.taskBox.keyAt(index);
                    return taskColumn(context, task, key, index);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget taskColumn(BuildContext context, TaskModel task, dynamic key, int index) {
    // List<TaskModel> allTasks =[];

    final isExpand = expandKey == key;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderGrey, width: 2),
        borderRadius: BorderRadius.circular(10.0),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: ListTile(
        title: Text(task.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.description ?? '(No description)',
              style: isExpand
                  ? null
                  : TextStyle(overflow: TextOverflow.ellipsis, fontSize: 15),
            ),
            Text(formatD(task.taskTime), style: TextStyle(fontSize: 15)),
          ],
        ),
        leading: CircleAvatar(
          child: Text(
            task.title[0].toUpperCase(),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        tileColor: Colors.white,
        style: ListTileStyle.drawer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        onTap: () {
          setState(() {
            expandKey = isExpand ? null : key;
          });
        },
        trailing: PopupMenuButton(
          onSelected: (value) {
            if (value == 'mark') {
              context.read<TaskViewModel>().toggleRead(key);
            } else if (value == 'edit') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddTaskView(task: task, taskKey: index),
                ),
              );
            } else if (value == 'delete') {
    // context.read<TaskViewModel>().deleteTask(key);
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  icon: Icon(Icons.warning_amber),
                  iconColor: AppColors.declined,
                  content: Text(
                    'Are you sure you want to delete this task? Deleted task cannot be retrieved',
                    textAlign: TextAlign.center,
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        context.read<TaskViewModel>().deleteTask(key); },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.declined,
                        foregroundColor: Colors.white
                      ),
                      child: Text('Delete'),
                    ),const SizedBox(width: 20,),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                          foregroundColor: Colors.white
                      ),
                      child: Text('Cancel'),
                    ),
                  ],
                ),
              );

            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(value: 'edit', child: const Text('Edit')),
            PopupMenuItem(value: 'delete', child: const Text('Delete')),
            PopupMenuItem(
              value: 'mark',
              child: Text(
                task.completed ? 'UnMark as complete' : 'Mark as complete',
              ),
            ),
          ],
        ),
        contentPadding: const EdgeInsets.all(5.0),
      ),
    );
  }

  Widget taskStage({
    required bool select,
    required String title,
    required Function(bool) onSelect,
  }) {
    return ChoiceChip(
      label: Text(
        title,
        style: TextStyle(
          color: select ? AppColors.lightBackground : AppColors.darkPrimary,
        ),
      ),
      side: BorderSide.none,
      selected: select,
      showCheckmark: false,
      onSelected: onSelect,
      backgroundColor: select ? AppColors.primary : AppColors.borderGrey,
    );
  }
}
