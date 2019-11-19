import 'package:flutter/material.dart';
import 'package:drreamlineflutter_app/ui/Menu.dart';

class Principal extends StatefulWidget {

  String token;
  int login_id;

  Principal(this.token, this.login_id);
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
                  padding: EdgeInsets.all(8),
                  color: Colors.white,
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
                                "MIBR",
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
                                "Marco Antonio Rozo",
                                style: TextStyle(
                                    fontSize: 12,
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
                  height: 5,
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "PONTUAÇÃO",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Saira',
                            fontSize: 18),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(child: Divider(color: Colors.black)),
                        ],
                      ),
                      Text(
                        "594.60",
                        style:
                            TextStyle(color: Colors.black, fontFamily: 'Saira'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "PARTIDAS",
                  style: TextStyle(
                      color: Colors.black, fontSize: 25, fontFamily: 'Saira'),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  color: Colors.white,
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
