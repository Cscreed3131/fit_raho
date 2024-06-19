// import 'package:fit_raho/src/admin/screens/add_trainers/add_trainers.dart';
import 'package:fit_raho/widgets/profile_dialog_box_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add_trainer_screen.dart';
import 'available_trainer_screen.dart';

class OwnerHomeScreen extends StatelessWidget {
  const OwnerHomeScreen({super.key});
  static const routeName = 'OwnerHome';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text('Owner Home'),
        actions: const [ProfileDialogBox()],
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue.shade100,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  title: const Text('Available Trainers'),
                  leading: const Icon(CupertinoIcons.person_2_alt),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(ManageTrainerScreen.routeName);
                  },
                  minLeadingWidth: 50,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue.shade100,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  title: const Text('Add Trainers'),
                  leading: const Icon(CupertinoIcons.person_add_solid),
                  onTap: () {
                    Navigator.of(context).pushNamed(AddTrainers.routeName);
                  },
                  minLeadingWidth: 50,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue.shade100,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  title: const Text('Manage Clients'),
                  leading:
                      const Icon(CupertinoIcons.person_2_square_stack_fill),
                  onTap: () {
                    // Navigator.of(context).pushNamed();
                  },
                  minLeadingWidth: 50,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
