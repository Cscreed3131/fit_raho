import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_raho/src/home/providers/user_data_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final roleProvider = FutureProvider<String>((ref) async {
  final userData =
      ref.watch(userDataProvider(FirebaseAuth.instance.currentUser!.uid));
  String role = 'loading';
  userData.when(
    data: (data) {
      role = data!.role;
    },
    error: (error, stackTrace) {
      log(error.toString());
      role = 'error';
    },
    loading: () {
      role = 'loading';
    },
  );
  return role;
});
