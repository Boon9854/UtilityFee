import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:utility_calculate/component/util.dart';
import 'package:utility_calculate/view/calculation_view.dart';

import '../component/button_component.dart';
import '../constant.dart';

class UtilityAmountView extends StatefulWidget {
  const UtilityAmountView({Key? key}) : super(key: key);

  @override
  State<UtilityAmountView> createState() => _UtilityAmountViewState();
}

class _UtilityAmountViewState extends State<UtilityAmountView> {
  TextEditingController tfAmount = TextEditingController();

  _setupConstant() async {
    Size size = MediaQuery.of(context).size;
    Constant.appBarHeight = AppBar().preferredSize.height;
    Constant.screenHeight = size.height;
    Constant.screenWidth = size.width;
  }

  bool validation() {
    if (tfAmount.text == "") {
      Util.callToast("Please key in Utility Amount");
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    _setupConstant();

    return GestureDetector(
      onTap: () {
        Util.hideKeyboard(context);
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Simei 105",
                style: TextStyle(fontSize: FontSize.size20),
              ),
              Text(
                "Utility Calculation",
                style: TextStyle(fontSize: FontSize.size28),
              ),
              SizedBox(
                height: Constant.superBigGap * 2,
              ),
              SizedBox(
                width: Constant.screenWidth * 0.8,
                child: TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                      hintText: 'E.g.: 200.00',
                      labelText: "Total Utility Amount"),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  controller: tfAmount,
                  style: TextStyle(
                    color: Constant.primaryBlue,
                  ),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                  ],
                  minLines: 1,
                  maxLines: 1,
                ),
              ),
              SizedBox(
                height: Constant.mediumGap,
              ),
              ButtonGeneralSmall(
                text: "Next",
                width: Constant.screenWidth * 0.8,
                onPressed: () {
                  if (validation()) {
                    Util.switchPageAnimation(
                        context,
                        CalculationView(
                          amount: double.parse(tfAmount.text),
                        ));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
