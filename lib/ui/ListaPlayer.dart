import 'package:drreamlineflutter_app/helper/Api.dart';
import 'package:drreamlineflutter_app/helper/jogador_helper.dart';
import 'package:drreamlineflutter_app/helper/login_helper.dart';
import 'package:flutter/material.dart';
import 'package:drreamlineflutter_app/ui/Menu.dart';




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
            child: (isLoading || jogador == null)
                ? Center(
              child: CircularProgressIndicator(),
            )
                : ListView.builder(
                padding: EdgeInsets.all(10.0),
                itemCount: jogador.length,
                itemBuilder: (context, index) {
                  return _jogadorCard(context, index);
                }),
            onWillPop: () {
              return null;
            })
    );
  }


  Widget _jogadorCard(BuildContext context, int index) {
    return GestureDetector(
      child:
      Card(
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
                      jogador[index].nome,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  children: <Widget>[
                    Text("Time"),
                    Text(
                      jogador[index].nome_time,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(

                  children: <Widget>[
                    Text("Média Rating"),
                    Text(
                      jogador[index].rating,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          )),
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
                          children: <Widget>[
                            Icon(Icons.info, color: Color(0x00ccff).withOpacity(1)),
                            Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'Informações',
                                      style: TextStyle(
                                          color: Color(0x00ccff).withOpacity(1), fontSize: 20.0),
                                    )
                                  ],
                                ))
                          ],
                        ),
                        onPressed: () {
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.add_circle, color: Color(0x00ccff).withOpacity(1)),
                            Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'Adicionar a line',
                                      style: TextStyle(
                                          color: Color(0x00ccff).withOpacity(1), fontSize: 20.0),
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
