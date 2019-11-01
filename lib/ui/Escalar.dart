import 'package:flutter/material.dart';
import 'package:drreamlineflutter_app/ui/Menu.dart';


class Escalar extends StatefulWidget {
  @override
  _EscalarState createState() => _EscalarState();
}

class _EscalarState extends State<Escalar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Menu(),
        appBar: AppBar(
          title: Text('Jogadores disponíveis'),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 30,
            color: Colors.black,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.white,
          label: Text(
            'Salvar',
            style: TextStyle(color: Colors.black),
          ),
          icon: Icon(
            Icons.save_alt,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        body: ListView.builder(
            padding: EdgeInsets.all(10.0),
            itemCount: 10,
            itemBuilder: (context, index) {
              return _contactCard(context, index);
            }
        )
    );
  }


  Widget _contactCard(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image:
//                          players[index].img != null? FileImage(File(contacts[index].img)) :
                        AssetImage('images/user.png')),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Fer" ,
//                          players[index].nameplayer ?? "",    PLAYERS ESCALADOS
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        '36.50',
//                          players[index].pontuacao ?? "",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Color(0x00ccff).withOpacity(1),
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.end,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        'Rating',
//                          players[index].rating ?? "",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
      onTap: () {
        _showOptions(context, index);
      },
    );
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
//                          launch(
//                              "mailto:${contacts[index].email}?subject=Olá&body=Boa tarde, tudo bem?");
//                          Navigator.pop(context);
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
                        onPressed: () {
//                          launch(
//                              "mailto:${contacts[index].email}?subject=Olá&body=Boa tarde, tudo bem?");
//                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        });
  }


}
