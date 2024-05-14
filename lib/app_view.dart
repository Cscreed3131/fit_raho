import 'package:fit_raho/routes.dart';
import 'package:flutter/material.dart';

import 'src/auth/screens/login_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fit Raho',
      theme: ThemeData(
        useMaterial3: true,
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        }),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          primary: Colors.deepPurple.shade700,
          onPrimary: Colors.white,
          secondary: Colors.deepPurple.shade500,
          background: Colors.grey.shade200,
          onBackground: Colors.black,
        ),

        // card theme
        cardTheme: CardTheme(
          elevation: 5,
          color: Colors.grey.shade300,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
        ),
      ),
      home: const LoginScreen(),
      routes: routes,
    );
  }
}
