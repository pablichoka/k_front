class Nutrient {
  double alphaCarotene;
  double betaCarotene;
  double betaCryptoxanthin;
  double carbohydrate;
  double cholesterol;
  double choline;
  double fiber;
  double luteinAndZeaxanthin;
  double lycopene;
  double niacin;
  double protein;
  double retinol;
  double riboflavin;
  double selenium;
  double sugarTotal;
  double thiamin;
  double water;
  Map<String, double> fat;
  Map<String, double> majorMinerals;
  Map<String, double> vitamins;

  Nutrient({
    required this.alphaCarotene,
    required this.betaCarotene,
    required this.betaCryptoxanthin,
    required this.carbohydrate,
    required this.cholesterol,
    required this.choline,
    required this.fiber,
    required this.luteinAndZeaxanthin,
    required this.lycopene,
    required this.niacin,
    required this.protein,
    required this.retinol,
    required this.riboflavin,
    required this.selenium,
    required this.sugarTotal,
    required this.thiamin,
    required this.water,
    required this.fat,
    required this.majorMinerals,
    required this.vitamins,
  });

  factory Nutrient.fromJson(Map<String, dynamic> json) {
    return Nutrient(
      alphaCarotene: json['alpha_carotene'],
      betaCarotene: json['beta_carotene'],
      betaCryptoxanthin: json['beta_cryptoxanthin'],
      carbohydrate: json['carbohydrate'],
      cholesterol: json['cholesterol'],
      choline: json['choline'],
      fiber: json['fiber'],
      luteinAndZeaxanthin: json['lutein_and_zeaxanthin'],
      lycopene: json['lycopene'],
      niacin: json['niacin'],
      protein: json['protein'],
      retinol: json['retinol'],
      riboflavin: json['riboflavin'],
      selenium: json['selenium'],
      sugarTotal: json['sugar_total'],
      thiamin: json['thiamin'],
      water: json['water'],
      fat: json['fat'],
      majorMinerals: json['major_minerals'],
      vitamins: json['vitamins'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['alpha_carotene'] = alphaCarotene;
    data['beta_carotene'] = betaCarotene;
    data['beta_cryptoxanthin'] = betaCryptoxanthin;
    data['carbohydrate'] = carbohydrate;
    data['cholesterol'] = cholesterol;
    data['choline'] = choline;
    data['fiber'] = fiber;
    data['lutein_and_zeaxanthin'] = luteinAndZeaxanthin;
    data['lycopene'] = lycopene;
    data['niacin'] = niacin;
    data['protein'] = protein;
    data['retinol'] = retinol;
    data['riboflavin'] = riboflavin;
    data['selenium'] = selenium;
    data['sugar_total'] = sugarTotal;
    data['thiamin'] = thiamin;
    data['water'] = water;
    data['fat'] = fat;
    data['major_minerals'] = majorMinerals;
    data['vitamins'] = vitamins;
      return data;
  }
}
