import 'package:flutter/material.dart';
import 'package:projeto_desafio/app/views/home_page.dart';
import '../models/http_model.dart';
import '../models/login_model.dart';
import '../services/login_service.dart';

class LoginController {
  var loginModel = LoginModel();
  var loginService = LoginService();
  var httpModel = HttpModel();

  Future<bool> login(login, password, context) async {
    bool response;
    response = true;
    return response;
  }

  Widget fieldLogin(context) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Login',
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
      controller: loginModel.login,
      keyboardType: TextInputType.text,
      validator: (login) {
        if (login == null || login.isEmpty) {
          return 'Por favor, digite seu login';
        }
        return null;
      },
    );
  }

  Widget fieldPass(context) {
    return TextFormField(
        controller: loginModel.password,
        obscureText: true,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1.0),
            ),
            labelText: 'Senha',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            )),
        validator: (senha) {
          if (senha == null || senha.isEmpty) {
            return 'Por favor, digite sua senha';
          }
          return null;
        });
  }

  Widget loginButton(context, formkey) {
    return ElevatedButton(
      child: const Text('Entrar'),
      onPressed: () async {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      },
    );
  }
}
