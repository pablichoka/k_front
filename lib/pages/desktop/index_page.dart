import 'package:flutter/material.dart';
import 'package:k_front/pages/desktop/login_form.dart';
import 'package:k_front/pages/tablet/signup_form.dart';

import '../../themes/theme_data.dart';
import '../../utils/device_checker.dart';
import '../../widgets/common/app_bar.dart';
import '../../widgets/desktop/background_index.dart';
import '../../widgets/desktop/carrousel_index.dart';
import 'signup_form.dart';

const title = 'kCal Control';

Scaffold desktopIndex(BuildContext context) {
  return Scaffold(
    appBar: DAppBar(
      title: title,
      returnable: false,
      actions: [
        Container(
            margin: const EdgeInsets.only(right: 20),
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      //TODO: adapt desktop signup page or unify it with tablet signup page
                      MaterialPageRoute(
                          builder: (context) => const TabletSignUpPage()));
                },
                child: Text('Sign up',
                    style: TextStyle(
                        color: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.color)))),
      ],
    ),
    body: Stack(
      children: [
        const BackgroundScreen(),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
              child: Column(
                children: <Widget>[
                  Center(
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.65,
                        height: MediaQuery.of(context).size.height * 0.20,
                        child: Center(
                          child: Text('Welcome to kCal Control',
                              style: Theme.of(context).textTheme.headlineLarge),
                        )),
                  ),
                  Center(
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.50,
                        child: IndexDesktopCarousel(context)),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: 475,
                    child: const DesktopLoginForm()),
              ),
            )
          ],
        ),
      ],
    ),
    floatingActionButton: themeSelectorButton(context),
    floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
  );
}
