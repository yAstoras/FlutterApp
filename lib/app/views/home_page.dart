import 'dart:async';
import 'package:flutter/material.dart';
import '../models/http_model.dart';
import '../widgets/icon_button.dart';
import '../widgets/drawer/custom_drawer.dart';
import '../controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer? timer;

  var homeController = HomeController();
  var httpModel = HttpModel();
  var iconButtons = IconButtons();

  bool isLoading = true;
  final _formkey = GlobalKey<FormState>();
  final _pageController = PageController();

  void goTo(route) {
    setState(() {
      if (route == '/login') {
      } else {
        Navigator.of(context).pushReplacementNamed(route);
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    {
      isLoading = false;
      return SafeArea(
          top: true,
          bottom: true,
          child: Scaffold(
            extendBodyBehindAppBar: false,
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Aladdin Tapetes         ',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ],
                ),
              ),
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    color: Colors.white,
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  );
                },
              ),
              backgroundColor: const Color.fromARGB(255, 57, 16, 0),
              elevation: 0,
            ),
            drawer: CustomDrawer(_pageController),
            body: Form(
              key: _formkey,
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 0),
                            child: SizedBox(
                              height: 150.0,
                              width: 150.0,
                              child: Image.asset('assets/images/logo.png'),
                            ),
                          ),
                        ),
                        if (!isLoading) ...[
                          SizedBox(
                            height: 40,
                            child: homeController.textTittle(),
                          ),
                          const Flex(
                            mainAxisAlignment: MainAxisAlignment.end,
                            direction: Axis.vertical,
                          ),
                          const Divider(),
                          SizedBox(
                            height: 65,
                            child: homeController.comprarButton(context),
                          ),
                          const Divider(),
                          SizedBox(
                            height: 65,
                            child: homeController.pedidosButton(context),
                          ),
                        ] else ...[
                          const Center(child: CircularProgressIndicator())
                        ],
                        const SizedBox(
                          height: 150,
                        ),
                      ]),
                ),
              ),
            ),
          ));
    }
  }
}
