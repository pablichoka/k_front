import 'package:flutter/material.dart';
import 'package:k_front/controller/impl/api_auth_controller_impl.dart';
import 'package:k_front/controller/api_auth_controller.dart';
import 'package:k_front/pages/desktop/signup_form.dart';

import '../../models/logged_user.dart';
import '../../routes/dashboard.dart';
import '../../themes/theme_data.dart';
import '../../widgets/common/app_bar.dart';
import '../../widgets/desktop/background_index.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final String title = "kCal Control";
  bool _obscureText = true;
  BuildContext? _navigationContext;
  final _newLoggedUser = LoggedUser(
    username: '',
    password: '',
  );
  late bool _rememberMe = false;

  ApiAuthController apiUser = ApiAuthControllerImpl();

//TODO: replace the terms and conditions buttons outside the login box
  TextFormField buildTextField(
      {required String hintText,
      required IconData icon,
      bool obscureText = false,
      required Function(String?) onSave}) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter required information.';
        }
        return null;
      },
      obscureText: obscureText && _obscureText,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onSaved: onSave,
      decoration: InputDecoration(
        labelText: hintText,
        prefixIcon: Icon(icon),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorStyle: const TextStyle(
          fontSize: 10,
          height: 1,
        ),
        suffixIcon: obscureText
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
    );
  }

  Future<bool> _login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        return await apiUser.login(
            _newLoggedUser.username, _newLoggedUser.password);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Something failed during login: $e'),
          ),
        );
        return false;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    _navigationContext = context;
    return Scaffold(
      appBar: DAppBar(title: title, actions: const [], returnable: true),
      body: Stack(
        children: [
          const BackgroundScreen(),
          Center(
            child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.8,
                child: Row(children: <Widget>[
                  Expanded(
                    child: Form(
                      key: _formKey,
                      child: Container(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 24.0),
                          decoration: kContainerDecoration.copyWith(
                              color: Theme.of(context).canvasColor),
                          child: SingleChildScrollView(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                children: <Widget>[
                                  const SizedBox(height: 20),
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
                                  buildTextField(
                                    hintText: 'Email or username',
                                    icon: Icons.person,
                                    onSave: (value) {
                                      _newLoggedUser.username = value!;
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  buildTextField(
                                    hintText: 'Password',
                                    icon: Icons.lock,
                                    obscureText: true,
                                    onSave: (value) {
                                      _newLoggedUser.password = value!;
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
                                      await _login()
                                          ? Navigator.push(
                                              _navigationContext!,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Dashboard()))
                                          : null;
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Theme.of(context).splashColor,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 5),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    child: const Text('Sign In'),
                                  ),
                                  const SizedBox(height: 10),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation1,
                                                  animation2) =>
                                              const DesktopSignUpPage(),
                                          transitionDuration:
                                              const Duration(
                                                  milliseconds: 300),
                                          transitionsBuilder: (context,
                                              animation,
                                              animation2,
                                              child) {
                                            final offsetAnimation =
                                                Tween<Offset>(
                                              begin: const Offset(1.0, 0.0),
                                              end: Offset.zero,
                                            ).animate(animation);
                                            return SlideTransition(
                                              position: offsetAnimation,
                                              child: child,
                                            );
                                          },
                                        ),
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        const Text('New User? Sign Up '),
                                        TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                              'Forgot password?'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: <Widget>[
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall,
                                            'Terms and Conditions'),
                                      ),
                                      const Text('|'),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall,
                                            'Privacy Policy'),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                ]),
                          )),
                    ),
                  )
                ])),
          ),
        ],
      ),
      floatingActionButton: themeSelectorButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
