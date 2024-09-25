// lib/pages/login_page.dart
import 'package:flutter/material.dart';
import 'package:k_front/controller/api_auth_controller.dart';
import 'package:k_front/controller/impl/api_auth_controller_impl.dart';
import 'package:k_front/routes/forms/login_form.dart';
import 'package:k_front/themes/theme_data.dart';
import 'package:k_front/widgets/common/app_bar.dart';
import 'package:k_front/widgets/common/background_index.dart';
import 'package:k_front/widgets/common/legal_documents_button.dart';
import 'package:k_front/utils/device_checker.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final String title = "kCal Control";
  final ApiAuthController apiAuth = ApiAuthControllerImpl();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (isDesktop(context)) {
          return buildDesktopLayout();
        }
        else if (isTablet(context)) {
          return buildTabletLayout();
        }
        else {
          return buildMobileLayout();
        }
      }
    );
  }

  Widget buildDesktopLayout() {
    return Scaffold(
      appBar: DAppBar(
        title: title,
        returnable: true
      ),
      body: Stack(
        children: [
          const BackgroundScreen(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 400,
                  height: 450,
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  decoration: kContainerDecoration.copyWith(
                    color: Theme.of(context).cardColor
                  ),
                  child: const LoginForm()
                ),
                const SizedBox(height: 15),
                LegalDocumentsButton()
              ]
            )
          )
        ]
      )
    );

  }

  Widget buildTabletLayout() {
    return Scaffold(
      appBar: DAppBar(
        title: title,
        returnable: true
      ),
      body: Stack(
        children: [
          const BackgroundScreen(),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 400,
                    height: 450,
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    decoration: kContainerDecoration.copyWith(
                      color: Theme.of(context).cardColor
                    ),
                    child: const LoginForm()
                  ),
                  const SizedBox(height: 15),
                  LegalDocumentsButton()
                ]
              )
            )
          )
        ]
      )
    );
  }

  Widget buildMobileLayout() {
    return Scaffold(
      appBar: DAppBar(
        title: title,
        returnable: true
      ),
      body: Stack(
        children: [
          const BackgroundScreen(),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 350,
                    height: 650,
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    decoration: kContainerDecoration.copyWith(
                      color: Theme.of(context).cardColor
                    ),
                    child: const LoginForm()
                  ),
                  const SizedBox(height: 15),
                  LegalDocumentsButton()
                ]
              )
            )
          )
        ]
      )
    );
  }
}