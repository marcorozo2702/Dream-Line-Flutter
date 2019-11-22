import 'package:http/http.dart' as http;
import 'dart:convert';
import 'login_helper.dart';
import 'jogador_helper.dart';
//const BASE_URL = "https://marcorozo99.000webhostapp.com/rest/";
const BASE_URL = "http://10.10.198.225/dreamline/rest/";


class Api {
  String token;

  Future<Logado> login(String email, String senha) async {
    http.Response response = await http.post(BASE_URL + "Login",
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

  Future<Login> cadastro(String nome, String email, String senha) async {
    http.Response response = await http.post(BASE_URL + "login/cadastro",
        body: jsonEncode({"senha": senha, "email": email, "nome": nome}),
        headers: {'token': token, 'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      Login dadosJson = new Login.fromMap(json.decode(response.body));
      return dadosJson;
    } else {
      return null;
    }
  }

  Future<bool> cadastroequipe(String nomeequipe, int cd_usuario, String token) async {
    http.Response response = await http.post(BASE_URL + "equipe",
        body: jsonEncode({"nome": nomeequipe, "cd_usuario": cd_usuario}),
        headers: {'token': token, 'Content-Type': 'application/json'});
    print(response.body + " XALALA");
    if (response.statusCode == 200) {
      print(jsonDecode(response.body) + " \n XERERE");
      return null;
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




}