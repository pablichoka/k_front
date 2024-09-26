import 'package:flutter/material.dart';

enum OAuthProvider {
  signupGoogle, signupFacebook, signupMicrosoft, loginGoogle, loginFacebook, loginMicrosoft }

class OAuth2Button extends StatelessWidget {
  final OAuthProvider provider;
  final ButtonStyle? style;

  const OAuth2Button({
    Key? key,
    required this.provider,
    this.style
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<OAuthProvider, Map<String, dynamic>> providerData = {
      OAuthProvider.signupGoogle: {
        'icon': Icons.g_mobiledata,
        'text': 'Sign up with Google'
      },
      OAuthProvider.signupFacebook: {
        'icon': Icons.facebook,
        'text': 'Sign up with Facebook'
      },
      OAuthProvider.signupMicrosoft: {
        'icon': Icons.window,
        'text': 'Sign up with Microsoft'
      },
      OAuthProvider.loginGoogle: {
        'icon': Icons.g_mobiledata,
        'text': 'Login with Google'
      },
      OAuthProvider.loginFacebook: {
        'icon': Icons.facebook,
        'text': 'Login with Facebook'
      },
      OAuthProvider.loginMicrosoft: {
        'icon': Icons.window,
        'text': 'Login with Microsoft' }
    };

    final data = providerData[provider]!;

    return ElevatedButton(
      style: style ?? ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
          )
        ),
      //TODO: implement oAuth2 login with the respective provider
      onPressed: () {
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(data['icon']),
          const SizedBox(width: 10),
          Text(data['text'])
        ]
      )
    );
  }
}
