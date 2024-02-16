// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';

class IconButtons {
  Widget iconButton(icon, tooltip, route, Function) {
    return IconButton(
      color: const Color.fromARGB(255, 57, 16, 0),
      icon: icon,
      iconSize: 45.0,
      tooltip: tooltip,
      onPressed: () => Function(route),
    );
  }
}
