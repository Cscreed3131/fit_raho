import 'src/auth/screens/signin_screen.dart';
import 'src/auth/screens/signup_screens/client_signup_screen.dart';
import 'src/auth/screens/signup_screens/owner_signup_screen.dart';
import 'src/auth/screens/signup_screens/trainer_signup_screen.dart';
import 'src/home/screens/client_screen/client_home_screen.dart';
import 'src/home/screens/owner_screen/add_trainer_screen.dart';
import 'src/home/screens/owner_screen/available_trainer_screen.dart';
import 'src/home/screens/owner_screen/owner_home_screen.dart';
import 'src/home/screens/owner_screen/trainer_details_screen.dart';
import 'src/home/screens/trainer_screen/trainer_home_screen.dart';

final routes = {
  LoginScreen.routeName: (ctx) => const LoginScreen(),
  ClientSignUpScreen.routeName: (ctx) => const ClientSignUpScreen(),
  TrainerSignUpScreen.routeName: (ctx) => const TrainerSignUpScreen(),
  OwnerSignUpScreen.routeName: (ctx) => const OwnerSignUpScreen(),
  ClientHomeScreen.routeName: (ctx) => const ClientHomeScreen(),
  OwnerHomeScreen.routeName: (ctx) => const OwnerHomeScreen(),
  TrainerHomeScreen.routeName: (ctx) => const TrainerHomeScreen(),
  ManageTrainerScreen.routeName: (ctx) => const ManageTrainerScreen(),
  TrainerDetailsScreen.routeName: (ctx) => const TrainerDetailsScreen(),
  AddTrainers.routeName: (ctx) => const AddTrainers(),
};
