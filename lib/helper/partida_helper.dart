import 'dart:async';
import 'package:sqflite/sqflite.dart';
import '../helper/Databases.dart';

class PartidaHelper {
  static final PartidaHelper _instance = PartidaHelper.internal();

  factory PartidaHelper() => _instance;

  PartidaHelper.internal();

  Databases databases = new Databases();

  Future close() async {
    Database dbPerson = await databases.db;
    dbPerson.close();
  }
}

class Partida {
  dynamic id;
  dynamic data;
  dynamic cd_time1;
  dynamic cd_time2;
  dynamic cd_rodada;
  dynamic nome_time1;
  dynamic nome_time2;
  dynamic nome_rodada;

//  Person();

  Partida({ this.id, this.data, this.cd_time1, this.cd_time2, this.cd_rodada, this.nome_time1, this.nome_time2, this.nome_rodada,});

  factory Partida.fromJson(Map<String, dynamic> json) {
    return Partida(
      id: json['id'],
      data: json['data'],
      cd_time1: json['cd_time1:'],
      cd_time2 : json ['cd_time2'],
      cd_rodada : json ['cd_rodada'],
      nome_time1 : json ['nome_time1'],
      nome_time2 : json ['nome_time2'],
      nome_rodada : json ['nome_rodada'],

    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['data'] = this.data;
    data['cd_time1'] = this.cd_time1;
    data['cd_time2'] = this.cd_time2;
    data['cd_rodada'] = this.cd_rodada;
    data['nome_time1'] = this.nome_time1;
    data['nome_time2'] = this.nome_time2;
    data['nome_rodada'] = this.nome_rodada;
    return data;
  }

  @override
  String toString() {
    return "Partida(id: $id, data: $data, cd_time1: $cd_time1, cd_time2: $cd_time2, cd_rodada: $cd_rodada, nome_time1: $nome_time1,nome_time2: $nome_time2 ,nome_rodada: $nome_rodada)";
  }
}

