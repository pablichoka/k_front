import 'package:flutter/material.dart';
import 'package:k_front/routes/pages/common/login_page.dart';
import 'package:k_front/routes/pages/common/signup_page.dart';

import '../../../themes/theme_data.dart';
import '../../../widgets/common/app_bar.dart';
import '../../../widgets/common/background_index.dart';
import '../../../widgets/desktop/carrousel_index.dart';

const title = 'kCal Control';

Scaffold desktopIndex(BuildContext context) {
  return Scaffold(
    appBar: DAppBar(
      title: title,
      returnable: false,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: TextButton.icon(
            icon: Icon(Icons.login, color: Theme.of(context).textTheme.headlineLarge?.color),
            label: Text('Log in with Google',
              style: TextStyle(
                color: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.color)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage()));
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.primaries[DateTime.now().millisecond % Colors.primaries.length]
            )
          )
        ),
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: TextButton.icon(
            icon: Icon(Icons.facebook, color: Theme.of(context).textTheme.headlineLarge?.color),
            label: Text('Log in with Facebook',
              style: TextStyle(
                color: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.color)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage()));
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.primaries[DateTime.now().millisecond % Colors.primaries.length]
            )
          )
        ),
        Container(
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
            child: Text('Login',
              style: TextStyle(
                color: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.color)))),
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUpPage()));
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(
                Theme.of(context).highlightColor)),
            child: Text('Sign up',
              style: TextStyle(
                color: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.color))))
      ]
    ),
    body: Stack(
      children: [
        const BackgroundScreen(),
        Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.65,
                  height: MediaQuery.of(context).size.height * 0.10,
                  child: Center(
                    child: Text('Welcome to kCal Control',
                      style: Theme.of(context).textTheme.headlineLarge)
                  )
                )
              ),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: IndexDesktopCarousel(context)
                )
              )
            ]
          )
        )
      ]
    ),
    floatingActionButton: themeSelectorButton(context),
    floatingActionButtonLocation: FloatingActionButtonLocation.endFloat
  );
}
