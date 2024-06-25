import 'package:flutter/material.dart';

ElevatedButton oAuth2Buttons({required String text, required IconData icon}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    onPressed: () => {},
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(icon),
        const SizedBox(width: 10),
        Text(text),
      ],
    ),
  );
}