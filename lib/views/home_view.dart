import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tool_nest/config/AppRoutes/route_name.dart';
import 'package:tool_nest/core/app_color.dart';
import 'package:tool_nest/core/app_text_string.dart';
import 'package:tool_nest/utils/action_container.dart';
import 'package:tool_nest/utils/action_title_container.dart';
import 'package:tool_nest/utils/custom_app_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool openDrawer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppText.appName, showBack: false),
      drawer: Drawer(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: ActionTitleCont(
                title: AppText.appName,
              ),
            ),
            const SizedBox(height: 30,),
            serviceTile(
                title: AppText.convert,
                icon: Icons.screen_rotation_alt_outlined,
                onTap: () {
                  Navigator.pop(context);
                }
            ),
            serviceTile(
              title: 'My Tasks',
              icon: Icons.checklist_rtl,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, Routes.task);
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          ActionTitleCont(
            title: AppText.convert,
            showDrawer: true,
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  ActionContainer(
                    tag: 'Currency',
                    onTap: () {
                      Navigator.pushNamed(context, Routes.currency);
                    },
                    title: 'Currency Converter',
                    subtitle:
                        'Convert Currency from one country to other country',
                  ),
                  ActionContainer(
                    tag: 'Length',
                    onTap: () {
                      Navigator.pushNamed(context, Routes.length);
                    },
                    title: 'Length Converter',
                    subtitle: 'Convert length from one unit to other units',
                  ),
                  ActionContainer(
                    tag: 'Temperature',
                    onTap: () {
                      Navigator.pushNamed(context, Routes.temp);
                    },
                    title: 'Temperature Converter',
                    subtitle:
                        'Convert temperature from one unit to other units',
                  ),

                  ActionContainer(
                    tag: 'Weight',
                    onTap: () {
                      Navigator.pushNamed(context, Routes.weight);
                    },
                    title: 'Weight Converter',
                    subtitle: 'Convert Weight from one unit to other units',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ListTile serviceTile({required String title, required VoidCallback onTap, required IconData icon }) {
    return ListTile(
      title: Text(title),
      tileColor: Colors.transparent,
      leading: CircleAvatar(backgroundColor: AppColors.primary, child: Icon(icon),),
      onTap: onTap
    );
  }
}
