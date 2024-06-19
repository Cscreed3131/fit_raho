import 'package:fit_raho/providers/user_role_provider.dart';
import 'package:fit_raho/src/home/screens/client_screen/main_home_screen.dart';
import 'package:fit_raho/src/home/screens/owner_screen/owner_home_screen.dart';
import 'package:fit_raho/src/home/screens/trainer_screen/trainer_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userRoleAsyncValue = ref.watch(roleProvider);

    return userRoleAsyncValue.when(
      data: (role) {
        if (role == 'client') {
          return const MainHomeScreen();
        } else if (role == 'trainer') {
          return const TrainerHomeScreen();
        } else if (role == 'owner') {
          return const OwnerHomeScreen();
        } else {
          return const Scaffold(
            body: Center(child: Text('Role not found.')),
          );
        }
      },
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stack) => Scaffold(
        body: Center(child: Text('Error: $error')),
      ),
    );
  }
}
