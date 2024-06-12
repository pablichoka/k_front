bool validatePhoneNumber({
  required String phoneNumber,
  required String isoCode,
}) {
  final cleanedPhoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');
  if (countryLengths.containsKey(isoCode)) {
    if (cleanedPhoneNumber.length != countryLengths[isoCode]) {
      return false;
    }
  }
  return true;
}

final Map<String, int> countryLengths = {
  'CN': 11, // China
  'IN': 10, // India
  'US': 10, // United States
  'ID': 10, // Indonesia
  'PK': 10, // Pakistan
  'BR': 10, // Brazil
  'NG': 10, // Nigeria
  'BD': 10, // Bangladesh
  'RU': 10, // Russia
  'MX': 10, // Mexico
  'JP': 10, // Japan
  'ET': 9, // Ethiopia
  'PH': 10, // Philippines
  'EG': 10, // Egypt
  'VN': 10, // Vietnam
  'CD': 9, // DR Congo
  'TR': 10, // Turkey
  'IR': 10, // Iran
  'TH': 9, // Thailand
  'FR': 9, // France
  'GB': 10, // United Kingdom
  'IT': 10, // Italy
  'TZ': 9, // Tanzania
  'ZA': 10, // South Africa
  'MM': 9, // Myanmar
  'KR': 10, // South Korea
  'CO': 10, // Colombia
  'ES': 9, // Spain
  'UG': 9, // Uganda
  'AR': 10, // Argentina
  'DZ': 9, // Algeria
  'SD': 9, // Sudan
  'UA': 9, // Ukraine
  'IQ': 10, // Iraq
  'AF': 9, // Afghanistan
  'PL': 9, // Poland
  'CA': 10, // Canada
  'MA': 9, // Morocco
  'SA': 9, // Saudi Arabia
  'UZ': 9, // Uzbekistan
  'PE': 9, // Peru
  'MY': 9, // Malaysia
  'AO': 9, // Angola
  'GH': 9, // Ghana
  'MZ': 9, // Mozambique
  'YE': 9, // Yemen
  'NE': 8, // Nepal
  'VE': 10, // Venezuela
  'MG': 9, // Madagascar
  'CM': 9, // Cameroon
  'CI': 8, // Ivory Coast
  'KP': 10, // North Korea
  'AU': 9, // Australia
  'SN': 9, // Senegal
  'RO': 9, // Romania
  'ML': 8, // Mali
  'NL': 9, // Netherlands
  'KH': 9, // Cambodia
  'ZM': 9, // Zambia
  'GN': 9, // Guinea
  'ZW': 9, // Zimbabwe
  'RW': 9, // Rwanda
  'TD': 9, // Chad
  'SO': 8, // Somalia
  'SS': 9, // South Sudan
  'BI': 9, // Burundi
  'TN': 8, // Tunisia
  'BJ': 8, // Benin
  'BO': 8, // Bolivia
  'BE': 9, // Belgium
  'HT': 8, // Haiti
  'CU': 8, // Cuba
  'JO': 9, // Jordan
  'GR': 10, // Greece
  'PT': 9, // Portugal
  'AZ': 9, // Azerbaijan
  'SE': 10, // Sweden
  'HN': 8, // Honduras
  'AE': 9, // United Arab Emirates
  'HU': 9, // Hungary
  'BY': 9, // Belarus
  'TJ': 9, // Tajikistan
  'AT': 10, // Austria
  'PG': 9, // Papua New Guinea
  'RS': 9, // Serbia
  'IL': 9, // Israel
  'CH': 9, // Switzerland
  'TO': 9, // Togo
  'LA': 10, // Laos
  'SG': 8, // Singapore
  'LY': 9, // Libya
  'SL': 8, // Sierra Leone
  'HK': 8, // Hong Kong
  'BG': 9, // Bulgaria
  'LB': 8, // Lebanon
  'NI': 8, // Nicaragua
  'KG': 9, // Kyrgyzstan
  'SV': 8, // El Salvador
  'TM': 8, // Turkmenistan
  'DK': 8, // Denmark
  'FI': 9, // Finland
  'CG': 9, // Republic of the Congo
  'SK': 9, // Slovakia
  'NO': 8, // Norway
  'OM': 8, // Oman
  'CR': 8, // Costa Rica
  'LR': 8, // Liberia
  'IE': 9, // Ireland
  'NZ': 9, // New Zealand
  'QA': 8, // Qatar
  'MK': 8, // North Macedonia
  'ER': 7, // Eritrea
  'PA': 8, // Panama
  'MR': 8, // Mauritania
  'UY': 8, // Uruguay
  'MU': 8, // Mauritius
  'GE': 9, // Georgia
  'BA': 8, // Bosnia and Herzegovina
  'MN': 8, // Mongolia
  'AM': 8, // Armenia
  'AL': 9, // Albania
  'LT': 8, // Lithuania
  'MD': 8, // Moldova
  'NA': 9, // Namibia
  'BW': 8, // Botswana
  'GA': 9, // Gabon
  'LS': 8, // Lesotho
  'GQ': 9, // Equatorial Guinea
  'MT': 8, // Malta
  'MV': 7, // Maldives
  'BT': 8, // Bhutan
  'BB': 7, // Barbados
  'IS': 7, // Iceland
  'KY': 10, // Cayman Islands
  'LU': 9, // Luxembourg
  'VU': 8, // Vanuatu
  'TL': 7, // Timor-Leste
  'WS': 7, // Samoa
};
