
import 'package:flutter/material.dart';
import 'package:tool_nest/core/app_color.dart';

class ActionTitleCont extends StatelessWidget {
  final String title;
  final bool showDrawer;
  const ActionTitleCont({
    super.key,
    required this.title,
    this.showDrawer = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.darkPrimary, AppColors.primary],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Row(
        children: [
          showDrawer? IconButton(onPressed: (){}, icon: Icon(Icons.menu)): SizedBox(),
          Text(
            title,
            style: TextStyle(color: AppColors.lightBackground, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
