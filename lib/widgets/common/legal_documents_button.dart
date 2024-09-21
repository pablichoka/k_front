import 'package:flutter/material.dart';

Positioned legalDocumentsButton(BuildContext context) {
  return Positioned(
    height: 20,
    bottom: 10,
    left: MediaQuery.of(context).size.width * 0.35,
    right: MediaQuery.of(context).size.width * 0.35,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextButton(
          onPressed: () {},
          child: Text(
              style: Theme.of(context).textTheme.labelSmall,
              'Terms and Conditions'),
        ),
        const Text('|'),
        TextButton(
          onPressed: () {},
          child: Text(
              style: Theme.of(context).textTheme.labelSmall, 'Privacy Policy'),
        ),
      ],
    ),
  );
}
