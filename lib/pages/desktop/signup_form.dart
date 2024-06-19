import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:k_front/models/user.dart';
import 'package:k_front/routes/index.dart';
import 'package:k_front/controller/api_user_controller.dart';

import '../../controller/impl/api_user_controller_impl.dart';
import '../../utils/phone_validator.dart';
import '../../themes/theme_data.dart';
import '../../widgets/common/app_bar.dart';
import '../../widgets/desktop/background_index.dart';
import '../../widgets/phone_selector.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final String title = "kCal Control";
  bool _obscureText = true;
  BuildContext? _navigationContext;
  var newUser = User(
    username: '',
    firstName: '',
    lastName: '',
    email: '',
    password: '',
    mobile: '',
    role: 'USER',
  );

  ApiUserController apiUser = ApiUserControllerImpl();

  TextFormField buildTextField(
      {required String hintText,
      required IconData icon,
      bool obscureText = false,
      required String field,
      required String? Function(String?)? validator}) {
    return TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        onSaved: (value) {
          switch (field) {
            case 'username':
              newUser.username = value!;
              break;
            case 'email':
              newUser.email = value!;
              break;
            case 'password':
              newUser.password = value!;
              break;
            case 'firstName':
              newUser.firstName = value!;
              break;
            case 'lastName':
              newUser.lastName = value!;
              break;
            case 'mobile':
              newUser.mobile = value!;
              break;
            default:
              break;
          }
        },
        obscureText: _obscureText,
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
        ));
  }

  Future<bool> _signup() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        return await apiUser.signup(newUser);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Something failed during registration: $e'),
          ),
        );
        return false;
      }
    }
    return false;
  }

  final TextEditingController _phoneController = TextEditingController();
  final PhoneNumber _number = PhoneNumber(isoCode: 'ES');

  @override
  Widget build(BuildContext context) {
    _navigationContext = context;
    return Scaffold(
      appBar: DAppBar(
        title: title,
        actions: const [],
        returnable: true,
      ),
      body: Stack(children: <Widget>[
        const BackgroundScreen(),
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            width: 800,
            child: SingleChildScrollView(
              child: Flex(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                direction: Axis.vertical,
                children: <Widget>[
                  const SizedBox(height: 25),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    decoration: kContainerDecoration.copyWith(
                      color: Theme.of(context).cardColor,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                formBody(), //form fields
                                ElevatedButton(
                                  onPressed: () async {
                                    await _signup()
                                        ? Navigator.popAndPushNamed(
                                            _navigationContext!,
                                            '/',
                                          )
                                        : null;
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 15),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  child: const Text('Sign up'),
                                ),
                                const SizedBox(height: 25),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 500,
                          child: VerticalDivider(
                            color: Theme.of(context).shadowColor,
                            thickness: 1,
                            width: 50,
                            indent: 0.0,
                            endIndent: 0.0,
                          ),
                        ),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: 250,
                                  child: oAuth2Buttons(
                                      text: 'Sign up with Google',
                                      icon: Icons.g_mobiledata)),
                              const SizedBox(height: 15),
                              SizedBox(
                                  width: 250,
                                  child: oAuth2Buttons(
                                      text: 'Sign up with Microsoft',
                                      icon: Icons.window)),
                              const SizedBox(height: 15),
                              SizedBox(
                                  width: 250,
                                  child: oAuth2Buttons(
                                      text: 'Sign up with Apple',
                                      icon: Icons.apple)),
                            ])
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
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
                ],
              ),
            ),
          ),
        ),
      ]),
      floatingActionButton: themeSelectorButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  ElevatedButton oAuth2Buttons({required String text, required IconData icon}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onPressed: () => {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(icon),
          const SizedBox(width: 10),
          Text(text),
        ],
      ),
    );
  }

  Column formBody() {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        const Text(
          'Welcome!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        const Text(
          'Provide the required data to get your access',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        buildTextField(
          hintText: 'Username',
          icon: Icons.alternate_email,
          field: 'username',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your username';
            }
            if(value.length < 6) {
              return 'Username must be at least 6 characters';
            }
            return null;
          },
        ),
        const SizedBox(height: 15),
        buildTextField(
          hintText: 'Email',
          icon: Icons.email,
          field: 'email',
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
        ),
        const SizedBox(height: 15),
        buildTextField(
            hintText: 'First name',
            icon: Icons.person,
            field: 'firstName',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your first name';
              }
              return null;
            }),
        const SizedBox(height: 15),
        buildTextField(
            hintText: 'Last name',
            icon: Icons.person,
            field: 'lastName',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your last name';
              }
              return null;
            }),
        const SizedBox(height: 15),
        buildTextField(
          hintText: 'Password',
          icon: Icons.lock,
          obscureText: true,
          field: 'password',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            String pattern = r'^(?=.*[A-Z])(?=.*[0-9])[A-Za-z0-9.@_]{8,}$';
            RegExp regex = RegExp(pattern);
            if (!regex.hasMatch(value)) {
              return 'Password requires 8 characters, one uppercase letter and one number';
            }
            return null;
          },
        ),
        const SizedBox(height: 15),
        internationalPhoneNumberInput(
            _number, context, _phoneController, newUser),
        const SizedBox(height: 15),
      ],
    );
  }
}
