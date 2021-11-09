import 'dart:convert';

class Login {
  int id;
  String username;
  String password;
  
  Login({
    required this.id,
    required this.username,
    required this.password,
  });

  Login copyWith({
    int? id,
    String? username,
    String? password,
  }) {
    return Login(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password,
    };
  }

  factory Login.fromMap(Map<String, dynamic> map) {
    return Login(
      id: map['id'],
      username: map['username'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Login.fromJson(String source) => Login.fromMap(json.decode(source));

  @override
  String toString() =>
      'Login(id: $id, username: $username, password: $password)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Login &&
        other.id == id &&
        other.username == username &&
        other.password == password;
  }

  @override
  int get hashCode => id.hashCode ^ username.hashCode ^ password.hashCode;
}
