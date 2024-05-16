import 'package:fit_raho/src/home/screens/home_screen.dart';

import 'src/auth/screens/login_screen.dart';
import 'src/auth/screens/signup_screen.dart';

final routes = {
  SignupScreen.routeName: (ctx) => const SignupScreen(),
  LoginScreen.routeName: (ctx) => const LoginScreen(),
  HomeScreen.routeName: (ctx) => const HomeScreen(),
};
