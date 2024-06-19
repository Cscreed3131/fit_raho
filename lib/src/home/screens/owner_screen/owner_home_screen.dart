import 'package:flutter/material.dart';

class OwnerHomeScreen extends StatelessWidget {
  const OwnerHomeScreen({super.key});
  static const routeName = 'owner-home';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Owner'),
      ),
    );
  }
}
