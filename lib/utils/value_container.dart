import 'package:flutter/material.dart';
import 'package:tool_nest/core/app_color.dart';

class ValueContainer extends StatelessWidget {
  const ValueContainer({
    super.key,
    required this.child,
    this.width = 50
    // required this.selectedUnit,
  });

  final Widget child;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderGrey, width: 2),
          borderRadius: BorderRadius.circular(10.0),
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: child
      ),
    );
  }
}
