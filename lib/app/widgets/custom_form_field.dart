import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFormField<T> extends StatelessWidget {
  final Widget child;
  final FormFieldValidator<T>? validator;
  final double? indent;

  const CustomFormField({
    Key? key,
    required this.child,
    this.validator,
    this.indent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      validator: validator,
      builder: (FormFieldState<T> state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            child,
            if (state.hasError)
              Text(
                state.errorText!,
                style: Get.textTheme.caption?.copyWith(
                  color: const Color(0xffd92727),
                ),
              ).marginOnly(
                left: indent ?? 0,
                top: 8,
              ),
          ],
        );
      },
    );
  }
}
