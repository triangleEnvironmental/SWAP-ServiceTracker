import 'package:flutter/material.dart';
import 'package:moderator_app/app/widgets/index.dart';

enum ButtonType {
  elevated,
  filled,
  filledTonal,
  outlined,
  text,
}

class BottomButton extends StatelessWidget {
  final Widget child;
  final Function()? onPressed;
  final ButtonType buttonType;

  const BottomButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.buttonType = ButtonType.filled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (buttonType) {
      case ButtonType.filled:
        return FilledButton(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
          ),
          onPressed: onPressed,
          child: child,
        );
      case ButtonType.filledTonal:
        return FilledTonalButton(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
          ),
          onPressed: onPressed,
          child: child,
        );
      case ButtonType.outlined:
        return OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
            ),
          ),
          onPressed: onPressed,
          child: child,
        );
      case ButtonType.text:
        return TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
            ),
          ),
          onPressed: onPressed,
          child: child,
        );
      default:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
            ),
          ),
          onPressed: onPressed,
          child: child,
        );
    }
  }
}