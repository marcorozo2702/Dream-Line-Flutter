import 'package:drreamlineflutter_app/ui/Principal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'helper/login_helper.dart';
import 'ui/Login.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  LoginHelper helper = LoginHelper();
  //get login_id e token
  String logado =await helper.getLogado();
  Logado users = await helper.getInfoLogado();
  int login_id =await helper.getLogadoid();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  runApp(MaterialApp(
    home: (logado != null) ? Principal(logado, login_id, users.nome, users.nomeequipe) : LoginScreen(),
    debugShowCheckedModeBanner: false,
  ));
}