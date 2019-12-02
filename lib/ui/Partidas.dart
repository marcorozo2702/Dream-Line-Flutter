import 'package:drreamlineflutter_app/helper/Api.dart';
import 'package:drreamlineflutter_app/helper/escalacao_helper.dart';
import 'package:drreamlineflutter_app/helper/jogador_helper.dart';
import 'package:drreamlineflutter_app/helper/login_helper.dart';
import 'package:drreamlineflutter_app/helper/partida_helper.dart';
import 'package:flutter/material.dart';
import 'package:drreamlineflutter_app/ui/Menu.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'ListaEquipes.dart';

class Partidas extends StatefulWidget {
  String token;

  Partidas(this.token);

  @override
  _PartidasState createState() => _PartidasState();
}

class _PartidasState extends State<Partidas> {
  LoginHelper helperLog = LoginHelper();
  PartidaHelper helper = PartidaHelper();
  List<Partida> partida = List();
  Api api = new Api();

  var isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    print(widget.token);
    _getAllPartidas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        title: Text(
          'Partidas',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0x961b03).withOpacity(1),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton<OrderOptions>(
              itemBuilder: (context) => <PopupMenuEntry<OrderOptions>>[
                    const PopupMenuItem<OrderOptions>(
                      child: Text('Data - '),
                      value: OrderOptions.orderaz,
                    ),
                    const PopupMenuItem<OrderOptions>(
                      child: Text('Data + '),
                      value: OrderOptions.orderza,
                    ),
                  ],
              onSelected: _orderList)
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg2.jpg'), fit: BoxFit.cover
          ),
        ),
        child: WillPopScope(
          child: (isLoading || partida == null)
              ? Center(
            child: CircularProgressIndicator(),
          )
              : ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: partida.length,
              itemBuilder: (context, index) {
                return _jogadorEscalacaoCard(context, index);
              }),
          onWillPop: () {
            return null;
          },
        ),
      ),
    );
  }

  Widget _jogadorEscalacaoCard(BuildContext context, int index) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Data: ",
              style: TextStyle(fontSize: 18.0,color: Colors.white, fontWeight: FontWeight.w300),
            ),
            Text(
              partida[index].data,
              style: TextStyle(fontSize: 18.0,color: Colors.white, fontWeight: FontWeight.w300),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              partida[index].nome_time1,
              style: TextStyle(fontSize: 18.0,color: Colors.white,  fontWeight: FontWeight.bold),
            ),
            Text(
              "        X       ",
              style: TextStyle(fontSize: 25.0,color: Colors.white, fontWeight: FontWeight.w100),
            ),
            Text(
              partida[index].nome_time2,
              style: TextStyle(fontSize: 18.0,color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(child: Divider(color: Colors.white)),
          ],
        ),
      ],
    );
  }

  void _orderList(OrderOptions result) async {
    switch (result) {
      case OrderOptions.orderaz:
        partida.sort((a, b) {
          return a.data.toLowerCase().compareTo(b.data.toLowerCase());
        });
        break;
      case OrderOptions.orderza:
        partida.sort((a, b) {
          return b.data.toLowerCase().compareTo(a.data.toLowerCase());
        });
        break;
    }
    setState(() {});
  }

  _getAllPartidas() async {
    api.partida(widget.token).then((list) {
      setState(() {
        isLoading = false;
        partida = list;
      });
    });
  }
}
