import 'package:fit_raho/app_view.dart';
import 'package:fit_raho/provider/user_repository_provider/user_repository_provider.dart';
import 'package:fit_raho/simple_provider_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_repository/user_repository.dart';

class MyApp extends StatelessWidget {
  final UserRepository userRepository;
  const MyApp(this.userRepository, {super.key});
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      observers: [SimpleProviderObserver()],
      overrides: [
        userRepositoryProvider.overrideWithValue(userRepository),
      ],
      child: const MyAppView(),
    );
  }
}
