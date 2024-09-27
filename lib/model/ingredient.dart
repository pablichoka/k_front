class Ingredient {
  late String type;
  late String category;
  late String description;
  late String nutrients;


  Ingredient({
    required this.type,
    required this.category,
    required this.description,
    required this.nutrients,
});

  factory Ingredient.fromMap(Map userMap){
    return Ingredient(
      type: userMap['username'],
      category: userMap['firstName'],
      description: userMap['lastName'],
      nutrients: userMap['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': type,
      'firstName': category,
      'lastName': description,
      'nutrients': nutrients,
    };
  }

}