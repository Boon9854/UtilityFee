import 'package:flutter/material.dart';

import '../constant.dart';

class OnLoadingDialog extends StatefulWidget {
  final String text;
  final Widget imageWidget;

  const OnLoadingDialog({Key? key, required this.text, this.imageWidget = const SizedBox()}) : super(key: key);

  @override
  State<OnLoadingDialog> createState() => _OnLoadingDialogState();
}

class _OnLoadingDialogState extends State<OnLoadingDialog> {
  bool showCloseButton = false;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 10)).then((value) {
      showCloseButton = true;
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: SizedBox(
          width: Constant.screenWidth * 0.7,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.imageWidget,
                Text(widget.text),
                const SizedBox(
                  height: 16,
                ),
                const SizedBox(
                  child: LinearProgressIndicator(),
                ),
                const SizedBox(
                  height: 16,
                ),
                Visibility(
                  visible: showCloseButton,
                  child: const SizedBox(
                    height: 24,
                  ),
                ),
                Visibility(
                  visible: showCloseButton,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Constant.mediumGrey),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
                        child: Text("Cancel"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
