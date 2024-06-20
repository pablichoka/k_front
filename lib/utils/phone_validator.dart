import 'dart:convert';

import 'package:flutter/services.dart';

Future<Map<String, int>> loadCountryLengths() async {
  final String jsonString = await rootBundle.loadString('country_phone_lengths.json');
  final Map<String, dynamic> jsonResponse = json.decode(jsonString);
  try {
    return jsonResponse.map((key, value) => MapEntry(key, value as int));
  } on Exception catch (e) {
    throw Exception('Error parsing country lengths: $e');
  }
}

Future<int?> getCountryLength(String isoCode) async {
  final countryLengths = await loadCountryLengths();
  return countryLengths[isoCode];
}

bool validatePhoneNumber({
  required String phoneNumber,
  required String isoCode,
  required Map<String, int> countryLengths,
}) {
  final cleanedPhoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');
  final countryLength = countryLengths[isoCode];
  if (cleanedPhoneNumber.length != countryLength) {
    return false;
  }
  return true;
}