import 'package:flutter/material.dart';

class TrainerDetailsScreen extends StatefulWidget {
  const TrainerDetailsScreen({super.key});
  static const routeName = 'trainer-details';

  @override
  State<TrainerDetailsScreen> createState() => _TrainerDetailsScreenState();
}

class _TrainerDetailsScreenState extends State<TrainerDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text('Trainer Details'),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 170,
                width: 170,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.amber,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      TextFormField(
                        // enabled: false,
                        initialValue: 'Anubhav Kumar',
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ), // name of the trainer
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        initialValue: 'Male',
                        decoration: const InputDecoration(
                          labelText: 'Gender',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ), // name of the trainer
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        // enabled: false,
                        initialValue: '10',
                        decoration: const InputDecoration(
                          labelText: 'Experience',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ), // name of the trainer
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        initialValue: '19-01-2004',
                        decoration: const InputDecoration(
                          labelText: 'Join date',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ), // name of the trainer
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        enabled: false,
                        initialValue: '19-01-2025',
                        decoration: const InputDecoration(
                          labelText: 'Leave date',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ), // name of the trainer
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        initialValue: '1234567890',
                        decoration: const InputDecoration(
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ), // name of the trainer
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        enabled: false,
                        initialValue: 'Weight Training',
                        decoration: const InputDecoration(
                          labelText: 'Speciality',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ), // name of the trainer
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        enabled: false,
                        initialValue: '50',
                        decoration: const InputDecoration(
                          labelText: 'Number of Clients',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ), // name of the trainer
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
