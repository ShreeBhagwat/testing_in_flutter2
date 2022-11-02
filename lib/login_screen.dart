import 'package:flutter/material.dart';
import 'package:testing_in_flutter2/constants.dart';
import 'package:testing_in_flutter2/home_screen.dart';
import 'package:testing_in_flutter2/register_screen.dart';
import 'package:testing_in_flutter2/widgets/custom_textform_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Login Screen',
                  style: TextStyle(fontSize: 30, fontFamily: 'Roboto'),
                ),
                CustomTextFormField(
                  key: emailTextKey,
                  controller: _emailController,
                  labelText: 'Email Address',
                  icon: Icons.email,
                  validator: ((value) {
                    const pattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

                    final regex = RegExp(pattern);

                    return (value != null && !regex.hasMatch(value))
                        ? kEmailErrorText
                        : null;
                  }),
                ),
                CustomTextFormField(
                  key: passwordTextKey,
                  controller: _passwordController,
                  labelText: 'Password',
                  icon: Icons.lock,
                  isObsecure: true,
                  validator: ((value) {
                    if (value != null && value.length <= 6) {
                      return kPasswordErrorText;
                    }
                    return null;
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                      key: loginButtonKey,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        }
                      },
                      child: const SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: Center(child: Text('Login')))),
                ),
                InkWell(
                  key: notAUserTextKey,
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => RegisterScreen()));
                  },
                  child: const Text(
                    'Not a user? Register',
                    style: TextStyle(fontSize: 14),
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
