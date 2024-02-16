import 'package:flutter/material.dart';
import '../controllers/login_controller.dart';
import '../services/login_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var loginController = LoginController();
  var loginService = LoginService();

  bool? disabled = false;

  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  bool showLoad = true;

  stopLoad() {
    Future.delayed(const Duration(milliseconds: 3800), () {
      setState(() {
        showLoad = !showLoad;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.white,
          body: Form(
            key: _formkey,
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                        height: 150.0,
                        child: Image.asset('assets/images/logo.png')),
                    const Center(
                        child: Text('Aladdin Tapetes',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700))),
                    const Divider(),
                    const SizedBox(height: 10),
                    const SizedBox(height: 10),
                    loginController.fieldLogin(context),
                    const Divider(),
                    loginController.fieldPass(context),
                    const SizedBox(height: 10),
                    SizedBox(
                        height: 50,
                        child: loginController.loginButton(context, _formkey)),
                    const SizedBox(height: 20),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
