import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:k_front/controller/api_auth_controller.dart';
import 'package:k_front/controller/impl/api_auth_controller_impl.dart';
import 'package:k_front/pages/tablet/signup_form.dart';
import 'package:k_front/widgets/common/app_bar.dart';

import '../../models/logged_user.dart';
import '../../themes/theme_data.dart';
import '../../routes/dashboard.dart';
import '../../widgets/desktop/background_index.dart';

class TabletLoginForm extends StatefulWidget {
  const TabletLoginForm({super.key});

  @override
  TabletLoginFormState createState() => TabletLoginFormState();
}

class TabletLoginFormState extends State<TabletLoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final String title = "kCal Control";
  final FocusScopeNode _focusNode = FocusScopeNode();
  bool _obscureText = true;
  BuildContext? _navigationContext;
  final _newLoggedUser = LoggedUser(
    username: '',
    password: '',
  );
  late bool _rememberMe = false;
  final ApiAuthController _apiAuth = ApiAuthControllerImpl();

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
      onSaved: onSave,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        suffixIcon: obscureText
            ? IconButton(
                icon: Icon(
                  obscureText && _obscureText
                      ? Icons.visibility
                      : Icons.visibility_off,
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
        return await _apiAuth.login(
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

  void _handleKeyEvent() {
    if (_focusNode.hasFocus) {
      HardwareKeyboard.instance.addHandler(_handleRawKeyEvent);
    } else {
      HardwareKeyboard.instance.removeHandler(_handleRawKeyEvent);
    }
  }

  bool _handleRawKeyEvent(KeyEvent event) {
    if (event is KeyboardKey && event.logicalKey == LogicalKeyboardKey.enter) {
      _login();
      return true;
    }
    return false;
  }

  bool handleCheckbox(bool value) {
    return !value;
  }

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
    _focusNode.addListener(_handleKeyEvent);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleKeyEvent);
    HardwareKeyboard.instance.removeHandler(_handleRawKeyEvent);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _navigationContext = context;
    return Scaffold(
        appBar: DAppBar(
          title: title,
          returnable: true,
          actions: const [],
        ),
        body: Stack(
          children: [
            const BackgroundScreen(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  onPressed: () {},
                  child: Text(
                      style: Theme.of(context).textTheme.labelSmall,
                      'Terms and Conditions'),
                ),
                const Text('|'),
                TextButton(
                  onPressed: () {},
                  child: Text(
                      style: Theme.of(context).textTheme.labelSmall,
                      'Privacy Policy'),
                ),
              ],
            ),
            FocusScope(
              node: _focusNode,
              child: Center(
                child: Form(
                    key: _formKey,
                    child: Container(
                      width: 900,
                      height: 450,
                      decoration: kContainerDecoration.copyWith(
                        color: Theme.of(context).canvasColor,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 30),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              'Welcome Back!',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
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
                                      TextButton(
                                        onPressed: () {},
                                        child: const Text('Forgot password?'),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(24.0),
                                  child: SizedBox(
                                    height: 200,
                                    child: VerticalDivider(
                                      color: Theme.of(context).disabledColor,
                                      thickness: 1,
                                      width: 1,
                                      endIndent: 20,
                                      indent: 20,
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Column(
                                  children: [
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
                                    TextButton(
                                      onPressed: () {},
                                      child: const Text('Forgot password?'),
                                    ),
                                  ],
                                )),
                              ],
                            ),
                          ]),
                    )),
              ),
            ),
          ],
        ));
  }
}
