// To parse this JSON data, do
//
//     final untitled1 = untitled1FromJson(jsonString);

import 'dart:convert';

import 'package:chat/models/models.dart';

LoginResponse loginRespFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginRespToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  bool ok;
  Usuario usuario;
  String token;

  LoginResponse({
    required this.ok,
    required this.usuario,
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        ok: json["ok"],
        usuario: Usuario.fromJson(json["usuario"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "usuario": usuario.toJson(),
        "token": token,
      };
}
