import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:k_front/models/user.dart';
import 'package:k_front/controller/api_user_controller.dart';
import 'package:k_front/widgets/common/legal_documents_button.dart';

import '../../controller/impl/api_user_controller_impl.dart';
import '../../themes/theme_data.dart';
import '../../widgets/common/app_bar.dart';
import '../../widgets/common/o_auth_buttons.dart';
import '../../widgets/desktop/background_index.dart';
import '../../widgets/common/phone_selector.dart';

//TODO unify the signup form for all devices

class TabletSignUpPage extends StatefulWidget {
  const TabletSignUpPage({super.key});

  @override
  TabletSignUpPageState createState() => TabletSignUpPageState();
}

class TabletSignUpPageState extends State<TabletSignUpPage> {
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
        obscureText: obscureText && _obscureText,
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
            width: 1050,
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Fill in the form to sign up',
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                                const SizedBox(height: 30),
                                formBody(), //form fields
                                const SizedBox(height: 15),
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
                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 200,
                              child: VerticalDivider(
                                color: Theme.of(context).disabledColor,
                                thickness: 1,
                                width: 50,
                                indent: 20.0,
                                endIndent: 20.0,
                              ),
                            ),
                            const Text('OR'),
                            SizedBox(
                              height: 200,
                              child: VerticalDivider(
                                color: Theme.of(context).disabledColor,
                                thickness: 1,
                                width: 50,
                                indent: 20.0,
                                endIndent: 20.0,
                              ),
                            ),
                          ],
                        ),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: 200,
                                  child: oAuth2Buttons(
                                      text: 'Sign up with Google',
                                      icon: Icons.g_mobiledata)),
                              const SizedBox(height: 15),
                              SizedBox(
                                  width: 200,
                                  child: oAuth2Buttons(
                                      text: 'Sign up with Microsoft',
                                      icon: Icons.window)),
                              const SizedBox(height: 15),
                              SizedBox(
                                  width: 200,
                                  child: oAuth2Buttons(
                                      text: 'Sign up with Apple',
                                      icon: Icons.apple)),
                            ])
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        legalDocumentsButton(context)
      ]),
      floatingActionButton: themeSelectorButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Row formBody() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      verticalDirection: VerticalDirection.down,
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(children: [
            //TODO try to implement a setState for the _obscureText
            buildTextField(
              hintText: 'Username',
              icon: Icons.alternate_email,
              field: 'username',
              obscureText: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                }
                if (value.length < 6) {
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
              obscureText: false,
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
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                }),
            const SizedBox(height: 15)
          ]),
        )),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                buildTextField(
                    hintText: 'Last name',
                    icon: Icons.person,
                    field: 'lastName',
                    obscureText: false,
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
                  field: 'password',
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    String invalidSymbol = r'[^\w.@]';
                    String pattern =
                        r'^(?=.*[A-Z])(?=.*[0-9])[A-Za-z0-9.@_]{8,}$';
                    RegExp regex = RegExp(pattern);
                    RegExp regex2 = RegExp(invalidSymbol);
                    if (regex2.hasMatch(value)) {
                      return 'Password contains invalid symbols';
                    } else if (!regex.hasMatch(value)) {
                      return 'Minimum 8 characters, one uppercase letter and one number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                internationalPhoneNumberInput(
                    _number, context, _phoneController, newUser),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
