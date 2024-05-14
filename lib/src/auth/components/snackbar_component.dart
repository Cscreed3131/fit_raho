import 'package:flutter/material.dart';

class SnackBarBuilder extends StatelessWidget {
  final String message;

  const SnackBarBuilder({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
    return Container(); // Replace with the appropriate widget.
  }
}
