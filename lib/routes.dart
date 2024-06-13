import 'package:fit_raho/src/admin/screens/add_trainers/add_trainers.dart';
import 'package:fit_raho/src/admin/screens/admin_screen.dart';
import 'package:fit_raho/src/admin/screens/available_trainers/manage_trainers.dart';
import 'package:fit_raho/src/admin/screens/available_trainers/trainer_details.dart';
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
  AdminScreen.routeName: (ctx) => const AdminScreen(),
  ManageTrainerScreen.routeName: (ctx) => const ManageTrainerScreen(),
  TrainerDetailsScreen.routeName: (ctx) => const TrainerDetailsScreen(),
  AddTrainers.routeName: (ctx) => const AddTrainers(),
};
