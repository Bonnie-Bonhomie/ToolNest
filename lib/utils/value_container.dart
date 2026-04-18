import 'package:flutter/material.dart';
import 'package:tool_nest/core/app_color.dart';

class ValueContainer extends StatelessWidget {
  const ValueContainer({
    super.key,
    required this.child,
    this.height= 50,
    this.padding = 10,
    // required this.selectedUnit,
  });

  final Widget child;
  final double height;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: height,
        padding: EdgeInsets.all(padding),
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
