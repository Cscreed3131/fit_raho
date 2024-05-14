// core
import 'package:fit_raho/src/auth/screens/signup_screen.dart';
import 'package:flutter/material.dart';

// firebase
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/sign_in_provider/sign_in_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login';
  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _form = GlobalKey<FormState>();

  final _enteredEmailController = TextEditingController();
  final _enteredpasswordContoller = TextEditingController();
  final _passwordFocusNode = FocusNode();

  final InputBorder? border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
  );

  @override
  void dispose() {
    _enteredEmailController.dispose();
    _enteredpasswordContoller.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // void navTOHomeScreen() {
    //   // Navigator.of(context).popAndPushNamed(
    //   //   HomeScreen.routeName,
    //   // );
    // }
    final authState = ref.watch(signInProvider.notifier);

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final shortestSide = MediaQuery.of(context).size.shortestSide < 600;
    final font20 = screenHeight * 0.07;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenHeight * 0.1,
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
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
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: screenHeight * 0.025,
                      top: screenHeight * 0.025,
                    ),
                    child: Text(
                      'Sign-In',
                      style: TextStyle(
                        height: screenHeight * 0.001,
                        fontSize: font20 * 0.7,
                        fontWeight: FontWeight.bold,
                        // fontFamily: 'IBMPlexMono',
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.75),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: shortestSide
                      ? const EdgeInsets.all(25)
                      : EdgeInsets.symmetric(horizontal: screenWidth / 5),
                  child: Card(
                    child: Form(
                      key: _form,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              controller: _enteredEmailController,
                              decoration: InputDecoration(
                                labelText: 'Email Address',
                                border: border,
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,
                              textCapitalization: TextCapitalization.none,
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (value) {
                                FocusScope.of(context)
                                    .requestFocus(_passwordFocusNode);
                              },
                              validator: (value) {
                                if (value == null ||
                                    value.trim().isEmpty ||
                                    !value.contains('@')) {
                                  // this validation should pass the silicon id test
                                  return 'Please enter a valid email address.';
                                }
                                return null;
                              },
                              // onSaved: (value) {
                              //   _enteredEmailController = value!;
                              // },
                            ),
                            const SizedBox(height: 7),
                            TextFormField(
                              controller: _enteredpasswordContoller,
                              decoration: InputDecoration(
                                  labelText: 'Password', border: border),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              focusNode: _passwordFocusNode,
                              validator: (value) {
                                if (value == null) {
                                  return 'Enter password';
                                }
                                return null;
                              },
                              // onSaved: (value) {
                              //   _enteredpasswordContoller = value!;
                              // },
                            ),
                            const SizedBox(height: 10),
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
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                      ),
                                    ),
                                    onPressed: () async {
                                      final email =
                                          _enteredEmailController.text;
                                      final password =
                                          _enteredpasswordContoller.text;
                                      await authState.signIn(email, password);
                                      // if (result) {
                                      //   navTOHomeScreen();
                                      // }
                                    },
                                    child: Text(
                                      'Sign in',
                                      style: TextStyle(
                                          fontSize: font20 * 0.3,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (authState is SignInProcess)
                              const CircularProgressIndicator.adaptive(),
                            if (authState is SignInFailure)
                              const Text('failed'),
                            if (authState is SignInSuccess)
                              const Text('success'),
                            const SizedBox(height: 30),

                            //Dont have account text

                            const Text(
                              'Don\'t have an account?',
                              style: TextStyle(
                                height: 0.5,
                                fontSize: 20,
                              ),
                            ),

                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                  SignupScreen.routeName,
                                );
                              },
                              child: const Text(
                                'Create account',
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
      ),
    );
  }
}
