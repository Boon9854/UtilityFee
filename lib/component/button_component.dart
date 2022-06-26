import 'package:flutter/material.dart';

import '../constant.dart';

class ButtonIconRound extends StatelessWidget {
  final List<Color> colorsList;
  final IconData icon;
  final Color iconColor;
  final Function onPressed;
  final double radius;

  const ButtonIconRound(
      {Key? key, required this.colorsList, this.icon = Icons.add, required this.onPressed, this.iconColor = Colors.white, this.radius = 100})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Constant.white,
        border: Border.all(width: 1, color: Constant.mediumGrey),
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
        gradient: LinearGradient(
          colors: colorsList,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          onPressed();
        },
        child: Icon(
          icon,
          size: 38,
          color: iconColor,
        ),
      ),
    );
  }
}

class ButtonGeneral extends StatelessWidget {
  final Function onPressed;
  final String text;
  final double? textSize;
  final List<Color>? colors;
  final double? width;
  final double? radius;

  ButtonGeneral({
    Key? key,
    required this.onPressed,
    required this.text,
    this.colors,
    this.width,
    this.textSize,
    this.radius = 6,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> colorList = [
      Constant.primaryBlue,
      Constant.primaryBlue,
    ];

    if (colors != null) {
      colorList = colors!;
    }

    return Container(
      width: width == null ? null : Constant.screenWidth * width!,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colorList,
        ),
        borderRadius: BorderRadius.circular(radius!),
        border: Border.all(color: Constant.mediumGrey, width: 1),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius!)),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        ),
        onPressed: () {
          onPressed();
        },
        child: Text(
          text,
          style: TextStyle(
            color: Constant.white,
            fontSize: textSize ?? FontSize.size18,
          ),
        ),
      ),
    );
  }
}

class ButtonGeneralSmall extends StatelessWidget {
  final Function onPressed;
  final String text;
  final List<Color>? colors;
  final Color? textColor;
  final double? width;
  final double? textSize;
  final double? height;
  final double? radius;
  final EdgeInsetsGeometry? padding;

  const ButtonGeneralSmall({
    Key? key,
    required this.onPressed,
    required this.text,
    this.colors,
    this.width,
    this.textSize,
    this.height = 35,
    this.radius = 6,
    this.textColor,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> colorList = [
      Constant.primaryBlue,
      Constant.primaryBlue,
    ];

    if (colors != null) {
      colorList = colors!;
    }
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colorList,
        ),
        borderRadius: BorderRadius.circular(radius!),
        border: Border.all(color: Constant.mediumGrey, width: 1),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius!)),
          padding: padding,
        ),
        onPressed: () {
          onPressed();
        },
        child: Text(
          text,
          style: TextStyle(
            color: textColor ?? Constant.white,
            fontSize: textSize ?? FontSize.size14,
          ),
        ),
      ),
    );
  }
}

class ButtonFloating extends StatelessWidget {
  final String name;
  final Function onPressed;

  const ButtonFloating({Key? key, required this.name, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(0, 4),
            blurRadius: 6,
          ),
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(colors: [Constant.primaryBlue, Constant.primaryBlue]),
      ),
      child: FloatingActionButton.extended(
        elevation: 0,
        icon: Icon(
          Icons.add,
          color: Constant.white,
        ),
        label: Text(
          name,
          style: TextStyle(color: Constant.white),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        backgroundColor: Constant.transparent,
        onPressed: () {
          onPressed();
        },
      ),
    );
  }
}
