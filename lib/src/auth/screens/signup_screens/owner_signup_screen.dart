import 'dart:io';

import 'package:fit_raho/components/my_text_field.dart';
import 'package:fit_raho/models/owner/owner_model.dart';
import 'package:fit_raho/src/auth/provider/signup_providers/owner_signup_provider.dart';
import 'package:fit_raho/widgets/userImagePicker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OwnerSignUpScreen extends ConsumerStatefulWidget {
  const OwnerSignUpScreen({super.key});

  static const routeName = '/owner-signup';
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OwnerSignUpScreenState();
}

class _OwnerSignUpScreenState extends ConsumerState<OwnerSignUpScreen> {
  final _key = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _gymNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  File? _selectedImage;

  bool signInRequired = false;
  IconData iconPassword = CupertinoIcons.eye_fill;
  bool obscurePassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _gymNameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signUp = ref.watch(ownerSignUpProvider);
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
                  top: screenHeight * 0.025,
                ),
                child: Text(
                  'Sign-up as Owner',
                  style: TextStyle(
                    height: screenHeight * 0.001,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.75),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Card(
                  child: Form(
                    key: _key,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          UserImagePicker(
                            onPickImage: (pickedImage) {
                              _selectedImage = pickedImage;
                            },
                          ),
                          const SizedBox(
                            height: 5,
                          ),
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
                            controller: _gymNameController,
                            hintText: 'Gym Name',
                            obscureText: false,
                            keyboardType: TextInputType.text,
                            prefixIcon: const Icon(Icons.fitness_center),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Gym name can\'t be empty';
                              }
                              return null;
                            },
                          ),
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
                                      final owner = Owner.empty;
                                      owner.email = _emailController.text;
                                      owner.gymName = _gymNameController.text;
                                      owner.name = _nameController.text;
                                      owner.role = 'owner';
                                      signUp.submit(
                                          owner,
                                          _confirmPasswordController.text,
                                          _selectedImage!);
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
