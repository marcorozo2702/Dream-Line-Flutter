import 'package:drreamlineflutter_app/helper/Api.dart';
import 'package:drreamlineflutter_app/helper/escalacao_helper.dart';
import 'package:drreamlineflutter_app/helper/jogador_helper.dart';
import 'package:drreamlineflutter_app/helper/login_helper.dart';
import 'package:flutter/material.dart';
import 'package:drreamlineflutter_app/ui/Menu.dart';

import 'ListaEquipes.dart';

class MinhaEscalacao extends StatefulWidget {
  String token;

  MinhaEscalacao(this.token);

  @override
  _MinhaEscalacaoState createState() => _MinhaEscalacaoState();
}

class _MinhaEscalacaoState extends State<MinhaEscalacao> {
  LoginHelper helperLog = LoginHelper();
  EscalacaoHelper helper = EscalacaoHelper();
  List<Escalacao> escalacao = List();
  Api api = new Api();

  var isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    print(widget.token);
    _getAllJogadoresEscalados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Menu(),
        appBar: AppBar(
          title: Text('Jogadores'),
          backgroundColor: Colors.black,
          centerTitle: true,
          actions: <Widget>[
            PopupMenuButton<OrderOptions>(
                itemBuilder: (context) => <PopupMenuEntry<OrderOptions>>[
                      const PopupMenuItem<OrderOptions>(
                        child: Text('Ordenar de A-Z'),
                        value: OrderOptions.orderaz,
                      ),
                      const PopupMenuItem<OrderOptions>(
                        child: Text('Ordenar de Z-A'),
                        value: OrderOptions.orderza,
                      ),
                    ],
                onSelected: _orderList)
          ],
        ),
        body: WillPopScope(
            child: (isLoading || escalacao == null)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    padding: EdgeInsets.all(10.0),
                    itemCount: escalacao.length,
                    itemBuilder: (context, index) {
                      return _jogadorEscalacaoCard(context, index);
                    }),
            onWillPop: () {
              return null;
            }));
  }

  Widget _jogadorEscalacaoCard(BuildContext context, int index) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                Text("Player name"),
                Text(
                  escalacao[index].nomejogador,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _orderList(OrderOptions result) async {
    switch (result) {
      case OrderOptions.orderaz:
        escalacao.sort((a, b) {
          return a.nomeequipe.toLowerCase().compareTo(b.nomeequipe.toLowerCase());
        });
        break;
      case OrderOptions.orderza:
        escalacao.sort((a, b) {
          return b.nomeequipe.toLowerCase().compareTo(a.nomeequipe.toLowerCase());
        });
        break;
    }
    setState(() {});
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
