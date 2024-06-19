import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_raho/src/home/providers/user_data_provider.dart';
import 'package:fit_raho/widgets/profile_dialog_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TrainerHomeScreen extends ConsumerWidget {
  const TrainerHomeScreen({super.key});
  static const routeName = '/trainer-home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Text(
            'Fit Raho',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Theme.of(context).colorScheme.primary),
          ),
          actions: const [
            ProfileDialogBox(),
          ]),
      body: ref
          .watch(userDataProvider(FirebaseAuth.instance.currentUser!.uid))
          .when(
        data: (data) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello ${data!.name.split(' ')[0]},',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      // color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  Text(
                    'Manage your client\'s routine.',
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    // height: ,
                    constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height * 0.2),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 10,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          width: double.infinity,
                          height: 180,
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/plank.jpeg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 150,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Client Name',
                                        style: TextStyle(fontSize: 25),
                                      ),
                                      Text(
                                        'Client Routine',
                                        style: TextStyle(fontSize: 25),
                                      ),
                                      Text(
                                        'Client progress',
                                        style: TextStyle(fontSize: 25),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
        error: (error, stackTrace) {
          log(error.toString());
          return const Center(
            child: Text('An error occurred'),
          );
        },
        loading: () {
          return const Center(child: CircularProgressIndicator.adaptive());
        },
      ),
    );
  }
}
