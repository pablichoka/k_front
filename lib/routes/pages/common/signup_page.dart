import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:k_front/controller/api_user_controller.dart';
import 'package:k_front/model/user.dart';
import 'package:k_front/routes/forms/signup_form.dart';
import 'package:k_front/utils/device_checker.dart';
import 'package:k_front/widgets/common/legal_documents_button.dart';
import 'package:k_front/controller/impl/api_user_controller_impl.dart';
import 'package:k_front/themes/theme_data.dart';
import 'package:k_front/widgets/common/app_bar.dart';
import 'package:k_front/widgets/common/background_index.dart';
import 'package:k_front/widgets/common/o_auth_buttons.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final String title = "kCal Control";
  final bool _obscureText = true;
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
     return LayoutBuilder(
      builder: (context, constraints) {
        if (isDesktop(context)) {
          return buildDesktopLayout();
        } else if (isTablet(context)) {
          return buildTabletLayout();
        } else {
          return buildMobileLayout();
        }
      },
    );
  }

  Widget buildDesktopLayout() {
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
            child: Container(
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
                              child: SignUpForm(
                                newUser: newUser,
                                formKey: _formKey,
                                obscureText: _obscureText,
                                signup: _signup,
                                navigationContext: _navigationContext,
                                phoneController: _phoneController,
                                number: _number,
                              ),
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
                                  text: 'Sign up with Google',
                                  icon: Icons.g_translate),
                              const SizedBox(height: 15),
                              oAuth2Buttons(
                                  text: 'Sign up with Facebook',
                                  icon: Icons.facebook),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    legalDocumentsButton(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTabletLayout() {
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
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              width: 800,
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
                              child: SignUpForm(
                                newUser: newUser,
                                formKey: _formKey,
                                obscureText: _obscureText,
                                signup: _signup,
                                navigationContext: _navigationContext,
                                phoneController: _phoneController,
                                number: _number,
                              ),
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
                                  text: 'Sign up with Google',
                                  icon: Icons.g_translate),
                              const SizedBox(height: 15),
                              oAuth2Buttons(
                                  text: 'Sign up with Facebook',
                                  icon: Icons.facebook),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    legalDocumentsButton(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMobileLayout() {
    return Scaffold(
      appBar: DAppBar(
        title: title,
        actions: const [],
        returnable: true,
      ),
      body: Stack(
        children: <Widget>[
          const BackgroundScreen(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: 400,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                              child: SignUpForm(
                                newUser: newUser,
                                formKey: _formKey,
                                obscureText: _obscureText,
                                signup: _signup,
                                navigationContext: _navigationContext,
                                phoneController: _phoneController,
                                number: _number,
                              ),
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
                    legalDocumentsButton(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}