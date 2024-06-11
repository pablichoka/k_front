import 'package:flutter/material.dart';
import 'package:k_front/forms/desktop/login.dart';

import '../../forms/mobile/login.dart';
import '../../forms/signup.dart';
import '../../themes/theme_data.dart';
import '../../widgets/common/app_bar.dart';
import '../../widgets/desktop/background_index.dart';
import '../../widgets/desktop/carrousel_index.dart';
import '../../assets/constants.dart';

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
                      MaterialPageRoute(
                          builder: (context) => const SignUpPage()));
                },
                child: Text('Sign up',
                    style: TextStyle(
                        color: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.color)))),
        !isDesktop(context)
            ? Container(
                margin: const EdgeInsets.only(right: 20),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(
                            Theme.of(context).highlightColor)),
                    child: Text('Log in',
                        style: TextStyle(
                            color: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.color))))
            : Container()
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
                        width: !isDesktop(context)
                            ? MediaQuery.of(context).size.width * 0.96
                            : MediaQuery.of(context).size.width * 0.60,
                        height: MediaQuery.of(context).size.height * 0.20,
                        child: Center(
                          child: Text('Welcome to kCal Control',
                              style: Theme.of(context).textTheme.headlineLarge),
                        )),
                  ),
                  Center(
                    child: SizedBox(
                        width: !isDesktop(context)
                            ? MediaQuery.of(context).size.width * 0.96
                            : MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.40,
                        child: IndexDesktopCarousel(context)),
                  )
                ],
              ),
            ),
            isDesktop(context)
                ? Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.02),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                        ),
                        width: MediaQuery.of(context).size.width * 0.30,
                        height: MediaQuery.of(context).size.height * 0.60,
                        child: const LoginForm()),
                  )
                : const SizedBox(),
          ],
        ),
      ],
    ),
    floatingActionButton: themeSelectorButton(context),
    floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
  );
}
