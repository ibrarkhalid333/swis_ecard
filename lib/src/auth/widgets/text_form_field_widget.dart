import 'package:flutter/material.dart';
import 'package:swisecard/core/utils/utils.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    Key? key,
    required this.controller,
    required this.currentFocusNode,
    this.nextFocusNode,
    required this.labelText,
    this.obscureText = false,
    this.validator,
    this.isLastField = false,
    this.suffixIcon,
    this.keyboardType,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode currentFocusNode;
  final FocusNode? nextFocusNode;
  final String labelText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final bool isLastField;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: currentFocusNode,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        suffixIcon: suffixIcon,
      ),
      validator: validator,
      onFieldSubmitted: isLastField
          ? null
          : (value) {
              if (nextFocusNode != null) {
                Utils.fieldFocusChange(
                  context,
                  currentFocusNode,
                  nextFocusNode!,
                );
              } else {
                currentFocusNode.unfocus();
                FocusScope.of(context).nextFocus();
              }
            },
    );
  }
}
