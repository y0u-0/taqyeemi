import 'package:flutter/material.dart';
import 'package:taqyeemi/screens/sign_up_screen.dart';

import '../Auth/auth.dart';
import '../theme/pallete.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = "/sign_in_screen";
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(
            height: 80,
          ),
          const Text(
            "Welcome Back!",
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
            "please sign in to your account",
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
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.90,
                    alignment: Alignment.topRight,
                    child: const Text("Forget Password?",
                        style: TextStyle(
                          color: Pallete.greyColor,
                          fontSize: 14,
                        )),
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
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Auth.loginIn(_emailController.text.trim(),
                              _passwordController.text.trim(), context);
                        }
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          color: Pallete.whiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.90,
                    height: MediaQuery.of(context).size.height * 0.08,
                    decoration: BoxDecoration(
                      color: Pallete.whiteColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: SizedBox(
                        height: 20,
                        width: 600,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              "https://companieslogo.com/img/orig/GOOG-0ed88f7c.png?t=1633218227",
                              height: 20,
                              width: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Sign In with Google",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
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
                        "Don't have an account?",
                        style: TextStyle(
                          color: Pallete.whiteColor,
                          fontSize: 14,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, SignUpScreen.routeName);
                        },
                        child: const Text(
                          "Sign Up",
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
        ]),
      ),
    ));
  }
}
