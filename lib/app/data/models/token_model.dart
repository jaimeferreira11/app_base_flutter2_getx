import 'dart:convert';

class TokenModel {
  String accessToken;
  String tokenType;
  String refreshToken;
  String scope;
  int expiresIn;

  TokenModel(
      {required this.accessToken,
      required this.tokenType,
      required this.refreshToken,
      required this.expiresIn,
      required this.scope});

  factory TokenModel.fromJson(String str) =>
      TokenModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TokenModel.fromMap(Map<String, dynamic> json) => TokenModel(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        refreshToken: json["refresh_token"],
        expiresIn: json["expires_in"],
        scope: json["scope"],
      );

  Map<String, dynamic> toMap() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "refresh_token": refreshToken,
        "expires_in": expiresIn,
        "scope": scope,
      };
}
