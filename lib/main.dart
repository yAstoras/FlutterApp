import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primaryContainer: const Color.fromARGB(255, 94, 27, 0),
          primary: const Color.fromARGB(255, 94, 27, 0),
          onSecondary: const Color.fromARGB(255, 57, 16, 0),
          secondary: const Color.fromARGB(255, 255, 255, 255),
        ),
        brightness: Brightness.light,
        primaryColor: const Color.fromARGB(255, 130, 37, 0),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 57, 16, 0),
        ),
      ),
      title: 'Alladin Tapetes',
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('pt', 'BR')],
    );
  }
}
