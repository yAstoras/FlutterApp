// ignore_for_file: use_build_context_synchronously, prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class ComprarController {
  Widget textTittle() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: const <Widget>[
          Center(
            child: Text(
              'Tapetes de alta qualidade',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
            ),
          )
        ]);
  }

  Widget comprarButton(
    context,
  ) {
    return ElevatedButton(
      onPressed: () async {
        Navigator.pushReplacementNamed(context, Routes.COMPRAR);
      },
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Icon(Icons.add_shopping_cart),
            Text(
              '   Comprar Tapetes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            )
          ]),
    );
  }

  Widget pedidosButton(
    context,
  ) {
    return ElevatedButton(
      onPressed: () async {
        Navigator.pushReplacementNamed(context, Routes.COMPRAR);
      },
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Icon(Icons.list_alt),
            Text(
              '   Meus Pedidos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            )
          ]),
    );
  }
}
