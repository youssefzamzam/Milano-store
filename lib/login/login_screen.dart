import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project1/home/home_screen.dart';
import 'package:project1/login/product_provider.dart';
import 'package:project1/login/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  String? userNameError;
  String? passwordError;

  // bool isValiduserName(String userName) {
  //   final userNameRegExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  //   return userNameRegExp.hasMatch(userName);
  // }

  void validateuserName(String value) {
    setState(() {
      if (value.isEmpty) {
        userNameError = "userName must be not empty";
      } else {
        userNameError = null;
      }
    });
  }

  void validatePassword(String value) {
    setState(() {
      if (value.isEmpty) {
        passwordError = "Password must not be empty";
      } else {
        passwordError = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              TextFormField(
                controller: userNameController,
                decoration: InputDecoration(
                  labelText: 'userName',
                  prefixIcon: const Icon(Icons.email),
                  border: const OutlineInputBorder(),
                  errorText: userNameError,
                ),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                onChanged: validateuserName,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: passwordController,
                obscureText: !isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                  border: const OutlineInputBorder(),
                  errorText: passwordError,
                ),
                onChanged: validatePassword,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                child: const Text('Login'),
                onPressed: () async {
                  validateuserName(userNameController.text);
                  validatePassword(passwordController.text);
                  if (userNameError == null && passwordError == null) {
                    FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: userNameController.text,
                        password: passwordController.text).then((value){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                    }).catchError((error){
                      var snack = SnackBar(content: Text("${error.tostring()}"));
                      ScaffoldMessenger.of(context).showSnackBar(snack);
                    });

                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  TextButton(
                    child: const Text('Register'),
                    onPressed: () {
                      // Navigate to register screen
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterScreen()));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
