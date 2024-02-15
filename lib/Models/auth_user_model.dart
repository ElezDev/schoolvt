import 'dart:convert';

UserAuth UserAuthFromJson(String str) {
  final Map<String, dynamic> jsonMap = json.decode(str);
  return UserAuth.fromJson(jsonMap);
}

String UserAuthToJson(UserAuth data) => json.encode(data.toJson());

class UserAuth {
  String token;

  UserAuth({
    required this.token,
  });

  factory UserAuth.fromJson(Map<String, dynamic> json) {
    return UserAuth(
      token: json["access_token"],
    );
  }

  Map<String, dynamic> toJson() => {
        "access_token": token,
      };
}
