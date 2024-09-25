import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:k_front/model/user.dart';
import 'package:k_front/widgets/common/custom_text_field.dart';
import 'package:k_front/widgets/common/phone_selector.dart';

class SignUpForm extends StatefulWidget {
  final User newUser;
  final GlobalKey<FormState> formKey;
  final bool obscureText;
  final Future<bool> Function() signup;
  final BuildContext? navigationContext;
  final TextEditingController phoneController;
  final PhoneNumber number;

  const SignUpForm({
    Key? key,
    required this.newUser,
    required this.formKey,
    required this.obscureText,
    required this.signup,
    required this.navigationContext,
    required this.phoneController,
    required this.number
  }) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        const Text(
          'Welcome!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
          )
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        const Text(
          'Provide the required data to get your access',
          style: TextStyle(fontSize: 16)
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      child: CustomTextField(
                        hintText: 'Username',
                        icon: Icons.alternate_email,
                        onSave: (value) {
                          widget.newUser.username = value!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          if (value.length < 6) {
                            return 'Username must be at least 6 characters';
                          }
                          return null;
                        },
                        obscureText: false
                      )
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 60,
                      child: CustomTextField(
                        hintText: 'Email',
                        icon: Icons.email,
                        onSave: (value) => widget.newUser.email = value!,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          String pattern =
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regex = RegExp(pattern);
                          if (!regex.hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        obscureText: false
                      )
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 60,
                      child: CustomTextField(
                        hintText: 'First name',
                        icon: Icons.person,
                        onSave: (value) => widget.newUser.firstName = value!,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                        obscureText: false
                      )
                    ),
                    const SizedBox(height: 15)
                  ]
                )
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      child: CustomTextField(
                        hintText: 'Last name',
                        icon: Icons.person,
                        onSave: (value) => widget.newUser.lastName = value!,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your last name';
                          }
                          return null;
                        },
                        obscureText: false
                      )
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 60,
                      child: CustomTextField(
                        hintText: 'Password',
                        icon: Icons.lock,
                        obscureText: true,
                        obscureTextToggle: _obscureText,
                        onSave: (value) => widget.newUser.password = value!,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          String invalidSymbol = r'[^\w.@]';
                          String pattern = r'^(?=.*[A-Z])(?=.*[0-9])[A-Za-z0-9.@_]{8,}$';
                          RegExp regex = RegExp(pattern);
                          RegExp regex2 = RegExp(invalidSymbol);
                          if (regex2.hasMatch(value)) {
                            return 'Password contains invalid symbols';
                          }
                          else if (!regex.hasMatch(value)) {
                            return 'Minimum 8 characters, one uppercase letter and one number';
                          }
                          return null;
                        },
                        toggleObscureText: () {
                          setState(() {
                              _obscureText = !_obscureText;
                            }
                          );
                        }
                      )
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 60,
                      child: internationalPhoneNumberInput(
                        widget.number, context, widget.phoneController, widget.newUser)
                    ),
                    const SizedBox(height: 25)
                  ]
                )
              )
            ]
          )
        ),
        ElevatedButton(
          onPressed: () async {
            await widget.signup()
              ? Navigator.popAndPushNamed(
                widget.navigationContext!,
                '/'
              )
              : null;
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
            )
          ),
          child: const Text('Sign up')
        ),
        const SizedBox(height: 25)
      ]
    );
  }
}
