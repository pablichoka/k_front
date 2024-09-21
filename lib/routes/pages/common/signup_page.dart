import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:k_front/controller/api_user_controller.dart';
import 'package:k_front/model/user.dart';
import 'package:k_front/widgets/common/custom_text_field.dart';

import '../../../controller/impl/api_user_controller_impl.dart';
import '../../../themes/theme_data.dart';
import '../../../widgets/common/app_bar.dart';
import '../../../widgets/common/o_auth_buttons.dart';
import '../../../widgets/common/phone_selector.dart';
import '../../../widgets/common/background_index.dart';

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
      body: Stack(
        children: <Widget>[
          const BackgroundScreen(),
          Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 1050) {
                  return buildDesktopLayout();
                } else if (constraints.maxWidth > 600) {
                  return buildTabletLayout();
                } else {
                  return buildMobileLayout();
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: themeSelectorButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget buildDesktopLayout() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      width: 1050,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      child: formBody(),
                    ),
                  ),
                  const SizedBox(
                    height: 600,
                    child: VerticalDivider(
                      endIndent: 0.0,
                    ),
                  ),
                  Column(
                    children: [
                      oAuth2Buttons(
                          text: 'Sign up with Google', icon: Icons.g_translate),
                      const SizedBox(height: 15),
                      oAuth2Buttons(
                          text: 'Sign up with Facebook', icon: Icons.facebook),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget buildTabletLayout() {
    return Container(
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
                      child: formBody(),
                    ),
                  ),
                  const SizedBox(
                    height: 500,
                    child: VerticalDivider(
                      endIndent: 0.0,
                    ),
                  ),
                  Column(
                    children: [
                      oAuth2Buttons(
                          text: 'Sign up with Google', icon: Icons.g_translate),
                      const SizedBox(height: 15),
                      oAuth2Buttons(
                          text: 'Sign up with Facebook', icon: Icons.facebook),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget buildMobileLayout() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        width: 400,
        child: SingleChildScrollView(
          child: Flex(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            direction: Axis.vertical,
            children: <Widget>[
              const SizedBox(height: 25),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                decoration: kContainerDecoration.copyWith(
                  color: Theme.of(context).cardColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    children: [
                      Form(
                        key: _formKey,
                        child: formBody(),
                      ),
                      const SizedBox(height: 15),
                      Center(
                        child: Column(
                          children: [
                            oAuth2Buttons(
                                text: 'Sign up with Google',
                                icon: Icons.g_translate),
                            const SizedBox(height: 10),
                            oAuth2Buttons(
                                text: 'Sign up with Facebook',
                                icon: Icons.facebook),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              buildFooter(),
            ],
          ),
        ),
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
        CustomTextField(
          hintText: 'Username',
          icon: Icons.alternate_email,
          onSave: (value) {
            newUser.username = value!;
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
          obscureText: false,
        ),
        const SizedBox(height: 15),
        CustomTextField(
          hintText: 'Email',
          icon: Icons.email,
          onSave: (value) => newUser.email = value!,
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
          obscureText: false,
        ),
        const SizedBox(height: 15),
        CustomTextField(
          hintText: 'First name',
          icon: Icons.person,
          onSave: (value) => newUser.firstName = value!,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your first name';
            }
            return null;
          },
          obscureText: false,
        ),
        const SizedBox(height: 15),
        CustomTextField(
          hintText: 'Last name',
          icon: Icons.person,
          onSave: (value) => newUser.lastName = value!,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your last name';
            }
            return null;
          },
          obscureText: false,
        ),
        const SizedBox(height: 15),
        CustomTextField(
          hintText: 'Password',
          icon: Icons.lock,
          obscureText: _obscureText,
          onSave: (value) => newUser.password = value!,
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
            } else if (!regex.hasMatch(value)) {
              return 'Minimum 8 characters, one uppercase letter and one number';
            }
            return null;
          },
        ),
        const SizedBox(height: 15),
        internationalPhoneNumberInput(
            _number, context, _phoneController, newUser),
        const SizedBox(height: 25),
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
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: const Text('Sign up'),
        ),
        const SizedBox(height: 25),
      ],
    );
  }

  Row buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextButton(
          onPressed: () {},
          child: Text('Terms and Conditions',
              style: Theme.of(context).textTheme.labelMedium),
        ),
        const Text('|'),
        TextButton(
          onPressed: () {},
          child: Text('Privacy Policy',
              style: Theme.of(context).textTheme.labelMedium),
        ),
      ],
    );
  }
}
