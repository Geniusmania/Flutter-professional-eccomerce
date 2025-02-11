import 'package:flutter/material.dart';

import '../../../utils/helpers/helper_functions.dart';
import '../roudedContainer/rounded_container.dart';

class ChoiceChipWidget extends StatelessWidget {
  const ChoiceChipWidget({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
    this.isColorChip = false,  // Add this parameter
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;
  final bool isColorChip;  // New parameter to explicitly specify chip type

  @override
  Widget build(BuildContext context) {
    // Only check for color if it's explicitly a color chip
    final isColor = isColorChip && HelperFunctions.getColor(text) != null;

    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? Colors.white : null),
        avatar: isColor
            ? RoundedContainer(
            width: 50,
            height: 50,
            backgroundColor: HelperFunctions.getColor(text)!)
            : null,
        shape: isColor ? const CircleBorder() : null,
        labelPadding: isColor ? const EdgeInsets.all(0) : null,
        padding: isColor ? const EdgeInsets.all(0) : null,
        backgroundColor: isColor ? HelperFunctions.getColor(text)! : null,
      ),
    );
  }
}