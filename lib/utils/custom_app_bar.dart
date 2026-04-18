import 'package:flutter/material.dart';
import 'package:tool_nest/core/app_color.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool showBack;
  final Color? backgroundColor;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.showBack = true,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: TextStyle(color: AppColors.lightBackground),),
      centerTitle: true,
      backgroundColor: backgroundColor ?? AppColors.primary,
      elevation: 2,
      leading: showBack
          ? IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white,),
        onPressed: () => Navigator.pop(context),
      )
          : null,

      actions: actions,
    );
  }
}