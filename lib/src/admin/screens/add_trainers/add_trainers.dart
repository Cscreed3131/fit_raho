import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTrainers extends StatefulWidget {
  const AddTrainers({super.key});
  static const routeName = 'add-trainers';
  @override
  State<AddTrainers> createState() => _AddTrainersState();
}

// this page lets you add new trainers to the gym
class _AddTrainersState extends State<AddTrainers> {
  final _formKey = GlobalKey<FormState>();
  // also we something here for the name controller,
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _genderController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  final _experienceController = TextEditingController();
  final _joiningDateController = TextEditingController();
  final _leavingDateController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneNumberController.dispose();
    _genderController.dispose();
    _dateOfBirthController.dispose();
    _experienceController.dispose();
    _joiningDateController.dispose();
    _leavingDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text('Add Trainers'),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
              child: Column(
                children: [
                  Container(
                    height: 170,
                    width: 170,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.cyan,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _nameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      hintText: 'Enter name of trainer',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Name can\'t be empty';
                      } else if (RegExp(r'[0-9]').hasMatch(val)) {
                        return 'Name can\'t contain numbers';
                      } else if (RegExp(r'[!@#<>?":_`~;[\]\|=+)(*&^%$]')
                          .hasMatch(val)) {
                        return 'Name can\'t contain special characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  TextFormField(
                    controller: _phoneNumberController,
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      hintText: 'Enter phone number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                    // prefixIcon: const Icon(Icons.phone_android_outlined),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Mobile number can\'t be empty';
                      } else if (!RegExp(r'^[0-9]{10}$').hasMatch(val)) {
                        return 'Enter a valid mobile number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          borderRadius: BorderRadius.circular(20),
                          value: _genderController.text.isEmpty
                              ? null
                              : _genderController.text,
                          decoration: InputDecoration(
                            hintText: 'Gender',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          items: const [
                            DropdownMenuItem<String>(
                              value: 'Male',
                              child: Text('Male'),
                            ),
                            DropdownMenuItem<String>(
                              value: 'Female',
                              child: Text('Female'),
                            ),
                            DropdownMenuItem<String>(
                              value: 'Others',
                              child: Text('Others'),
                            ),
                          ],
                          onChanged: (value) {
                            _genderController.text = value!;
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            ).then((selectedDate) {
                              if (selectedDate != null) {
                                final formattedDate = DateFormat('dd/MM/yyyy')
                                    .format(selectedDate);
                                _dateOfBirthController.text = formattedDate;
                              }
                            });
                          },
                          child: AbsorbPointer(
                            // nice widget disables the pointer on text field
                            child: TextFormField(
                              controller: _dateOfBirthController,
                              decoration: const InputDecoration(
                                labelText: 'Date of birth',
                                hintText: 'Enter date of birth',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.none,
                              obscureText: false,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Date of birth can\'t be empty';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  TextFormField(
                    controller: _experienceController,
                    decoration: const InputDecoration(
                      labelText: 'Experience',
                      hintText: 'Enter experience in years',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Experience can\'t be empty';
                      } else if (!RegExp(r'^[0-9]+$').hasMatch(val)) {
                        return 'Experience must be a number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            ).then((selectedDate) {
                              if (selectedDate != null) {
                                final formattedDate = DateFormat('dd/MM/yyyy')
                                    .format(selectedDate);
                                _joiningDateController.text = formattedDate;
                              }
                            });
                          },
                          child: AbsorbPointer(
                            // nice widget disables the pointer on text field
                            child: TextFormField(
                              controller: _joiningDateController,
                              decoration: const InputDecoration(
                                labelText: 'Joining Date',
                                hintText: 'Enter joining date',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.none,
                              obscureText: false,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Joining date can\'t be empty';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            ).then((selectedDate) {
                              if (selectedDate != null) {
                                final formattedDate = DateFormat('dd/MM/yyyy')
                                    .format(selectedDate);
                                _leavingDateController.text = formattedDate;
                              }
                            });
                          },
                          child: AbsorbPointer(
                            // nice widget disables the pointer on text field
                            child: TextFormField(
                              controller: _leavingDateController,
                              decoration: const InputDecoration(
                                labelText: 'Leaving Date',
                                hintText: 'Enter leaving date',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.none,
                              obscureText: false,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Leaving date can\'t be empty';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FilledButton(onPressed: () {}, child: const Text('Submit')),
      ),
    );
  }
}
