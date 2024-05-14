import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:user_repository/user_repository.dart';

import '../components/my_text_field.dart';
import '../providers/sign_up_provider/sign_up_provider.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});
  static const routeName = '/signup';
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final _key = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _genderController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool signInRequired = false;
  IconData iconPassword = CupertinoIcons.eye_fill;
  bool obscurePassword = true;
  // String? _errorMsg;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _genderController.dispose();
    _dateOfBirthController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signUp = ref.watch(signUpProvider.notifier);

    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: screenHeight * 0.025,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  height: screenHeight * 0.15,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/logo.png'),
                        fit: BoxFit.fitWidth),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  // bottom: screenHeight * 0.025,
                  top: screenHeight * 0.025,
                ),
                child: Text(
                  'Sign-up as Member',
                  style: TextStyle(
                    height: screenHeight * 0.001,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    // fontFamily: 'IBMPlexMono',
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.75),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Card(
                  // width: double.infinity,
                  child: Form(
                    key: _key,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          MyTextField(
                            controller: _nameController,
                            hintText: 'Name',
                            obscureText: false,
                            keyboardType: TextInputType.name,
                            prefixIcon: const Icon(Icons.man_4_outlined),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Name can\'t be empty';
                              } else if (RegExp(r'[0-9]').hasMatch(val)) {
                                return 'Name can\'t contain numbers';
                              } else if (RegExp(
                                      r'[!@#<>?":_`~;[\]\\|=+)(*&^%$]')
                                  .hasMatch(val)) {
                                return 'Name can\'t contain special characters';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          MyTextField(
                            controller: _phoneNumberController,
                            hintText: 'Mobile',
                            obscureText: false,
                            keyboardType: TextInputType.phone,
                            prefixIcon:
                                const Icon(Icons.phone_android_outlined),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Mobile number can\'t be empty';
                              } else if (!RegExp(r'^[0-9]{10}$')
                                  .hasMatch(val)) {
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
                                    hintStyle:
                                        TextStyle(color: Colors.grey[500]),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    prefixIcon:
                                        const Icon(Icons.person_outline),
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
                                        final formattedDate =
                                            DateFormat('dd/MM/yyyy')
                                                .format(selectedDate);
                                        _dateOfBirthController.text =
                                            formattedDate;
                                      }
                                    });
                                  },
                                  child: AbsorbPointer(
                                    // nice widget disables the pointer on text field
                                    child: MyTextField(
                                      controller: _dateOfBirthController,
                                      hintText: 'Date of Birth',
                                      keyboardType: TextInputType.none,
                                      obscureText: false,
                                      prefixIcon: const Icon(
                                          Icons.calendar_month_outlined),
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
                          MyTextField(
                              controller: _emailController,
                              hintText: 'Email',
                              obscureText: false,
                              keyboardType: TextInputType.emailAddress,
                              prefixIcon: const Icon(Icons.email_outlined),
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Email can\'t be empty';
                                } else if (!RegExp(
                                        r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$')
                                    .hasMatch(val)) {
                                  return 'Enter a valid email';
                                }
                                return null;
                              }),
                          const SizedBox(
                            height: 7,
                          ),
                          MyTextField(
                            controller: _passwordController,
                            hintText: 'Password',
                            obscureText: obscurePassword,
                            keyboardType: TextInputType.visiblePassword,
                            prefixIcon: const Icon(Icons.lock_outline),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Password can\'t be empty';
                              } else if (val.length < 8) {
                                return 'Password must be at least 8 characters long';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          MyTextField(
                            controller: _confirmPasswordController,
                            hintText: 'Confirm Password',
                            obscureText: obscurePassword,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.visiblePassword,
                            prefixIcon: const Icon(Icons.password_outlined),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscurePassword = !obscurePassword;
                                  if (obscurePassword) {
                                    iconPassword = CupertinoIcons.eye_fill;
                                  } else {
                                    iconPassword =
                                        CupertinoIcons.eye_slash_fill;
                                  }
                                });
                              },
                              icon: Icon(iconPassword),
                            ),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Confirm password can\'t be empty';
                              } else if (val != _passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Theme.of(context)
                                            .colorScheme
                                            .secondary),
                                    shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_key.currentState!.validate()) {
                                      MyUser myUser = MyUser.empty;
                                      myUser.email = _emailController.text;
                                      myUser.name = _nameController.text;
                                      myUser.phoneNumber =
                                          _phoneNumberController.text;
                                      myUser.dateOfBirth =
                                          _dateOfBirthController.text;
                                      myUser.gender = _genderController.text;
                                      myUser.role = 'member';
                                      signUp.submit(
                                          myUser, _passwordController.text);
                                    }
                                  },
                                  child: const Text(
                                    'Sign up',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          const Text(
                            'Already have an account?',
                            style: TextStyle(
                              height: 0.5,
                              fontSize: 20,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Login Instead',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
