// lib/pages/login_page.dart
import 'package:flutter/material.dart';
import 'package:k_front/controller/api_auth_controller.dart';
import 'package:k_front/controller/impl/api_auth_controller_impl.dart';
import 'package:k_front/routes/forms/login_form.dart';
import 'package:k_front/themes/theme_data.dart';
import 'package:k_front/widgets/common/o_auth_buttons.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final String title = "kCal Control";
  final ApiAuthController apiAuth = ApiAuthControllerImpl();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return LayoutBuilder(
      builder: (context, constraints) {
        if (screenWidth > 1050) {
          return buildDesktopLayout();
        } else if (screenWidth > 600) {
          return buildTabletLayout();
        } else {
          return buildMobileLayout();
        }
      },
    );
  }

  Widget buildDesktopLayout() {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Center(child: LoginForm()),
          buildFooter(),
        ],
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
                      child: const LoginForm(),
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
                      oAuth2Buttons(text: 'Sign in with Google', icon: Icons.g_translate),
                      const SizedBox(height: 15),
                      oAuth2Buttons(text: 'Sign in with Facebook', icon: Icons.facebook),
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
                        child: const LoginForm(),
                      ),
                      const SizedBox(height: 15),
                      // Row(
                      //   children: [
                      //     oAuth2Buttons(text: 'Sign in with Google', icon: Icons.g_translate),
                      //     const SizedBox(width: 10),
                      //     oAuth2Buttons(text: 'Sign in with Facebook', icon: Icons.facebook),
                      //   ],
                      // ),
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

  Row buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextButton(
          onPressed: () {},
          child: Text('Terms and Conditions', style: Theme.of(context).textTheme.labelMedium),
        ),
        const Text('|'),
        TextButton(
          onPressed: () {},
          child: Text('Privacy Policy',  style: Theme.of(context).textTheme.labelMedium),
        ),
      ],
    );
  }
}