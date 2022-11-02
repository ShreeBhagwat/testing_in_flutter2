import 'package:flutter/material.dart';
import 'package:testing_in_flutter2/constants.dart';
import 'package:testing_in_flutter2/home_screen.dart';
import 'package:testing_in_flutter2/widgets/custom_textform_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Return a scaffold which will have custom text form field widgets having name email and password
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
                  'Register Screen',
                  style: TextStyle(fontSize: 30),
                ),
                CustomTextFormField(
                  key: nameTextKey,
                  controller: _nameController,
                  labelText: 'Name',
                  icon: Icons.person,
                  validator: ((value) {
                    if (value != null && value.length <= 3) {
                      return 'Name must be at least 3 characters';
                    }
                    return null;
                  }),
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
                        ? 'Please Enter a Valid Email'
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
                      return 'Password must be at least 6 characters';
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
                      child: const Text('Register')),
                ),

                // already a user login in stead
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already a user?'),
                    TextButton(
                        key: alreadyAUserTextKey,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Login'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
