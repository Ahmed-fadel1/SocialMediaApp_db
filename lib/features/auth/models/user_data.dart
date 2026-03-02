import 'dart:convert';

class UserData {
  final String id;
  final String name;
  final String username;
  final String email;
  final String? imageUrl;
  final String? title;

  UserData({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    this.imageUrl,
    this.title,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'imageUrl': imageUrl,
      'title': title,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      id: map['id'] as String,
      name: map['name'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source) as Map<String, dynamic>);

  UserData copyWith({
    String? id,
    String? name,
    String? username,
    String? email,
    String? imageUrl,
    String? title,
  }) {
    return UserData(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
      title: title ?? this.title,
    );
  }
}
