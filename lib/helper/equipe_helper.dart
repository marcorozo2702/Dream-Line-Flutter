import 'dart:async';
import 'package:sqflite/sqflite.dart';
import '../helper/Databases.dart';

class EquipeHelper {
  static final EquipeHelper _instance = EquipeHelper.internal();

  factory EquipeHelper() => _instance;

  EquipeHelper.internal();

  Databases databases = new Databases();

  Future close() async {
    Database dbPerson = await databases.db;
    dbPerson.close();
  }
}

class Equipe {
  dynamic id;
  String nomeequipe;
  dynamic cd_usuario;


  Equipe({this.id, this.nomeequipe, this.cd_usuario});

  factory Equipe.fromJson(Map<String, dynamic> json) {
    return Equipe(
      id: json['id_equipe'],
      nomeequipe: json['nomeequipe'],
      cd_usuario : json ['cd_usuario'],

    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_equipe'] = this.id;
    data['nomeequipe'] = this.nomeequipe;
    data['cd_usuario'] = this.cd_usuario;
    return data;
  }


  @override
  String toString() {
    return "Equipe(id_equipe: $id, nome: $nomeequipe, cd_usuario: $cd_usuario)";
  }
}

