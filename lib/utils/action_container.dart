import 'package:flutter/material.dart';
import 'package:tool_nest/core/app_color.dart';

class ActionContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final String tag;
  final VoidCallback onTap;
  const ActionContainer({
    super.key,
    required this.title,
    required this.subtitle,
    required this.tag,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      child: GestureDetector(
        onTap: onTap,
        child: Hero(
          tag: tag,
          child: Material(
            child: Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.all(5.0),
              height: 150,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [ AppColors.primary, AppColors.lightGreen,], begin: Alignment.bottomCenter, end: Alignment.topCenter,),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppColors.borderGrey, width: 2)
              ),
              // child: child
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.screen_rotation_alt, size: 30,color: Theme.of(context).iconTheme.color,),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(subtitle, textAlign: TextAlign.center,),
                  ],
                ),
            ),
          ),
        ),
      ),
    );
  }
}
