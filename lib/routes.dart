import 'package:fit_raho/src/auth/screens/signup_screens/owner_signup_screen.dart';
import 'package:fit_raho/src/auth/screens/signup_screens/trainer_signup_screen.dart';
import 'package:fit_raho/src/home/screens/client_screen/client_home_screen.dart';

import 'src/auth/screens/signin_screen.dart';
import 'src/auth/screens/signup_screens/client_signup_screen.dart';

final routes = {
  LoginScreen.routeName: (ctx) => const LoginScreen(),
  ClientSignUpScreen.routeName: (ctx) => const ClientSignUpScreen(),
  TrainerSignUpScreen.routeName: (ctx) => const TrainerSignUpScreen(),
  OwnerSignUpScreen.routeName: (ctx) => const OwnerSignUpScreen(),
  ClientHomeScreen.routeName: (ctx) => const ClientHomeScreen(),

//   // HomeScreen.routeName: (ctx) => const HomeScreen(),
//   // TrainerHomeScreen.routeName: (ctx) => const TrainerHomeScreen(),
//   // TrainerProfileScreen.routeName: (ctx) => const TrainerProfileScreen(),
//   // AdminScreen.routeName: (ctx) => const AdminScreen(),
//   ManageTrainerScreen.routeName: (ctx) => const ManageTrainerScreen(),
//   TrainerDetailsScreen.routeName: (ctx) => const TrainerDetailsScreen(),
//   AddTrainers.routeName: (ctx) => const AddTrainers(),
};
