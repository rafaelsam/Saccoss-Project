class UserInfo {
  late final String id;
  late final String email;
  late final String username;



  UserInfo({required this.id, required this.email, required this.username});

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      id: json['id'],
      username: json['username'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id' : id,
    'username': username,
    'email': email,
  };
}