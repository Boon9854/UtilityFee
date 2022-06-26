import 'package:flutter/material.dart';
import 'package:utility_calculate/component/button_component.dart';
import 'package:utility_calculate/constant.dart';

class CalculationView extends StatefulWidget {
  final double amount;

  const CalculationView({Key? key, required this.amount}) : super(key: key);

  @override
  State<CalculationView> createState() => _CalculationViewState();
}

class _CalculationViewState extends State<CalculationView> {
  double airconPerson = 5;
  double normalPerson = 1;
  double discountPercent = 30;

  double getNormalRoomFee() {
    double noDiscountAmount = amountBeforeDiscount() - discountAmount();
    return noDiscountAmount;
  }

  double getAirconRoomFee() {
    double afterAddAmount = amountBeforeDiscount() + (discountAmount() / airconPerson);
    return afterAddAmount;
  }

  double discountAmount() {
    double noDiscountAmount = amountBeforeDiscount();
    double total = noDiscountAmount * (discountPercent / 100).abs();
    return total;
  }

  double amountBeforeDiscount() {
    double totalPerson = airconPerson + normalPerson;
    double noDiscountAmount = widget.amount / totalPerson;
    return noDiscountAmount;
  }

  String getNormalRoomText() {
    double totalPerson = airconPerson + normalPerson;
    return "Normal Room:\n"
        "${widget.amount} / $totalPerson person = ${amountBeforeDiscount().toStringAsFixed(2)}\n"
        "${amountBeforeDiscount().toStringAsFixed(2)} - $discountPercent% = \$${getNormalRoomFee().toStringAsFixed(2)}";
  }

  String getAirconRoomText() {
    double totalPerson = airconPerson + normalPerson;
    return "Air-con Room:\n"
        "${widget.amount} / $totalPerson = ${amountBeforeDiscount().toStringAsFixed(2)}\n"
        "${amountBeforeDiscount().toStringAsFixed(2)} x $discountPercent% = ${discountAmount().toStringAsFixed(2)}\n"
        "(${discountAmount().toStringAsFixed(2)}/$airconPerson person) + ${amountBeforeDiscount().toStringAsFixed(2)} = \$${getAirconRoomFee().toStringAsFixed(2)}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: Constant.screenWidth * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Utility Fee per Person",
                style: TextStyle(fontSize: FontSize.size28, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Constant.superBigGap,
              ),
              Row(
                children: [
                  Text(
                    "who using ",
                    style: TextStyle(fontSize: FontSize.size16),
                  ),
                  Text(
                    "Normal Room",
                    style: TextStyle(fontSize: FontSize.size16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Each person pay: ",
                    style: TextStyle(fontSize: FontSize.size14, color: Constant.mediumGrey),
                  ),
                  Text(
                    "\$" + getNormalRoomFee().toStringAsFixed(2),
                    style: TextStyle(fontSize: FontSize.size16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: Constant.mediumGap,
              ),
              Row(
                children: [
                  Text(
                    "who using ",
                    style: TextStyle(fontSize: FontSize.size16),
                  ),
                  Text(
                    "Air-con Room",
                    style: TextStyle(fontSize: FontSize.size16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Each Person pay: ",
                    style: TextStyle(fontSize: FontSize.size14, color: Constant.mediumGrey),
                  ),
                  Text(
                    "\$" + getAirconRoomFee().toStringAsFixed(2),
                    style: TextStyle(fontSize: FontSize.size16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: Constant.bigGap * 2,
              ),
              TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal),
                    ),
                    labelText: "Format"),
                keyboardType: TextInputType.number,
                controller: TextEditingController(text: getNormalRoomText() + "\n\n" + getAirconRoomText()),
                style: TextStyle(
                  color: Constant.primaryBlue,
                ),
                readOnly: true,
                maxLines: 9,
                minLines: 9,
              ),
              SizedBox(
                height: Constant.smallGap,
              ),
              Text(
                "Current format only available for:",
                style: TextStyle(fontSize: FontSize.size12, color: Constant.mediumGrey),
              ),
              Text(
                "$normalPerson person with normal room, get $discountPercent% discount.",
                style: TextStyle(fontSize: FontSize.size12, color: Constant.mediumGrey),
              ),
              Text(
                "$airconPerson person with air-con room",
                style: TextStyle(fontSize: FontSize.size12, color: Constant.mediumGrey),
              ),
              SizedBox(
                height: Constant.bigGap,
              ),
              Center(
                child: ButtonGeneralSmall(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: "Back",
                  width: Constant.screenWidth * 0.3,
                  // colors: [Constant.white,Constant.white],
                  // textColor: Constant.primaryBlue,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
