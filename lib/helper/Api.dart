import 'package:drreamlineflutter_app/helper/equipe_helper.dart';
import 'package:drreamlineflutter_app/helper/escalacao_helper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'login_helper.dart';
import 'jogador_helper.dart';
//const BASE_URL = "https://marcorozo99.000webhostapp.com/rest/";
const BASE_URL = "http://10.10.198.225/dreamline/rest/";


class Api {
  String token;

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

  Future<Escalacao> escalar(Escalacao escalacao, int login_id, String token,
      dynamic cd_jogador, dynamic cd_rodada, dynamic cd_equipe) async {
    http.Response response = await http.post(BASE_URL + "escalacao",
        body: jsonEncode({
          "cd_jogador": escalacao.cd_jogador,
          "cd_rodada": escalacao.cd_rodada,
          "cd_equipe": escalacao.cd_equipe,
          "cd_usuario": login_id
        }),
        headers: {'token': token, 'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      Escalacao dadosJson = new Escalacao.fromJson(json.decode(response.body));
      return dadosJson;
    } else {
      return null;
    }
  }

}