
import 'package:flutter/material.dart';
import 'package:tool_nest/core/app_color.dart';

class AppBtn extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const AppBtn({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [ AppColors.primary, AppColors.lightGreen,], begin: Alignment.bottomCenter, end: Alignment.topCenter,),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.borderGrey, width: 0)
      ),
      child: ElevatedButton(onPressed: onPressed,style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
      ), child: Text(label)),
    );
  }
}
