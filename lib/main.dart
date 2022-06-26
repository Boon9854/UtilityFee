import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constant.dart';
import 'view/utility_amount_view.dart';

Future<void> main() async {
  // await SystemChrome.setPreferredOrientations(
  //   [DeviceOrientation.portraitUp],
  // );`
  runApp(const HotRestartController());
}

class HotRestartController extends StatefulWidget {
  const HotRestartController({Key? key}) : super(key: key);

  // static void restartApp(BuildContext context) {
  //   context.findAncestorStateOfType<_HotRestartControllerState>()?.performHotRestart();
  // }

  @override
  _HotRestartControllerState createState() => _HotRestartControllerState();
}

class _HotRestartControllerState extends State<HotRestartController> {

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      navigatorKey: Constant.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // fontFamily: GoogleFonts.biryani(),
        colorScheme: ColorScheme.light(
          primary: Constant.primaryBlue,
        ),
        unselectedWidgetColor: Constant.primaryBlue,
        textTheme: GoogleFonts.titilliumWebTextTheme(textTheme).copyWith(
          headline6: GoogleFonts.titilliumWeb(
            fontSize: FontSize.size20,
          ),
          //appbar title
          subtitle1: GoogleFonts.titilliumWeb(
            fontSize: FontSize.size16,
          ),
          subtitle2: GoogleFonts.titilliumWeb(
            fontSize: FontSize.size14,
          ),
          bodyText1: GoogleFonts.titilliumWeb(fontSize: FontSize.size14),
          //Tile title
          bodyText2: GoogleFonts.titilliumWeb(
            fontSize: FontSize.size14,
          ),
          //normal text
          button: GoogleFonts.titilliumWeb(fontSize: FontSize.size14),
          //button text
          overline: GoogleFonts.titilliumWeb(
            fontSize: FontSize.size10,
          ),
        ),),
      home: const UtilityAmountView(),
    );
  }
}