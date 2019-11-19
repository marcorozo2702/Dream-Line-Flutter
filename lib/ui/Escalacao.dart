import 'package:flutter/material.dart';
import 'package:drreamlineflutter_app/ui/Menu.dart';

class Escalacao extends StatefulWidget {
  @override
  _EscalacaoState createState() => _EscalacaoState();
}

class _EscalacaoState extends State<Escalacao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Menu(),
        appBar: AppBar(
          title: Text('Minha line'),
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
        body: Container(
            padding: EdgeInsets.all(20),
            color: Colors.white,
            child: ListView(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        height: 120,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),

                            color: Colors.white),
                        child: Image(
                          image: AssetImage("images/ic_logo.png"),
                        )
                      ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 120,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(width: 1, color: Colors.grey),
                            color: Colors.white),
                        child: Icon(
                          Icons.add,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 120,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(width: 1, color: Colors.grey),
                            color: Colors.white),
                        child: Icon(
                          Icons.add,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 120,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(width: 1, color: Colors.grey),
                            color: Colors.white),
                        child: Icon(
                          Icons.add,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ))
    );
  }


  Widget _contactCard(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 100,
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blue[100]),
                    child: Icon(
                      Icons.add,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 100,
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blue[100]),
                    child: Icon(
                      Icons.add,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 100,
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blue[100]),
                    child: Icon(
                      Icons.add,
                      color: Colors.blue,
                    ),
                  ),
                ),
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
                            Icon(Icons.info,
                                color: Color(0x00ccff).withOpacity(1)),
                            Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'Informações',
                                      style: TextStyle(
                                          color: Color(0x00ccff).withOpacity(1),
                                          fontSize: 20.0),
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
                        color: Color(0x00ccff).withOpacity(1),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.delete, color: Colors.white),
                            Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'Remover da line',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20.0),
                                    )
                                  ],
                                ))
                          ],
                        ),
                        onPressed: () {
//                          helper.deleteContact(contacts[index].id);
//                          setState(() {
//                            contacts.removeAt(index);
//                            Navigator.pop(context);
//                          });
                        },
                      ),
                    )
                  ],
                ),
              );
            },
          );
        });
  }
}