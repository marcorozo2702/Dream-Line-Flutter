import 'package:flutter/material.dart';

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
              style: TextStyle(fontSize: 16),
            ),
            decoration: BoxDecoration(
              color: Color(0x00C6F8).withOpacity(1),
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
            ),
            onTap: () {
              //                    Navigator.pushReplacement(context,
              //                        MaterialPageRoute(builder: (context) => TabBarMenu(),),
              //                    );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.arrow_forward,
            ),
            title: Text('Sua Escalação'),
            onTap: () {
              //                    Navigator.pushReplacement(context,
              //                        MaterialPageRoute(builder: (context) => TabBarMenu(),),
              //                    );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.arrow_forward,
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
              Icons.arrow_forward,
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
              Icons.arrow_forward,
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
