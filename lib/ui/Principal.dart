import 'package:drreamlineflutter_app/helper/login_helper.dart';
import 'package:flutter/material.dart';
import 'package:drreamlineflutter_app/ui/Menu.dart';

class Principal extends StatefulWidget {

  String token;
  String nome;
  dynamic login_id;
  String nomeequipe;

  Principal(this.token, this.login_id, this.nome, this.nomeequipe);
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {



  @override
  void initState() {
    super.initState();
    print(widget.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.black,
            expandedHeight: 150.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Dream Line"),
              background: Image.asset(
                'images/backgroundAppBar.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFillRemaining(
              child: Container(
            color: Color(0xcccccc).withOpacity(0.5),
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: new BoxDecoration(
                      color: Colors.white, //new Color.fromRGBO(255, 0, 0, 0.0),
                      borderRadius: new BorderRadius.circular(10.0)
                  ),
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.all(50),
                          width: 100,
                          height: 100,
                          decoration: new BoxDecoration(
                              border: Border.all(width: 2, color: Colors.black),
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      new AssetImage("images/ic_logo.png")))),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                widget.nomeequipe,
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black,
                                    fontFamily: 'Saira'),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                widget.nome,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontFamily: 'Saira'),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "PRÓXIMAS PARTIDAS",
                  style: TextStyle(
                      color: Colors.black, fontSize: 25, fontFamily: 'Saira'),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.circular(10.0)
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Partidas")
                    ],
                  ),
                ),
              ],
            ),
          ),),
        ],
      ),
    );
  }

}
