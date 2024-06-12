import 'package:fit_raho/src/home/screens/trainer_home_screens/trainer_profile.dart';

import 'src/auth/screens/login_screen.dart';
import 'src/auth/screens/signup_screen.dart';
import 'src/home/screens/members_home_screens/home_screen.dart';
import 'src/home/screens/trainer_home_screens/trainer_home_screen.dart';

final routes = {
  SignupScreen.routeName: (ctx) => const SignupScreen(),
  LoginScreen.routeName: (ctx) => const LoginScreen(),
  HomeScreen.routeName: (ctx) => const HomeScreen(),
  TrainerHomeScreen.routeName: (ctx) => const TrainerHomeScreen(),
  TrainerProfileScreen.routeName: (ctx) => const TrainerProfileScreen(),
};
