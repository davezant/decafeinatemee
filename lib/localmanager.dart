import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class UserModel {
  final String username ='';
  final String password ='';
  final String email = '';
  final int hours = 0;
  final DateTime lastTimeRecharged= DateTime.now();
  final DateTime lastTimeUsed =DateTime.now();

  UserModel({
    username,
    password,
    email,
    hours,
    lastTimeRecharged,
    lastTimeUsed
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      password: json['password'],
      email: json['email'],
      hours: json['hours'],
      lastTimeRecharged: DateTime.parse(json['lastTimeRecharged']),
      lastTimeUsed: DateTime.parse(json['lastTimeUsed']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'email': email,
      'hours': hours,
      'lastTimeRecharged': lastTimeRecharged.toIso8601String(),
      'lastTimeUsed': lastTimeUsed.toIso8601String(),
    };
  }
}


Future<List<dynamic>> readUsers() async {
  final dir = await getApplicationDocumentsDirectory();
  final file = File('C:/Users/Deivid/Documents/projetos/decafeinateMee/decafeinatemee/info/userinfo.json');
  final contents = await file.readAsString();
  return jsonDecode(contents);
}


Future<UserModel?> login(String username, String password) async {
  final users = await readUsers(); // ainda retorna uma lista de Map<String, dynamic>

  for (final user in users) {
    if (user['username'] == username && user['password'] == password) {
      return UserModel.fromJson(user);
    }
  }

  return null; // login falhou
}
void fazerLogin(String username,String password ) async {
  UserModel? user = await login(username, password);

  if (user != null) {
    String nome = user.username;
    String email = user.email;
    int horas = user.hours;
    DateTime ultimaRecarga = user.lastTimeRecharged;
    DateTime ultimaUso = user.lastTimeUsed;

    print('Usuário: $nome');
    print('Email: $email');
    print('Horas disponíveis: $horas');
    print('Última recarga: $ultimaRecarga');
    print('Último uso: $ultimaUso');
  } else {
    print('Login inválido!');
  }
}
