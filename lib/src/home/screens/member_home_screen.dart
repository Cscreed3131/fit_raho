import 'dart:developer';

import 'package:fit_raho/src/home/providers/get_user_provider/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MemberHomeScreen extends ConsumerStatefulWidget {
  const MemberHomeScreen({super.key});

  @override
  ConsumerState<MemberHomeScreen> createState() => _MemberHomeScreenState();
}

class _MemberHomeScreenState extends ConsumerState<MemberHomeScreen> {
  List<String> workoutType = [
    "10 Pull ups",
    "10 Push ups",
    "3 x 15 (5 kg dumbels)",
    "2 x 15 Squarts"
  ];

  List<String> imagePath = [
    "assets/images/pull_up_image.jpeg",
    "assets/images/push-up.png",
    "assets/images/sport.png",
    "assets/images/equipment.png"
  ];
  bool isDone = true;
  @override
  Widget build(BuildContext context) {
    return ref.watch(userProvider).when(
      data: (data) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
                      const Text(
                        'Lets get started!',
                        style: TextStyle(
                          fontSize: 20,
                          // color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height * 0.2),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: workoutType.length,
                    itemBuilder: ((context, index) {
                      return Container(
                        width: 365,
                        height: 200,
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          image: DecorationImage(
                            image: AssetImage(imagePath[index]),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(imagePath[index], width: 90),
                            Text(
                              workoutType[index],
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400),
                            ),
                            const ImageIcon(
                              AssetImage('assets/images/workout.png'),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        log(error.toString());
        return const Center(child: Text('Error'));
      },
      loading: () {
        return const Center(child: CircularProgressIndicator.adaptive());
      },
    );
  }
}
