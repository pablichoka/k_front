import 'package:flutter/material.dart';
import 'package:k_front/routes/pages/common/login_page.dart';
import 'package:k_front/routes/pages/common/signup_page.dart';
import 'package:k_front/widgets/common/app_bar.dart';

import '../../../widgets/common/background_index.dart';
import '../../../widgets/mobile/carrousel_index.dart';

Scaffold mobileIndex(BuildContext context) {
  return Scaffold(
    appBar: const DAppBar(
      title: title,
      returnable: false,
    ),
    body: Stack(children: <Widget>[
      const BackgroundScreen(),
      Column(children: <Widget>[
        Center(
          child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width,
                      child: IndexMobileCarrousel(context))
                ],
              )),
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                      borderOnForeground: true,
                      color: Theme.of(context).colorScheme.tertiary,
                      child: TextButton(
                          style: ButtonStyle(
                              padding: WidgetStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.symmetric(horizontal: 40))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation1, animation2) =>
                                          const SignUpPage(),
                                  transitionDuration:
                                      const Duration(milliseconds: 300),
                                  transitionsBuilder:
                                      (context, animation, animation2, child) {
                                    final offsetAnimation = Tween<Offset>(
                                            begin: const Offset(1.0, 0.0),
                                            end: Offset.zero)
                                        .animate(animation);
                                    return SlideTransition(
                                      position: offsetAnimation,
                                      child: child,
                                    );
                                  },
                                ));
                          },
                          child: Text('Sign up',
                              style:
                                  Theme.of(context).textTheme.headlineSmall))),
                  Card(
                      color: Theme.of(context).colorScheme.primary,
                      child: TextButton(
                          style: ButtonStyle(
                              padding: WidgetStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.symmetric(horizontal: 40))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()));
                          },
                          child: Text('Log in',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(color: Colors.white))))
                ]))
      ]),
    ]),
  );
}

const title = 'kCal Control';