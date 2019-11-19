import 'dart:async';
import 'package:sqflite/sqflite.dart';
import '../helper/Databases.dart';

class JogadorHelper {
  static final JogadorHelper _instance = JogadorHelper.internal();

  factory JogadorHelper() => _instance;

  JogadorHelper.internal();

  Databases databases = new Databases();

  Future close() async {
    Database dbPerson = await databases.db;
    dbPerson.close();
  }
}

class Jogador {
  dynamic id;
  String nome;
  dynamic rating;
  dynamic nome_time;

//  Person();

  Jogador({this.id, this.nome, this.rating, this.nome_time});

  factory Jogador.fromJson(Map<String, dynamic> json) {
    return Jogador(
      id: json['id'],
      nome: json['nome'],
      rating: json['rating'],
      nome_time : json ['nome_time'],

    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['rating'] = this.rating;
    data['nome_time'] = this.nome_time;
    return data;
  }

  @override
  String toString() {
    return "Person(id: $id, nome: $nome, telefone: $rating, usuario_id: $nome_time)";
  }
}

