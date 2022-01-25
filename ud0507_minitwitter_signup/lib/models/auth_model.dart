class AuthResponse {
  AuthResponse({
    required this.token,
    required this.username,
    required this.email,
    required this.photoUrl,
    required this.created,
    required this.active,
  });
  late final String token;
  late final String username;
  late final String email;
  late final String photoUrl;
  late final String created;
  late final bool active;
  
  AuthResponse.fromJson(Map<String, dynamic> json){
    token = json['token'];
    username = json['username'];
    email = json['email'];
    photoUrl = json['photoUrl'];
    created = json['created'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['token'] = token;
    _data['username'] = username;
    _data['email'] = email;
    _data['photoUrl'] = photoUrl;
    _data['created'] = created;
    _data['active'] = active;
    return _data;
  }
}

class AuthDto {
  AuthDto({
    required this.username,
    required this.email,
    required this.password,
    required this.code
  });
  late final String username;
  late final String email;
  late final String password;
  final String code;

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['email'] = email;
    _data['password'] = password;
    _data['code'] = code;
    return _data;
  }
}