import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqyeemi/features/auth/screens/login_screen.dart';

import '../../../theme/pallete.dart';
import '../controller/auth_controller.dart';
import '../../../core/common/loader.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  static const String routeName = "/sign_up_screen";

  const SignUpScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool _passwordVisible = false;

  void signUpWithEmail(BuildContext context) {
    if (formKey.currentState!.validate()) {
      ref.read(authControllerProvider.notifier).signUpWithEmail(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
          name: _fullNameController.text.trim(),
          phoneNumber: _mobileNumberController.text.trim(),
          context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 70,
            ),
            const Text(
              "Create new account",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Pallete.whiteColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "please fill in the form to continue",
              style: TextStyle(
                fontSize: 14,
                color: Pallete.greyColor,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.90,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      height: MediaQuery.of(context).size.height * 0.08,
                      decoration: BoxDecoration(
                        color: Pallete.grayColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextFormField(
                          controller: _fullNameController,
                          decoration: const InputDecoration(
                            hintText: "Full Name",
                            border: InputBorder.none,
                          ),
                          validator: ((value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your full name";
                            }
                            return null;
                          })),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.90,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      height: MediaQuery.of(context).size.height * 0.08,
                      decoration: BoxDecoration(
                        color: Pallete.grayColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: "Email",
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your email";
                          }
                          final RegExp emailRegExp =
                              RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                          if (!emailRegExp.hasMatch(value)) {
                            return "Please enter a valid email";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.90,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      height: MediaQuery.of(context).size.height * 0.08,
                      decoration: BoxDecoration(
                        color: Pallete.grayColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextFormField(
                          controller: _mobileNumberController,
                          decoration: const InputDecoration(
                            hintText: "Phone Number",
                            border: InputBorder.none,
                          ),
                          validator: ((value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your phone number";
                            }
                            return null;
                          })),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.90,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      height: MediaQuery.of(context).size.height * 0.08,
                      decoration: BoxDecoration(
                        color: Pallete.grayColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextFormField(
                        obscureText: !_passwordVisible,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Pallete.greyColor,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                          hintText: "Password",
                          border: InputBorder.none,
                        ),
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your password";
                          }
                          return null;
                        }),
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.90,
                      height: MediaQuery.of(context).size.height * 0.08,
                      decoration: BoxDecoration(
                        color: Pallete.purpleColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextButton(
                        onPressed: () => signUpWithEmail(context),
                        child: isLoading ? const Loader() :const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Pallete.whiteColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Have an Account?",
                          style: TextStyle(
                            color: Pallete.whiteColor,
                            fontSize: 14,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, SignInScreen.routeName);
                          },
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                              color: Pallete.purpleColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      )),
    );
  }
}
