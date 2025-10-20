import 'package:flutter/material.dart';

class SecurityRadioTile extends StatelessWidget {
  final String value;
  final String title;
  final String selectedValue;
  final Widget? child;
  final ValueChanged<String> onChanged;
  final Widget? trailing;

  const SecurityRadioTile({
    super.key,
    required this.value,
    required this.title,
    required this.selectedValue,
    required this.onChanged,
    this.child,
    this.trailing
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RadioListTile<String>(
          title: Text(title),
          value: value,
          groupValue: selectedValue,
          onChanged: (val) => onChanged(val!),
        ),
        if (selectedValue == value && child != null)
          Padding(
            padding: const EdgeInsets.only(left: 48.0),
            child: child!,
          ),
      ],
    );
  }
}
