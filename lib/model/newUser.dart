class NewUser{
  late String username;
  late String email;
  late String first_name;
  late String last_name;

 NewUser({
    required String username,
    required String email,
    required String first_name,
    required String last_name,
  });

  factory NewUser.fromJson(Map<String, dynamic> json) {
    return NewUser(
      username:json['username'],
      email:json['email'],
      first_name:json['first_name'],
      last_name:json['last_name'],
    );
  }
}