import 'package:flutter/material.dart';

enum OAuthProvider { google, facebook, microsoft }

class OAuth2Button extends StatelessWidget {
  final OAuthProvider provider;
  final ButtonStyle? style;

  const OAuth2Button({
    Key? key,
    required this.provider,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<OAuthProvider, Map<String, dynamic>> providerData = {
      OAuthProvider.google: {
        'text': 'Sign up with Google',
        'icon': Icons.g_translate,
      },
      OAuthProvider.facebook: {
        'text': 'Sign up with Facebook',
        'icon': Icons.facebook,
      },
      OAuthProvider.microsoft: {
        'text': 'Sign up with Microsoft',
        'icon': Icons.window,
      },
    };

    final data = providerData[provider]!;

    return ElevatedButton(
      style: style ?? ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      //TODO: implement oAuth2 login with the respective provider
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(data['icon']),
          const SizedBox(width: 10),
          Text(data['text']),
        ],
      ),
    );
  }
}