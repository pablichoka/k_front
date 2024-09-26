import 'package:flutter/material.dart';
import 'package:k_front/widgets/common/app_bar.dart';

import '../../../widgets/common/background_index.dart';
import '../../../widgets/mobile/carrousel_index.dart';

Scaffold mobileIndex(BuildContext context) {
  return Scaffold(
    appBar: const DAppBar(
      title: title,
      returnable: false
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
                  ]
                ))
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Theme.of(context).cardColor),
                      shape: WidgetStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                      padding: WidgetStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 10)),
                      minimumSize: WidgetStateProperty.all<Size>(
                        Size(MediaQuery.of(context).size.width * 0.9, 50))),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        'signup');
                    },
                    child: 
                    Text('Sign up',
                      style:
                      Theme.of(context).textTheme.headlineSmall)),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Theme.of(context).secondaryHeaderColor),
                      shape: WidgetStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                      padding: WidgetStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 10)),
                      minimumSize: WidgetStateProperty.all<Size>(
                        Size(MediaQuery.of(context).size.width * 0.9, 50))),

                    onPressed: () {
                      Navigator.pushNamed(context, 'login');
                    },
                    child: Text('Log in',
                      style: Theme.of(context).textTheme.headlineSmall))
                ]))
          ])
      ])
  );
}

const title = 'kCal Control';
