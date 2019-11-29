import 'dart:async';
import 'package:sqflite/sqflite.dart';
import '../helper/Databases.dart';

class PontosJogadorHelper {
  static final PontosJogadorHelper _instance = PontosJogadorHelper.internal();

  factory PontosJogadorHelper() => _instance;

  PontosJogadorHelper.internal();

  Databases databases = new Databases();

  Future close() async {
    Database dbPerson = await databases.db;
    dbPerson.close();
  }
}

class PontosJogador {
  dynamic pontos;
  dynamic rating;
  String nome_jogador;


//  Person();

  PontosJogador({this.pontos, this.rating,this.nome_jogador});

  factory PontosJogador.fromJson(Map<String, dynamic> json) {
    return PontosJogador(
      pontos: json['pontos'],
      rating: json['rating'],
      nome_jogador: json['nome_jogador'],

    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pontos'] = this.pontos;
    data['rating'] = this.rating;
    data['nome_jogador'] = this.nome_jogador;

    return data;
  }

  @override
  String toString() {
    return "PontosJogador(pontos: $pontos, telefone: $rating, nome_jogador: $nome_jogador,)";
  }
}

