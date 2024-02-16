import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class LoadPage extends StatefulWidget {
  const LoadPage({Key? key}) : super(key: key);

  @override
  State<LoadPage> createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.of(context).pushReplacementNamed(Routes.LOGIN);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Column(children: [
          Center(
              child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 100.0),
                  child: SizedBox(
                      height: 150.0,
                      child: Image.asset('assets/images/logo.png')))),
          Center(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 100.0),
              child: const CircularProgressIndicator(
                strokeWidth: 2.0,
                valueColor: AlwaysStoppedAnimation(
                  Color.fromARGB(255, 57, 16, 0),
                ),
              ),
            ),
          ),
        ]));
  }
}
