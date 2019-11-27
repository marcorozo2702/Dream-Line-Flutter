import 'package:drreamlineflutter_app/helper/Api.dart';
import 'package:drreamlineflutter_app/helper/equipe_helper.dart';
import 'package:drreamlineflutter_app/helper/login_helper.dart';
import 'package:flutter/material.dart';
import 'package:drreamlineflutter_app/ui/Menu.dart';

class ListaEquipes extends StatefulWidget {

  String token;
  ListaEquipes(this.token);

  @override
  ListaEquipesState createState() => ListaEquipesState();
}

enum OrderOptions { orderaz, orderza }

class ListaEquipesState extends State<ListaEquipes> {
  LoginHelper helperLog = LoginHelper();
  EquipeHelper helper = EquipeHelper();
  List<Equipe> equipe = List();
  Api api = new Api();

  var isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    _getAllEquipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Menu(),
        appBar: AppBar(
          title: Text('Equipes teste'),
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
            child: (isLoading || equipe == null)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    padding: EdgeInsets.all(10.0),
                    itemCount: equipe.length,
                    itemBuilder: (context, index) {
                      return _equipeCard(context, index);
                    }),
            onWillPop: () {
              return null;
            }));
  }

  Widget _equipeCard(BuildContext context, int index) {
    Card(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Column(
              children: <Widget>[
                Text("id"),
                Text(
                  equipe[index].id,
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
                Text("user"),
                Text(
                  equipe[index].cd_usuario,
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
                Text("nome equipes"),
                Text(
                  equipe[index].nomeequipe,
                  style: TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold),
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
        equipe.sort((a, b) {
          return a.nomeequipe.toLowerCase().compareTo(b.nomeequipe.toLowerCase());
        });
        break;
      case OrderOptions.orderza:
        equipe.sort((a, b) {
          return b.nomeequipe.toLowerCase().compareTo(a.nomeequipe.toLowerCase());
        });
        break;
    }
    setState(() {});
  }

  _getAllEquipes() async {
    api.equipes(widget.token).then((list) {
      setState(() {
        isLoading = false;
        equipe = list;
      });
    });
  }
}
