// ignore_for_file: prefer_if_null_operators
import 'package:flutter/material.dart';

class DropdownDefaultWidget extends StatelessWidget {
  final double height;
  final List<dynamic> options;
  final String? selectedValue;
  final String hint;
  final String description;
  final Widget? icon;
  final void Function(String?) onChanged;

  const DropdownDefaultWidget({
    Key? key,
    required this.height,
    required this.options,
    required this.selectedValue,
    required this.hint,
    required this.description,
    this.icon,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButtonHideUnderline(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: DropdownButton<String>(
            isExpanded: false,
            elevation: 2,
            value: selectedValue,
            hint: Text(hint),
            icon: icon != null ? icon : null,
            items: options.map<DropdownMenuItem<String>>((dynamic category) {
              return DropdownMenuItem<String>(
                value: category?[description],
                child: Text('${category[description]}'),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
