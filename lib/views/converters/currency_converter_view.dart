import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tool_nest/core/app_color.dart';
import 'package:tool_nest/utils/action_title_container.dart';
import 'package:tool_nest/utils/custom_app_bar.dart';
import 'package:tool_nest/utils/input_feld.dart';
import 'package:tool_nest/utils/value_container.dart';
import 'package:tool_nest/viewModels/currency_view_model.dart';

class CurrencyConverterView extends StatefulWidget {
  CurrencyConverterView({super.key});

  @override
  State<CurrencyConverterView> createState() => _CurrencyConverterViewState();
}

class _CurrencyConverterViewState extends State<CurrencyConverterView> {
  final TextEditingController input = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final watchModel = context.watch<CurrencyViewModel>();
    return Scaffold(
      appBar: CustomAppBar(title: 'ToolNest'),
      body: Column(
        children: [
          ActionTitleCont(title: 'Convert Currency'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Hero(
                tag: 'Currency',
                child: Material(
                  color: Colors.transparent,
                  child: ListView(
                    children: [
                      Text(
                        'Enter length value you want to convert',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      const Text('You convert From'),
                      Row(
                        children: [
                          ValueContainer(
                            child: DropdownButton(
                              underline: const SizedBox(),
                              value: watchModel.fromUnit,
                              items: watchModel.countries
                                  .map(
                                    (unit) => DropdownMenuItem(
                                      value: unit.abbrev,
                                      child: Row(
                                        children: [
                                          Text(unit.abbrev),
                                          const SizedBox(width: 10),
                                          Text(unit.unit),
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (val) {
                                context.read<CurrencyViewModel>().setFromUnit(
                                  val!,
                                );
                                // print(selectedUnit);
                              },
                            ),
                          ),
                          Expanded(
                            child: ValueContainer(
                              child: InputField(
                                input: input,
                                onChanged: (val) {
                                  context.read<CurrencyViewModel>().setInput(
                                    val,
                                  );
                                  context
                                      .read<CurrencyViewModel>()
                                      .convertToUnit();
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      const Text('You Get'),
                      Row(
                        children: [
                          ValueContainer(
                            child: DropdownButton(
                              underline: const SizedBox(),
                              value: watchModel.toUnit,
                              items: watchModel.countries
                                  .map(
                                    (unit) => DropdownMenuItem(
                                      value: unit.abbrev,
                                      child: Row(
                                        children: [
                                          Text(unit.abbrev),
                                          const SizedBox(width: 10),
                                          Text(unit.unit),
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (val) {
                                context.read<CurrencyViewModel>().setToUnit(
                                  val!,
                                );
                                // print(selectedUnit);
                              },
                            ),
                          ),
                          Expanded(
                            child: ValueContainer(
                              child: Text(
                                num.parse(
                                  watchModel.output.toStringAsFixed(6),
                                ).toString(),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Consumer<CurrencyViewModel>(
                        builder: (key, err, child) => Text(
                          err.error,
                          style: TextStyle(color: AppColors.declined),
                        ),
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
