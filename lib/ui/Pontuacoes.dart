import 'package:drreamlineflutter_app/helper/Api.dart';
import 'package:drreamlineflutter_app/helper/pontos_jogador_helper.dart';
import 'package:drreamlineflutter_app/helper/jogador_helper.dart';
import 'package:drreamlineflutter_app/helper/login_helper.dart';
import 'package:flutter/material.dart';
import 'package:drreamlineflutter_app/ui/Menu.dart';

class PontuacaoJogadores extends StatefulWidget {
  String token;

  PontuacaoJogadores(this.token);

  @override
  _PontuacaoJogadoresState createState() => _PontuacaoJogadoresState();
}

enum OrderOptions { orderaz, orderza }

class _PontuacaoJogadoresState extends State<PontuacaoJogadores> {
  LoginHelper helperLog = LoginHelper();
  PontosJogadorHelper helper = PontosJogadorHelper();
  List<PontosJogador> pontosjogador = List();
  Api api = new Api();

  var isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    print(widget.token);
    _getAllPontuacaoJogadores();
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
                        child: Text('Menos Pontos'),
                        value: OrderOptions.orderaz,
                      ),
                      const PopupMenuItem<OrderOptions>(
                        child: Text('Mais Pontos'),
                        value: OrderOptions.orderza,
                      ),
                    ],
                onSelected: _orderList)
          ],
        ),
        body: WillPopScope(
            child: (isLoading || pontosjogador == null)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    padding: EdgeInsets.all(10.0),
                    itemCount: pontosjogador.length,
                    itemBuilder: (context, index) {
                      return _jogadorCard(context, index);
                    }),
            onWillPop: () {
              return null;
            }));
  }

  Widget _jogadorCard(BuildContext context, int index) {
    return GestureDetector(
      child: Column(
        children: <Widget>[
          Padding(
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
                    Text(
                      pontosjogador[index].nome_jogador,
                      style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  children: <Widget>[
                    Text("Pontos"),
                    Text(
                      pontosjogador[index].pontos,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Divider(color: Colors.black, height: 0,),
              )
            ],
          )
        ],
      )

    );
  }

  void _orderList(OrderOptions result) async {
    switch (result) {
      case OrderOptions.orderaz:
        pontosjogador.sort((a, b) {
          return a.pontos.toLowerCase().compareTo(b.pontos.toLowerCase());
        });
        break;
      case OrderOptions.orderza:
        pontosjogador.sort((a, b) {
          return b.pontos.toLowerCase().compareTo(a.pontos.toLowerCase());
        });
        break;
    }
    setState(() {});
  }

  _getAllPontuacaoJogadores() async {
    api.pontuacaojogador(widget.token).then((list) {
      setState(() {
        isLoading = false;
        pontosjogador = list;
      });
    });
  }
}
