// lib/routes/forms/login_form.dart
import 'package:flutter/material.dart';
import 'package:k_front/controller/api_auth_controller.dart';
import 'package:k_front/controller/impl/api_auth_controller_impl.dart';
import 'package:k_front/model/logged_user.dart';
import 'package:k_front/routes/dashboard.dart';
import 'package:k_front/widgets/common/custom_text_field.dart';
import 'package:k_front/widgets/common/o_auth_buttons.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _rememberMe = false;
  LoggedUser user = LoggedUser(username: '', password: '');
  final ApiAuthController apiAuth = ApiAuthControllerImpl();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Text(
              'Welcome Back!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Login to continue',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              hintText: 'Email or username',
              icon: Icons.person,
              onSave: (value) {
                user.username = value!;
              },
              obscureText: false,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              hintText: 'Password',
              icon: Icons.lock,
              obscureText: true,
              obscureTextToggle: _obscureText,
              onSave: (value) {
                user.password = value!;
              },
              toggleObscureText: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            const SizedBox(height: 10),
            Row(
              children: <Widget>[
                Checkbox(
                  value: _rememberMe,
                  onChanged: (value) {
                    setState(() {
                      _rememberMe = value!;
                    });
                  },
                ),
                const Text('Remember me'),
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  bool success =
                      await apiAuth.login(user.username, user.password);
                  if (success) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Dashboard()),
                    );
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).splashColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text('Sign In'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child: const Text('Forgot password?'),
            ),
            const SizedBox(height: 70,),
            oAuth2Buttons(
                text: 'Sign in with Google', icon: Icons.g_translate),
            const SizedBox(height: 15),
            oAuth2Buttons(
                text: 'Sign in with Facebook', icon: Icons.facebook),
          ],
        ),
      ),
    );
  }
}