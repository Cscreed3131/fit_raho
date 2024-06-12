import 'package:fit_raho/src/home/providers/get_user_provider/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TrainerProfileScreen extends ConsumerWidget {
  const TrainerProfileScreen({super.key});
  static const routeName = 'trainer-profile';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: const Text('Profile'),
        ),
        body: ref.watch(userProvider).when(
              data: (data) {
                return SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              // color: Colors.amber, // this will contain the fetched image of the trainer.
                              border: Border.all(
                                color: Colors.black, // Outline border color
                                width: 1, // Outline border width
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Name',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                height: 60,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  // color: Colors.amber,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  border: Border.all(
                                    color: Colors.black, // Outline border color
                                    width: 1, // Outline border width
                                  ),
                                ),
                                child: Text(
                                  data!.name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const Text(
                                'Gender',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                height: 60,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  // color: Colors.amber,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  border: Border.all(
                                    color: Colors.black, // Outline border color
                                    width: 1, // Outline border width
                                  ),
                                ),
                                child: Text(
                                  data.gender,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const Text(
                                'Experience',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                height: 60,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  // color: Colors.amber,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  border: Border.all(
                                    color: Colors.black, // Outline border color
                                    width: 1, // Outline border width
                                  ),
                                ),
                                child: const Text(
                                  'Experience', // add field in data base before trying to accessing
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const Text(
                                'Joining Date',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                height: 60,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  // color: Colors.amber,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  border: Border.all(
                                    color: Colors.black, // Outline border color
                                    width: 1, // Outline border width
                                  ),
                                ),
                                child: const Text(
                                  'Date of Joining', // add to data base first
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const Text(
                                'Leaving Date',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                height: 60,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  // color: Colors.amber,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  border: Border.all(
                                    color: Colors.black, // Outline border color
                                    width: 1, // Outline border width
                                  ),
                                ),
                                child: const Text(
                                  'Date of Leaving', // add to data base first
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const Text(
                                'Number of Traniees',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                height: 60,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  // color: Colors.amber,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  border: Border.all(
                                    color: Colors.black, // Outline border color
                                    width: 1, // Outline border width
                                  ),
                                ),
                                child: const Text(
                                  'Number of Clients', // add to data base first
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const Text(
                                'Phone number',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                height: 60,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  // color: Colors.amber,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  border: Border.all(
                                    color: Colors.black, // Outline border color
                                    width: 1, // Outline border width
                                  ),
                                ),
                                child: Text(
                                  data.phoneNumber.toString(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              error: (error, stackTrace) {
                return const Center(
                  child: Text('Error Connecting to server'),
                );
              },
              loading: () => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ));
  }
}
