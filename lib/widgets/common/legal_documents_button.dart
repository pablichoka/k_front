import 'package:flutter/material.dart';

class LegalDocumentsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextButton(
            onPressed: () {},
            child: Text(
              'Terms and Conditions',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          const Text('|'),
          TextButton(
            onPressed: () {},
            child: Text(
              'Privacy Policy',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        ],
      ),
    );
  }
}
