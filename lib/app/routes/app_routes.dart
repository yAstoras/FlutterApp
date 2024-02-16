// ignore_for_file: constant_identifier_names
abstract class Routes {
  Routes._();

  static const LOAD = _Paths.LOAD;
  static const HOME = _Paths.HOME;
  static const LOGIN = _Paths.LOGIN;
  static const COMPRAR = _Paths.COMPRAR;
}

abstract class _Paths {
  static const LOAD = '/';
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const COMPRAR = '/comprar';
}
