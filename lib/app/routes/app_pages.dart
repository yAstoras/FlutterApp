// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:projeto_desafio/app/views/comprar_page.dart';
import 'app_routes.dart';
import '../views/load_page.dart';
import '../views/login_page.dart';
import '../views/home_page.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.LOAD;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
    ),
    GetPage(
      name: Routes.LOAD,
      page: () => const LoadPage(),
    ),
    GetPage(
      name: Routes.COMPRAR,
      page: () => const ComprarPage(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
    ),
  ];
}
