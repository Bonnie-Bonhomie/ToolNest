import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tool_nest/utils/action_title_container.dart';
import 'package:tool_nest/utils/custom_app_bar.dart';
import 'package:tool_nest/utils/input_feld.dart';
import 'package:tool_nest/utils/value_container.dart';
import 'package:tool_nest/viewModels/temp_view_model.dart';

class TempConverterView extends StatefulWidget {
  const TempConverterView({super.key});

  @override
  State<TempConverterView> createState() => _TempConverterViewState();
}

class _TempConverterViewState extends State<TempConverterView> {
  final TextEditingController input = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final wTemp = context.watch<TempViewModel>();
    return Scaffold(
      appBar: CustomAppBar(title: 'ToolNest', showBack: true,),
      body: Column(
        children: [
          ActionTitleCont(title: 'Convert Temperature'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Hero(
                tag: 'Temperature',
                child: Material(
                  color: Colors.transparent,
                  child: ListView(
                    children: [
                      Text('Enter temperature value you want to convert', style: TextStyle(fontWeight: FontWeight.bold),),
                      const SizedBox(height: 20,),
                      Text('You convert From'),
                      Row(
                        children: [
                          ValueContainer(
                            width: 50,
                            child: DropdownButton(
                              underline: const SizedBox(),
                              value: wTemp.fromUnit,
                              items: List.generate(wTemp.units.length, (index) {
                                final title = wTemp.units[index];
                                return DropdownMenuItem(
                                    value: title,
                                    child: Text(title));
                              }),
                              onChanged: (val) {
                                context.read<TempViewModel>().setFromUnit(val!);
                                // print(selectedUnit);
                              },
                            ),
                          ),
                          Expanded(
                            child: ValueContainer(
                              width: 200,
                            child: InputField(input: input, onChanged: (val){
                              context.read<TempViewModel>().setInput(val);
                              context.read<TempViewModel>().convertToUnit();
                            },),),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40,),
                      Text('You Get'),
                      Row(
                        children: [
                          ValueContainer(
                            width: 50,
                            child: DropdownButton(
                              underline: const SizedBox(),
                              value: wTemp.toUnit,
                              items: List.generate(wTemp.units.length, (index) {
                                final title = wTemp.units[index];
                                return DropdownMenuItem(
                                    value: title,
                                    child: Text(title));
                              }),
                              onChanged: (val) {
                                context.read<TempViewModel>().setToUnit(val!);
                                // print(selectedUnit);
                              },
                            ),
                          ),
                          Expanded(
                            child: ValueContainer(
                              width: 300,
                              child: Text(num.parse(wTemp.output.toStringAsFixed(6)).toString(), textAlign: TextAlign.end,)),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
