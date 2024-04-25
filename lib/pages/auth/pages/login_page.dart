import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:todo_c10_sat_route/components/app_colors.dart';
import 'package:todo_c10_sat_route/config/firebase_functions.dart';
import 'package:todo_c10_sat_route/pages/tasks_view.dart';
import 'package:todo_c10_sat_route/provider.dart/my_provider.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = 'LoginPage';
  LoginPage({super.key, this.onTap});
  final Function()? onTap;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var auth = Provider.of<MyProvider>(context);
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 250,
                color: Colors.white,
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Email"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Password"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Not a member?'),
                  TextButton(
                    onPressed: onTap,
                    child: const Text('Register now!'),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      FirebaseFunctions.login(
                          emailController.text, passwordController.text, () {
                        auth.initUser();
                        Navigator.pushNamedAndRemoveUntil(
                            context, TasksView.routeName, (route) => false);
                      }, (error) {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Error'),
                              content: Text(error),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Cancel'),
                                ),
                              ],
                            );
                          },
                        );
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please fill input')),
                      );
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
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
