import 'package:drreamlineflutter_app/helper/Api.dart';
import 'package:drreamlineflutter_app/helper/login_helper.dart';
import 'package:flutter/material.dart';
import 'package:drreamlineflutter_app/ui/Escalacao.dart';
import 'package:drreamlineflutter_app/ui/ListaPlayer.dart';

import 'Login.dart';
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
              "Marco Antonio Rozo",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            decoration: BoxDecoration(
              color: Color(0xFFFFFF).withOpacity(0.5),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('images/ic_logo.png'),
            ),
          ),
          ListTile(
            title: Text('Home', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200)),
            leading: Icon(
              Icons.home,
              color: Color(0x00CCFF).withOpacity(1),
            ),
            onTap: () async {
              LoginHelper helper = LoginHelper();
              String logado = await helperLog.getLogado();
              int login_id =await helper.getLogadoid();

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Principal(logado, login_id),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.dashboard,
              color: Color(0x00CCFF).withOpacity(1),
            ),
            title: Text('Sua Escalação', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200)),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Escalacao(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Players', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200)),
            leading: Icon(
              Icons.dehaze,
              color: Color(0x00CCFF).withOpacity(1),
            ),
            onTap: () async {
              String logado = await helperLog.getLogado();
              print(logado.toString() + 'aaaaa');

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ListaPlayer(logado),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.supervisor_account,
              color: Color(0x00CCFF).withOpacity(1),
            ),
            title: Text('Amigos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200)),
            onTap: () {
              //                    Navigator.pushReplacement(context,
              //                        MaterialPageRoute(builder: (context) => TabBarMenu(),),
              //                    );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.question_answer,
              color: Color(0x00CCFF).withOpacity(1),
            ),
            title: Text('Suporte', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200)),
            onTap: () {
              //                    Navigator.pushReplacement(context,
              //                        MaterialPageRoute(builder: (context) => TabBarMenu(),),
              //                    );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.power_settings_new,
              color: Colors.red,
            ),
            title: Text('Sair', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),),
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
