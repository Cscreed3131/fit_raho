import 'package:fit_raho/provider/authentication/auth_provider.dart';

import 'package:fit_raho/routes.dart';
import 'package:fit_raho/src/home/screens/trainer_home_screens/trainer_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/auth/screens/login_screen.dart';

class MyAppView extends ConsumerWidget {
  const MyAppView({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authenticationProvider);
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
          secondary: Colors.deepPurple.shade400,
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
      home: state.status == AuthenticationStatus.unknown
          ? const Center(child: CircularProgressIndicator.adaptive())
          : state.status == AuthenticationStatus.authenticated
              ? const TrainerHomeScreen()
              : const LoginScreen(),
      routes: routes,
    );
  }
}
