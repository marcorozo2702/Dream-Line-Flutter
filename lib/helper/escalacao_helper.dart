import 'dart:async';
import 'package:sqflite/sqflite.dart';
import '../helper/Databases.dart';

class EscalacaoHelper {
  static final EscalacaoHelper _instance = EscalacaoHelper.internal();

  factory EscalacaoHelper() => _instance;

  EscalacaoHelper.internal();

  Databases databases = new Databases();

  Future close() async {
    Database dbPerson = await databases.db;
    dbPerson.close();
  }
}

class Escalacao {
  dynamic cd_jogador;
  dynamic nomejogador;
  dynamic nomeequipe;
  dynamic pontos;

//  Person();

  Escalacao({this.cd_jogador, this.nomejogador, this.nomeequipe, this.pontos,});

  factory Escalacao.fromJson(Map<String, dynamic> json) {
    return Escalacao(
      cd_jogador: json['cd_jogador'],
      nomejogador: json['nomejogador'],
      nomeequipe : json ['nomeequipe'],
      pontos : json ['pontos'],

    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cd_jogador'] = this.cd_jogador;
    data['nomejogador'] = this.nomejogador;
    data['nomeequipe'] = this.nomeequipe;
    data['pontos'] = this.pontos;
    return data;
  }

  @override
  String toString() {
    return "Escalacao( cd_jogador: $cd_jogador, nomejogador: $nomejogador, nomeequipe: $nomeequipe, pontos: $pontos,)";
  }
}

