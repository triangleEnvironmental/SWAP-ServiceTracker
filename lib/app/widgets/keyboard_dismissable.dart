import 'package:flutter/material.dart';
import 'package:moderator_app/app/utils/index.dart';

class KeyboardDismissable extends StatelessWidget {
  final Widget child;
  const KeyboardDismissable({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        closeKeyboard();
      },
      child: child,
    );
  }
}
