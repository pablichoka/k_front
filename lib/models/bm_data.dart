class BmData {
  final int age;
  final double weight;
  final int height;
  final String gender;
  final double baseBM;
  final int numDaysEx;
  final String dietType;
  final double totalBM;

  BmData({
    required this.age,
    required this.weight,
    required this.height,
    required this.gender,
    required this.baseBM,
    required this.numDaysEx,
    required this.dietType,
    required this.totalBM,
  });

  factory BmData.fromJson(Map<String, dynamic> json) {
    return BmData(
      age: json['bmData.age'],
      weight: json['bmData.weight'],
      height: json['bmData.height'],
      gender: json['bmData.gender'],
      baseBM: json['bmData.baseBM'],
      numDaysEx: json['bmData.numDaysEx'],
      dietType: json['bmData.dietType'],
      totalBM: json['bmData.totalBM'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bmData.age'] = age;
    data['bmData.weight'] = weight;
    data['bmData.height'] = height;
    data['bmData.gender'] = gender;
    data['bmData.baseBM'] = baseBM;
    data['bmData.numDaysEx'] = numDaysEx;
    data['bmData.dietType'] = dietType;
    data['bmData.totalBM'] = totalBM;
    return data;
  }
}
