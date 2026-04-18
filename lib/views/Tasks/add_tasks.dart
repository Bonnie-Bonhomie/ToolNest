import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tool_nest/core/app_text_string.dart';
import 'package:tool_nest/data/models/task_model.dart';
import 'package:tool_nest/utils/action_title_container.dart';
import 'package:tool_nest/utils/app_button.dart';
import 'package:tool_nest/utils/custom_app_bar.dart';
import 'package:tool_nest/utils/date_picker.dart';

import 'package:tool_nest/utils/input_feld.dart';
import 'package:tool_nest/utils/value_container.dart';
import 'package:tool_nest/viewModels/task_view_model.dart';

class AddTaskView extends StatefulWidget {
  final TaskModel? task;
  final int? taskKey;
  const AddTaskView({super.key, this.task, this.taskKey});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  final TextEditingController titleCtrl = TextEditingController();
  final TextEditingController descCtrl = TextEditingController();
  final TextEditingController dateCtrl = TextEditingController();

  formatD(DateTime date) {
    final formatDate = DateFormat("yyyy-MM-dd").format(date);
    return formatDate;
  }

  @override
  void initState() {
    super.initState();

    if (widget.task != null) {
      titleCtrl.text = widget.task!.title;
      descCtrl.text = widget.task!.description ?? '';
      dateCtrl.text = formatD(widget.task!.taskTime);
    }
  }
//Sve Task function
  void saveTask() {
    final title = titleCtrl.text.trim();
    final description = descCtrl.text.trim();
    final taskDate = dateCtrl.text.trim();

    if (title.isEmpty) return;

    final viewModel = context.read<TaskViewModel>();

    DateTime date = DateTime.parse(taskDate);
    if (widget.taskKey != null) {
      //  update Task
      final updatedTask = widget.task!.copyWith(
        title: title,
        description: description,
        taskTime: date
      );

      viewModel.updateTask(widget.taskKey!, updatedTask);
      print('Task Added');
    } else {
      //Add task function
      viewModel.addTask(title, description, false, taskDate);
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppText.appName),
      body: Column(
        children: [
          ActionTitleCont(title: 'Add New Task'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Add Title'),
                  ValueContainer(
                    child: InputField(
                      input: titleCtrl,
                      textAlign: TextAlign.start,
                      onChanged: (val) {},
                      textType: TextInputType.text,
                      hintText: 'Task title',
                    ),
                  ),
                  const SizedBox(height: 15,),
                  const Text('Add Task Description'),
                  ValueContainer(
                    height: 150,
                    padding: 5.0,
                    child: TextFormField(
                      maxLines: 5,
                      minLines: 1,
                      keyboardType: TextInputType.multiline,
                      //for The input field to be expended and scrollable inside
                      controller: descCtrl,
                      decoration: InputDecoration(
                        hint: const Text('Write Here...'),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 5.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  const Text('Select expect date of completion'),
                  ValueContainer(child: DatePicker(dateControl: dateCtrl)),

                 const SizedBox(height: 30,),
                  AppBtn(label: 'Add Tasks', onPressed: () {
                    if(titleCtrl.text.isEmpty && dateCtrl.text.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('A task must have a title')));
                    }else{
                      saveTask();
                    }

                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
