class User {
  late String username;
  late String firstName;
  late String lastName;
  late String email;
  late String password;
  late String mobile;
  late String role;



  User({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.mobile,
    required this.role
});

  factory User.fromMap(Map userMap){
    return User(
      username: userMap['username'],
      firstName: userMap['firstName'],
      lastName: userMap['lastName'],
      email: userMap['email'],
      password: userMap['password'],
      mobile: userMap['mobile'],
      role: userMap['role']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'mobile': mobile,
      'role': role,
    };
  }

}