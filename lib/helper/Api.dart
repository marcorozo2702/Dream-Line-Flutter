import 'package:http/http.dart' as http;
import 'dart:convert';
import 'login_helper.dart';
//import 'pessoa_helper.dart';
const BASE_URL = "https://marcorozo99.000webhostapp.com/rest/";

class Api {
  String token;

  Future<Login> login(String email, String senha) async {
    http.Response response = await http.post(BASE_URL + "login",
        body: jsonEncode({"senha": senha, "email": email}),
        headers: {'token': token, 'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      print(response.body);
      Login dadosJson = new Login.fromMap(json.decode(response.body));

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




}