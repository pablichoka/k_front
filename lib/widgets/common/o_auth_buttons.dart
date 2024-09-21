import 'package:flutter/material.dart';

ElevatedButton oAuth2Buttons({required String text, required IconData icon}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      shape: text != ''
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )
          : const CircleBorder(eccentricity: 0.5),
    ),
    onPressed: () => {},
    child: text != ''
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon),
              const SizedBox(width: 10),
              Text(text),
            ],
          )
        : Icon(icon),
  );
}
