class LoggedUser {
  late String username;
  late String password;



  LoggedUser({
    required this.username,
    required this.password,
  });

  factory LoggedUser.fromMap(Map userMap){
    return LoggedUser(
        username: userMap['username'],
        password: userMap['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }

}