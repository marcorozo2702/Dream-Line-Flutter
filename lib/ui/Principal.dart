import 'package:drreamlineflutter_app/helper/Api.dart';
import 'package:drreamlineflutter_app/helper/escalacao_helper.dart';
import 'package:drreamlineflutter_app/helper/login_helper.dart';
import 'package:flutter/material.dart';
import 'package:drreamlineflutter_app/ui/Menu.dart';

import 'package:drreamlineflutter_app/OneSignal/home_bloc.dart';

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
  var bloc = BlocHome();

  LoginHelper helperLog = LoginHelper();
  EscalacaoHelper helper = EscalacaoHelper();
  List<Escalacao> escalacao = List();
  Api api = new Api();

  var isLoading = false;

  @override
  void initState() {
    bloc.initOneSignal();
    super.initState();
    isLoading = true;
    print(widget.token);
    _getAllJogadoresEscalados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Color(0x961b03).withOpacity(1),
            expandedHeight: 120.0,
            floating: false,
            pinned: true,
            title: Text("Dream Line",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30, color: Colors.white, fontFamily: 'Saira', ),
            ),
          ),
          SliverFillRemaining(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/bg2.jpg'),fit: BoxFit.cover
                )
              ),
//              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: new BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        //new Color.fromRGBO(255, 0, 0, 0.0),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50.0),
                            bottomRight: Radius.circular(50.0))),
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(50),
                          width: 100,
                          height: 100,
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                              fit: BoxFit.cover,
                              image: new AssetImage("images/ic_logo.png"),
                            ),
                          ),
                        ),
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
                                      color: Colors.white,
                                      fontFamily: 'Saira'),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  widget.nome,
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
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
                    height: 10,
                  ),
                  Text(
                    "SUA ESCALAÇÃO",
                    style: TextStyle(
                        color: Colors.white, fontSize: 25, fontFamily: 'Saira'),
                  ),
                  Expanded(
                    child: (isLoading || escalacao == null)
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            scrollDirection: Axis.vertical,
                            padding: EdgeInsets.all(10.0),
                            itemCount: escalacao.length,
                            itemBuilder: (context, index) {
                              return _jogadorEscalacaoCard(context, index);
                            }),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _jogadorEscalacaoCard(BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.0), color: Colors.transparent),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 48.0,
                  height: 48.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image:
//                          players[index].img != null? FileImage(File(contacts[index].img)) :
                        AssetImage('images/user.png')),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      escalacao[index].nomejogador,
                      style: TextStyle(
                        color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Saira'),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      escalacao[index].pontos,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                      )
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(child: Divider(color: Colors.white,))
              ],
            )
          ],
        )
      ),
    );
  }

  _getAllJogadoresEscalados() async {
    api.escalacao(widget.token).then((list) {
      setState(() {
        isLoading = false;
        escalacao = list;
      });
    });
  }
}
