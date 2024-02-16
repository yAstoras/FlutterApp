import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';
import 'drawer_tile.dart';

class CustomDrawer extends StatefulWidget {
  final PageController pageController;

  const CustomDrawer(this.pageController, {super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: const EdgeInsets.only(left: 32.0, top: 16.0),
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 8.0),
          padding: const EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
          height: 170.0,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 8.0,
                left: 0.0,
                child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset('assets/images/logo.png')),
              ),
              const Positioned(
                  left: 0.0,
                  bottom: 0.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Usuário',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
            ],
          ),
        ),
        const Divider(),
        DrawerTile(
            Icons.home_outlined, 'Home', widget.pageController, Routes.HOME),
        const Divider(),
        DrawerTile(Icons.add_shopping_cart, 'Comprar', widget.pageController,
            Routes.COMPRAR),
        const Divider(),
      ],
    ));
  }
}
