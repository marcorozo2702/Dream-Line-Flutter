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
  dynamic id;
  dynamic cd_equipe;
  dynamic cd_jogador;
  dynamic cd_rodada;
  dynamic nomeequipe;
  dynamic nomejogador;
  dynamic nomerodada;

//  Person();

  Escalacao({ this.id, this.cd_equipe, this.cd_jogador, this.cd_rodada, this.nomeequipe, this.nomejogador, this.nomerodada,});

  factory Escalacao.fromJson(Map<String, dynamic> json) {
    return Escalacao(
      id: json['id'],
      cd_equipe: json['cd_equipe'],
      cd_jogador: json['cd_jogador'],
      cd_rodada : json ['cd_rodada'],
      nomeequipe : json ['nomeequipe'],
      nomejogador : json ['nomejogador'],
      nomerodada : json ['nomerodada'],

    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cd_equipe'] = this.cd_equipe;
    data['cd_jogador'] = this.cd_jogador;
    data['cd_rodada'] = this.cd_rodada;
    data['nomeequipe'] = this.nomeequipe;
    data['nomejogador'] = this.nomejogador;
    data['nomerodada'] = this.nomerodada;
    return data;
  }

  @override
  String toString() {
    return "Escalacao(id: $id, cd_equipe: $cd_equipe, cd_jogador: $cd_jogador, cd_rodada: $cd_rodada, nomeequipe: $nomeequipe, nomejogador: $nomejogador,nomerodada: $nomerodada)";
  }
}

