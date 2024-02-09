import 'package:flutter/material.dart';
import 'package:ghibli_studio/pages/home_page.dart';
import 'package:ghibli_studio/pages/welcome_page.dart';

import 'package:ghibli_studio/widgets/file_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        WelcomePage.routeName: (context) => WelcomePage(),
        FilmDetails.routeName: (context) => FilmDetails(),
      },
    );
  }
}
