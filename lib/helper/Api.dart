import 'package:drreamlineflutter_app/helper/equipe_helper.dart';
import 'package:drreamlineflutter_app/helper/escalacao_helper.dart';
import 'package:drreamlineflutter_app/helper/partida_helper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'pontos_jogador_helper.dart';
import 'login_helper.dart';
import 'jogador_helper.dart';
const BASE_URL = "https://marcorozo99.000webhostapp.com/rest/";
//const BASE_URL = "http://10.10.198.225/dreamline/rest/";
//const BASE_URL = "http://192.168.1.9/dreamline/rest/";


class Api {
  String token;

///////////// USUARIO
  Future<Logado> login(String email, String senha) async {
    http.Response response = await http.post(BASE_URL + "login",
        body: jsonEncode({"senha": senha, "email": email}),
        headers: {'token': token, 'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      print(response.body);
      Logado dadosJson = new Logado.fromMap(json.decode(response.body));
      return dadosJson;
    } else {
      return null;
    }
  }

  Future<Logado> cadastro(String nome, String email, String senha, String nomeequipe) async {
    http.Response response = await http.post(BASE_URL + "login/cadastro",
        body: jsonEncode({"senha": senha, "email": email, "nome": nome, "nomeequipe": nomeequipe, }),
        headers: {'token': token, 'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      print(response.body);
      Logado dadosJson = new Logado.fromMap(json.decode(response.body));
      print(dadosJson);
      return dadosJson;
    } else {
      return null;
    }
  }
  //----------------

//------------------JOGADORES (PLAYERS)
  Future<List<Jogador>> jogadores(String token) async {
    http.Response response = await http.get(BASE_URL + 'Jogador',
        headers: {'token': token, 'Content-Type': 'application/json'});
    print(response.body);
    if (response.statusCode == 200) {
      List<Jogador> jogadores = json.decode(response.body).map<Jogador>((map) {
        return Jogador.fromJson(map);
      }).toList();
      return jogadores;
    } else {
      return null;
    }
  }
  //-----------------

  //----------- EQUIPES
  Future<List<Equipe>> equipes(String token) async {
    http.Response response = await http.get(BASE_URL + 'Equipe',
        headers: {'token': token, 'Content-Type': 'application/json'});
//    print(response.body);
    if (response.statusCode == 200) {
      List<Equipe> equipes = json.decode(response.body).map<Equipe>((map) {
        return Equipe.fromJson(map);
      }).toList();
      print(equipes);
      return equipes;
    } else {
      return null;
    }
  }
  //-----------


//----------------------ESCALAÇÃO
  Future<List<Escalacao>> escalacao(String token) async {
     http.Response response = await http.get(BASE_URL + 'pontuacao/getEscalacaoPontos',
        headers: {'token': token, 'Content-Type': 'application/json'});
//    print(response.body);
    if (response.statusCode == 200) {
      List<Escalacao> escalacao = json.decode(response.body).map<Escalacao>((map) {
        return Escalacao.fromJson(map);
      }).toList();
      print(escalacao);
      return escalacao;
    } else {
      return null;
    }
  }

  Future<Escalacao> escalar(
      dynamic _selectPlayer1, dynamic _selectPlayer2,
      dynamic _selectPlayer3, dynamic _selectPlayer4, dynamic _selectPlayer5, String token) async {
    print(_selectPlayer1);
    http.Response response = await http.post(BASE_URL + "Escalacao",
        body: jsonEncode({
          "cd_jogador":  {"0":_selectPlayer1,"1":_selectPlayer2,"2":_selectPlayer3, "3":_selectPlayer4, "4":_selectPlayer5},
        }),
        headers: {'token': token, 'Content-Type': 'application/json'});
    print(response.body);
    if (response.statusCode == 200) {
      Escalacao dadosJson = new Escalacao.fromJson(json.decode(response.body));
      return dadosJson;
    } else {
      return null;
    }
  }
  //-----------------


  Future<List<Partida>> partida(String token) async {
    http.Response response = await http.get(BASE_URL + 'Partida',
        headers: {'token': token, 'Content-Type': 'application/json'});
    print(response.body);
    if (response.statusCode == 200) {
      List<Partida> partida = json.decode(response.body).map<Partida>((map) {
        return Partida.fromJson(map);
      }).toList();
      print(partida);
      return partida;
    } else {
      return null;
    }
  }


  //-----------------Pontuacao
  Future<List<PontosJogador>> pontuacaojogador(String token) async {
    http.Response response = await http.get(BASE_URL + 'Pontuacao/',
        headers: {'token': token, 'Content-Type': 'application/json'});
    print(response.body);
    if (response.statusCode == 200) {
      List<PontosJogador> pontosjogador = json.decode(response.body).map<PontosJogador>((map) {
        return PontosJogador.fromJson(map);
      }).toList();
      print(pontosjogador);
      return pontosjogador;
    } else {
      return null;
    }
  }


}