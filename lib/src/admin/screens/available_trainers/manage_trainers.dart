import 'package:fit_raho/src/admin/screens/available_trainers/trainer_details.dart';
import 'package:flutter/material.dart';

class ManageTrainerScreen extends StatefulWidget {
  const ManageTrainerScreen({super.key});
  static const routeName = 'manage-trainer';
  @override
  State<ManageTrainerScreen> createState() => _ManageTrainerScreenState();
}

class _ManageTrainerScreenState extends State<ManageTrainerScreen> {
  // Sample data for trainers (replace with actual data from Firebase)
  // final List<Map<String, dynamic>> trainers = [
  //   {
  //     'name': 'John Doe',
  //     'email': 'john.doe@example.com',
  //     'speciality': 'Weight Training',
  //   },
  //   {
  //     'name': 'Jane Smith',
  //     'email': 'jane.smith@example.com',
  //     'speciality': 'Yoga',
  //   },
  //   // Add more trainers here
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: const Text('Manage Trainer'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // height: ,
                constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height * 0.2),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(TrainerDetailsScreen.routeName);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 150,
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 7),
                        decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 3,
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
                                    image:
                                        AssetImage('assets/images/plank.jpeg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 150,
                                // width: 200,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Anubhav Kumar',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      'Weight Lifter', // this will contain the speciality of the trainer
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      '7909020660',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      '09:20 AM - 10:20 AM',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
