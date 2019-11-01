import 'package:flutter/material.dart';
import 'package:drreamlineflutter_app/ui/Escalacao.dart';
import 'package:drreamlineflutter_app/ui/Principal.dart';
import 'package:drreamlineflutter_app/ui/Escalar.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
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
            title: Text('Home'),
            leading: Icon(
              Icons.home,
              color: Color(0x00CCFF).withOpacity(1),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Principal(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.dashboard,
              color: Color(0x00CCFF).withOpacity(1),
            ),
            title: Text('Sua Escalação'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Escalacao(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Escalar'),
            leading: Icon(
              Icons.dehaze,
              color: Color(0x00CCFF).withOpacity(1),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Escalar(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.supervisor_account,
              color: Color(0x00CCFF).withOpacity(1),
            ),
            title: Text('Amigos'),
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
            title: Text('Suporte'),
            onTap: () {
              //                    Navigator.pushReplacement(context,
              //                        MaterialPageRoute(builder: (context) => TabBarMenu(),),
              //                    );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.power_settings_new,
              color: Color(0x00CCFF).withOpacity(1),
            ),
            title: Text('Sair'),
            onTap: () {
              //                    Navigator.pushReplacement(context,
              //                        MaterialPageRoute(builder: (context) => TabBarMenu(),),
              //                    );
            },
          ),
        ],
      ),
    );
  }
}
