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
      required String field}) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter required information.';
        }
        return null;
      },
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
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: hintText,
        prefixIcon: Icon(icon),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
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
  PhoneNumber _number = PhoneNumber(isoCode: 'ES');

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
            width: 500,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                    style:
                                        Theme.of(context).textTheme.labelSmall,
                                    'Terms and Conditions'),
                              ),
                              const Text('|'),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                    style:
                                        Theme.of(context).textTheme.labelSmall,
                                    'Privacy Policy'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.12),
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
        ),
        const SizedBox(height: 25),
        buildTextField(
          hintText: 'Email or username',
          icon: Icons.email,
          field: 'email',
        ),
        const SizedBox(height: 25),
        buildTextField(
            hintText: 'First name', icon: Icons.person, field: 'firstName'),
        const SizedBox(height: 25),
        buildTextField(
            hintText: 'Last name', icon: Icons.person, field: 'lastName'),
        const SizedBox(height: 25),
        buildTextField(
          hintText: 'Password',
          icon: Icons.lock,
          obscureText: true,
          field: 'password',
        ),
        const SizedBox(height: 25),
        internationalPhoneNumberInput(
            _number, context, _phoneController, newUser),
        const SizedBox(height: 25),
      ],
    );
  }
}
