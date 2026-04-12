import 'package:flutter/material.dart';
import 'package:tool_nest/config/AppRoutes/route_name.dart';
import 'package:tool_nest/utils/action_container.dart';
import 'package:tool_nest/utils/action_title_container.dart';
import 'package:tool_nest/utils/custom_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'ToolNest', showBack: false,),
      body: Column(
        children: [
          ActionTitleCont(title: 'Converters',),
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
                    subtitle: 'Convert Currency from one country to other country',
                  ),
                  ActionContainer(
                    tag: 'Length',
                    onTap: () {Navigator.pushNamed(context, Routes.length);},
                    title: 'Length Converter',
                    subtitle: 'Convert length from one unit to other units',

                  ),
                  ActionContainer(
                    tag: 'Temperature',
                    onTap: () {Navigator.pushNamed(context, Routes.temp);},
                    title: 'Temperature Converter',
                         subtitle:  'Convert temperature from one unit to other units',
                  ),

                  ActionContainer(
                    tag: 'Weight',
                    onTap: () {Navigator.pushNamed(context, Routes.weight);},
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
}
