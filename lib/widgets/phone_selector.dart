import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';

import '../utils/phone_validator.dart';

InternationalPhoneNumberInput internationalPhoneNumberInput(
    PhoneNumber number, BuildContext context, TextEditingController phoneController, newUser) {
  return InternationalPhoneNumberInput(
    onInputChanged: (PhoneNumber number) {
      number = number;
    },
    validator: (value) {
      final countryLengths = Provider.of<Map<String, int>>(context, listen: false);
      if (validatePhoneNumber(phoneNumber: value!, isoCode: number.isoCode!, countryLengths: countryLengths)) {
        return null;
      } else {
        return 'Enter a valid phone number';
      }
    },
    selectorConfig: const SelectorConfig(
      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
      useBottomSheetSafeArea: true,
      showFlags: true,
      trailingSpace: true,
      leadingPadding: 10
    ),
    ignoreBlank: true,
    inputDecoration: InputDecoration(
      labelText: 'Phone number',
      prefixIcon: const Icon(Icons.phone),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      errorStyle: const TextStyle(
        fontSize: 10,
      ),
    ),
    autoValidateMode: AutovalidateMode.onUserInteraction,
    selectorTextStyle:
        TextStyle(color: Theme.of(context).textTheme.displaySmall?.color),
    initialValue: number,
    textFieldController: phoneController,
    formatInput: false,
    keyboardType:
        const TextInputType.numberWithOptions(signed: true, decimal: false),
    inputBorder: const OutlineInputBorder(),
    onSaved: (PhoneNumber number) {
      newUser.mobile = number.phoneNumber!;
    },
  );
}
