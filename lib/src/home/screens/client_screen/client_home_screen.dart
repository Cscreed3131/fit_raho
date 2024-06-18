// import 'dart:developer';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fit_raho/src/home/providers/user_data_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class ClientHomeScreen extends ConsumerWidget {
//   const ClientHomeScreen({super.key});

//   static const String routeName = '/client-home';

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final userId = FirebaseAuth.instance.currentUser!.uid;
//     ref.watch(userDataProvider(userId)).when(
//           data: (data) {
//             log(data.toString());
//           },
//           error: (error, stackTrace) {
//             log(error.toString());
//             log(stackTrace.toString());
//           },
//           loading: () => const CircularProgressIndicator.adaptive(),
//         );
//     return const Scaffold(
//       body: Center(
//         child: Text('Hey!'),
//       ),
//     );
//   }
// }

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_raho/src/home/providers/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ClientHomeScreen extends ConsumerStatefulWidget {
  const ClientHomeScreen({super.key});
  static const String routeName = '/client-home';
  @override
  ConsumerState<ClientHomeScreen> createState() => _ClientHomeScreenState();
}

class _ClientHomeScreenState extends ConsumerState<ClientHomeScreen> {
  List<String> workoutType = [
    "10 Pull ups",
    "5 Mins Plank",
    "3 x 15 (5 Kg)",
    "2 x 15 (20 Kg)"
  ];

  List<String> imagePath = [
    "assets/images/pull_up_image.jpeg",
    "assets/images/plank.jpeg",
    "assets/images/dumble.jpeg",
    "assets/images/bench_press.jpeg"
  ];
  bool isDone = true;

  @override
  Widget build(BuildContext context) {
    return ref
        .watch(userDataProvider(FirebaseAuth.instance.currentUser!.uid))
        .when(
      data: (data) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
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
                        'Lets get started!',
                        style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.8),
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
                        width: double.infinity,
                        height: 200,
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(imagePath[index]),
                            fit: BoxFit.cover,
                          ),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Image.asset(imagePath[index], width: 90),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.09),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                  workoutType[index],
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    isDone = !isDone;
                                  });
                                },
                                icon: FaIcon(
                                  FontAwesomeIcons.squareCheck,
                                  color: isDone
                                      ? Colors.green
                                      : Colors.grey.shade400,
                                ),
                              ),
                            ],
                          ),
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
