import 'package:flutter/material.dart';
import 'package:projeto_desafio/app/routes/app_routes.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final PageController controller;
  final String route;

  const DrawerTile(this.icon, this.text, this.controller, this.route);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () async {
          Navigator.of(context).pop();
          if (route == Routes.LOGIN) {
          } else {}
        },
        child: SizedBox(
          height: 60.0,
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                size: 32.0,
                color: Colors.grey[750],
              ),
              const SizedBox(width: 32.0),
              Text(
                text,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[750],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
