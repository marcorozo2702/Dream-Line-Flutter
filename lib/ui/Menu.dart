import 'package:drreamlineflutter_app/helper/Api.dart';
import 'package:drreamlineflutter_app/helper/login_helper.dart';
import 'package:drreamlineflutter_app/ui/MinhaEscalacao.dart';
import 'package:drreamlineflutter_app/ui/Partidas.dart';
import 'package:flutter/material.dart';
import 'package:drreamlineflutter_app/ui/Escalacao.dart';
import 'package:drreamlineflutter_app/ui/ListaPlayer.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'ListaEquipes.dart';
import 'Login.dart';
import 'Pontuacoes.dart';
import 'Principal.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  Api api = new Api();
  LoginHelper helperLog = LoginHelper();



    int admin = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              "Dream Line",
              style: TextStyle(fontSize: 25, color: Colors.white, fontFamily: 'Saira', fontWeight: FontWeight.w300),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/bg.jpg'),fit: BoxFit.cover
              )
//              gradient: LinearGradient(
//                  colors: [Color(0x1ca7ec).withOpacity(1),Color(0xf2f98).withOpacity(1)],
//                  begin: FractionalOffset(1, 0),
//                  end: FractionalOffset(0.1, 0),
//                  stops: [0.0, 1.0],
//                  tileMode: TileMode.clamp
//              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('images/ic_logo.png'),
            ),
          ),
          ListTile(
            title: Text('Home', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200)),
            leading: Icon(
              Icons.home,
              color: Color(0x961b03).withOpacity(1),
            ),
            onTap: () async {
              LoginHelper helper = LoginHelper();
              String logado = await helperLog.getLogado();
              Logado users = await helper.getInfoLogado();
              int login_id =await helper.getLogadoid();

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Principal(logado, login_id, users.nome, users.nomeequipe),
                ),
              );
            },
          ),

          ListTile(
            leading: Icon(
              FontAwesomeIcons.gamepad,
              color: Color(0x961b03).withOpacity(1),
            ),
            title: Text('Próximas partidas', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200)),
            onTap: () async {
              String logado = await helperLog.getLogado();

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Partidas(logado),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.trophy,
              color: Color(0x961b03).withOpacity(1),
            ),
            title: Text('Pontuações dos jogadores', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200)),
            onTap: () async {
              String logado = await helperLog.getLogado();

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => PontuacaoJogadores(logado),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.dashboard,
              color: Color(0x961b03).withOpacity(1),
            ),
            title: Text('Escalar line', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200)),
            onTap: () async {
              String logado = await helperLog.getLogado();

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Escalacao(logado),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Informações sobre players', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200)),
            leading: Icon(
              Icons.dehaze,
              color: Color(0x961b03).withOpacity(1),
            ),
            onTap: () async {
              String logado = await helperLog.getLogado();

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ListaPlayer(logado),
                ),
              );
            },
          ),
//          ListTile(
//            leading: Icon(
//              Icons.supervisor_account,
//              color: Color(0x00CCFF).withOpacity(1),
//            ),
//            title: Text('Equipes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200)),
//            onTap: () async {
//              String logado = await helperLog.getLogado();
//              print(logado.toString() + 'aaaaa');
//
//              Navigator.pushReplacement(
//                context,
//                MaterialPageRoute(
//                  builder: (context) => ListaEquipes(logado),
//                ),
//              );
//            },
//          ),
//          ListTile(
//            leading: Icon(
//              Icons.question_answer,
//              color: Color(0xf2f98).withOpacity(1),
//            ),
//            title: Text('Suporte', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200)),
//            onTap: () {
//              //                    Navigator.pushReplacement(context,
//              //                        MaterialPageRoute(builder: (context) => TabBarMenu(),),
//              //                    );
//            },
//          ),
          ListTile(
            leading: Icon(
              Icons.power_settings_new,
              color: Colors.black,
            ),
            title: Text('Sair', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200),),
            onTap: () async{
              await helperLog.deleteLogado();
              Navigator.pop(context);
              await Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
        ],
      ),
    );
  }



}
