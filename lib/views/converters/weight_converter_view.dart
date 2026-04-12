import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tool_nest/utils/action_title_container.dart';
import 'package:tool_nest/utils/custom_app_bar.dart';
import 'package:tool_nest/utils/input_feld.dart';
import 'package:tool_nest/utils/value_container.dart';
import 'package:tool_nest/viewModels/weight_view_model.dart';

class WeightConverterView extends StatelessWidget {
  WeightConverterView({super.key});

  final TextEditingController input = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final watchModel = context.watch<WeightViewModel>();
    return Scaffold(
      appBar: CustomAppBar(title: 'ToolNest'),
      body: Column(
        children: [
          ActionTitleCont(title: 'Convert Weight'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Hero(
                tag: 'Weight',
                child: Material(
                  color: Colors.transparent,
                  child: ListView(
                    children: [
                      Text(
                        'Enter Weight value you want to convert',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Text('You convert From'),
                      Row(
                        children: [
                          ValueContainer(
                            width: 50,
                            child: DropdownButton(
                              underline: SizedBox(),
                              value: watchModel.fromUnit,
                              items: watchModel.units.keys
                                  .map(
                                    (unit) => DropdownMenuItem(
                                      value: unit,
                                      child: Text(unit),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (val) {
                                context.read<WeightViewModel>().setFromUnit(
                                  val!,
                                );
                                // print(selectedUnit);
                              },
                            ),
                          ),
                          Expanded(
                            child: ValueContainer(
                              // width: 200,
                              child: InputField(
                                input: input,
                                onChanged: (val) {
                                  context.read<WeightViewModel>().setInput(val);
                                  context.read<WeightViewModel>().convertToUnit();
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Text('You Get'),
                      Row(
                        children: [
                          ValueContainer(
                            width: 50,
                            child: DropdownButton(
                              underline: SizedBox(),
                              value: watchModel.toUnit,
                              items: watchModel.units.keys
                                  .map(
                                    (unit) => DropdownMenuItem(
                                      value: unit,
                                      child: Text(unit),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (val) {
                                context.read<WeightViewModel>().setToUnit(val!);
                                // print(selectedUnit);
                              },
                            ),
                          ),
                          Expanded(
                            child: ValueContainer(
                              // width: 300,
                              child: Text(
                               num.parse( watchModel.output.toStringAsFixed(10)).toString(),
                                textAlign: TextAlign.end,
                              ),
                            ),
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
