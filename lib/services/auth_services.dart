import 'dart:async';
import 'dart:convert';
import 'package:chat/models/models.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:chat/global/environment.dart';
import 'package:flutter/material.dart';

class AuthService with ChangeNotifier {
  Usuario? usuario;
  bool _autenticando = false;
  final _storage = const FlutterSecureStorage();
  bool get autenticando => _autenticando;
  set autenticando(bool valor) {
    _autenticando = valor;
    notifyListeners();
  }

  static Future<String?> getToken() async {
    const _storage = FlutterSecureStorage();
    final token = await _storage.read(key: 'token');
    return token;
  }

  static Future<void> deleteToken() async {
    const _storage = FlutterSecureStorage();
    await _storage.delete(key: 'token');
  }

  Future<bool> login(String email, String password) async {
    autenticando = true;
    final data = {'email': email, 'password': password};
    final resp = await http.post(
      Uri.parse('${Environment.apiUrl}/login'),
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );
    autenticando = false;
    if (resp.statusCode == 200) {
      final loginResponse = loginRespFromJson(resp.body);
      usuario = loginResponse.usuario;
      await _guardarToken(loginResponse.token);
      return true;
    } else {
      return false;
    }
  }

  Future register(String nombre, String email, String password) async {
    autenticando = true;
    final data = {'nombre': nombre, 'email': email, 'password': password};
    final resp = await http.post(
      Uri.parse('${Environment.apiUrl}/login/new'),
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );
    autenticando = false;
    if (resp.statusCode == 200) {
      final registerResponse = loginRespFromJson(resp.body);
      usuario = registerResponse.usuario;
      await _guardarToken(registerResponse.token);
      return true;
    }
    // if (resp.statusCode == 400)
    else {
      final respBody = jsonDecode(resp.body);

      return respBody['msg'];
    }
  }

  Future<bool> isLoggedIn() async {
    final token = await _storage.read(key: 'token') ?? '';
    final uri = Uri.parse('${Environment.apiUrl}/login/renew');
    final resp = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'x-token': token,
      },
    );
    if (resp.statusCode == 200) {
      //aqui hay un error pero no se cual es?
      final loginResponse = loginRespFromJson(resp.body);
      usuario = loginResponse.usuario;
      await _guardarToken(loginResponse.token);
      return true;
    } else {
      logout();
      return false;
    }
  }

  Future _guardarToken(String token) async {
    return await _storage.write(key: 'token', value: token);
  }

  Future logout() async {
    await _storage.delete(key: 'token');
  }
}
