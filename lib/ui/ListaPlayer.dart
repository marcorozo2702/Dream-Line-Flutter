import 'package:drreamlineflutter_app/helper/Api.dart';
import 'package:drreamlineflutter_app/helper/jogador_helper.dart';
import 'package:drreamlineflutter_app/helper/login_helper.dart';
import 'package:flutter/material.dart';
import 'package:drreamlineflutter_app/ui/Menu.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class ListaPlayer extends StatefulWidget {
  String token;

  ListaPlayer(this.token);

  @override
  _ListaPlayerState createState() => _ListaPlayerState();
}

enum OrderOptions { orderaz, orderza }

class _ListaPlayerState extends State<ListaPlayer> {
  LoginHelper helperLog = LoginHelper();
  JogadorHelper helper = JogadorHelper();
  List<Jogador> jogador = List();
  Api api = new Api();

  var isLoading = false;

  @override
  void initState() {
    super.initState();

    isLoading = true;
    print(widget.token);
    _getAllJogadores();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Menu(),
        appBar: AppBar(
          title: Text('Jogadores'),
          backgroundColor: Color(0x961b03).withOpacity(1),
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
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/bg2.jpg'), fit: BoxFit.cover)),
          child: WillPopScope(
            child: (isLoading || jogador == null)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
              padding: EdgeInsets.only(bottom: 15, top: 10),
                    itemCount: jogador.length,
                    itemBuilder: (context, index) {
                      return _jogadorCard(context, index);
                    },
                  ),
            onWillPop: () {
              return null;
            },
          ),
        ));
  }

  Widget _jogadorCard(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        color: Colors.white.withOpacity(0.2),
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
                width: 15,
              ),
              Column(
                children: <Widget>[
                  Text(
                    "Player name",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    jogador[index].nome,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                children: <Widget>[
                  Text("Time", style: TextStyle(color: Colors.white)),
                  Text(
                    jogador[index].nome_time,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                children: <Widget>[
                  Text("Média Rating", style: TextStyle(color: Colors.white)),
                  Text(
                    jogador[index].rating,
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        _showOptions(context, index);
      },
    );
  }

  void _orderList(OrderOptions result) async {
    switch (result) {
      case OrderOptions.orderaz:
        jogador.sort((a, b) {
          return a.nome.toLowerCase().compareTo(b.nome.toLowerCase());
        });
        break;
      case OrderOptions.orderza:
        jogador.sort((a, b) {
          return b.nome.toLowerCase().compareTo(a.nome.toLowerCase());
        });
        break;
    }
    setState(() {});
  }

  void _showOptions(BuildContext context, int index) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return BottomSheet(
            onClosing: () {},
            builder: (context) {
              return Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Icon(Icons.info,
                                color: Color(0x961b03).withOpacity(1)),
                            Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      ' + Informações',
                                      style: TextStyle(
                                          color: Color(0x961b03).withOpacity(1),
                                          fontSize: 20.0),
                                    )
                                  ],
                                ))
                          ],
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        });
  }

  _getAllJogadores() async {
    api.jogadores(widget.token).then((list) {
      setState(() {
        isLoading = false;
        jogador = list;
      });
    });
  }
}
