import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_raho/models/client/client_model.dart';
import 'package:fit_raho/models/owner/owner_model.dart';
import 'package:fit_raho/models/trainer/trainer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userSignOutProvider = Provider<UserSignOut>((ref) => UserSignOut());

class UserSignOut {
  Future<void> logOut() async {
    Client.empty;
    Owner.empty;
    Trainer.empty;
    await FirebaseAuth.instance.signOut();
  }
}
