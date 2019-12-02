import 'package:drreamlineflutter_app/helper/Api.dart';
import 'package:drreamlineflutter_app/helper/escalacao_helper.dart';
import 'package:drreamlineflutter_app/helper/jogador_helper.dart';
import 'package:drreamlineflutter_app/helper/login_helper.dart';
import 'package:drreamlineflutter_app/ui/Principal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:drreamlineflutter_app/ui/Menu.dart';

import 'ListaPlayer.dart';

class Escalacao extends StatefulWidget {

  String token;
  Escalacao(this.token);



  @override
  _EscalacaoState createState() => _EscalacaoState();
}

class _EscalacaoState extends State<Escalacao> {

  LoginHelper helperLog = LoginHelper();
  JogadorHelper helper = JogadorHelper();
  List<Jogador> jogador = List();
  Api api = new Api();


  //DROPD
  dynamic _selectedPlayer1;
  dynamic _selectedPlayer2;
  dynamic _selectedPlayer3;
  dynamic _selectedPlayer4;
  dynamic _selectedPlayer5;



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
          title: Text('Minha line'),
          backgroundColor: Color(0x961b03).withOpacity(1),
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
          onPressed: () async{
//                enviar escalação
                if (api.escalar(
                _selectedPlayer1.toString(), _selectedPlayer2.toString(),
                _selectedPlayer3.toString(), _selectedPlayer4.toString(),
                _selectedPlayer5.toString(), widget.token
                ) != null){


                } else {
                  print('Usuário não cadastrado');
                }
          }
        ),
        body: (isLoading || jogador == null)
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
              SizedBox(height: 30,),
              Text("Buscando informações \n necessárias...", style: TextStyle(color: Colors.blue[300], fontSize: 20), textAlign: TextAlign.center,)
            ],
          ),
        )
            :  Container(
            padding: EdgeInsets.all(20),
            color: Colors.white,
            child: ListView(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 120,
                      height: 120,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: new AssetImage("images/ic_logo.png"),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
          Container(
            margin: EdgeInsets.only(left: 40.0, right: 40.0, top: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: Colors.blueGrey)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                hint: Text(
                  '\n    Selecione o player 1',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.bold,
                  ),
                ),
                items: jogador?.map((item) {
                  return new DropdownMenuItem(
                    child: Text("     " + item.nome.toString()+ '  -  ' + item.nome_time.toString()),
                    value: item.id.toString(),
                  );
                }).toList() ??
                    [],
                onChanged: (value) {
                  setState(() {
                    _selectedPlayer1 = value;
                    print(_selectedPlayer1.toString() + ' p1');
                  });
                },
                value: _selectedPlayer1,
              ),
            ),
          ),
                Container(
                  margin: EdgeInsets.only(left: 40.0, right: 40.0, top: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: Colors.blueGrey)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      hint: Text(
                        '\n    Selecione o player 2',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      items: jogador?.map((item) {
                        return new DropdownMenuItem(
                          child: Text("     " + item.nome.toString() + '  -  ' + item.nome_time.toString()),
                          value: item.id.toString(),
                        );
                      }).toList() ??
                          [],
                      onChanged: (value) {
                        setState(() {
                          _selectedPlayer2 = value;
                          print(_selectedPlayer2.toString() + ' p2');
                        });
                      },
                      value: _selectedPlayer2,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 40.0, right: 40.0, top: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: Colors.blueGrey)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      hint: Text(
                        '\n    Selecione o player 3',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      items: jogador?.map((item) {
                        return new DropdownMenuItem(
                          child: Text("     " + item.nome.toString() + '  -  ' + item.nome_time.toString()),
                          value: item.id.toString(),
                        );
                      }).toList() ??
                          [],
                      onChanged: (value) {
                        setState(() {
                          _selectedPlayer3 = value;
                          print(_selectedPlayer3.toString() + ' p3');

                        });
                      },
                      value: _selectedPlayer3,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 40.0, right: 40.0, top: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: Colors.blueGrey)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      hint: Text(
                        '\n    Selecione o player 4',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      items: jogador?.map((item) {
                        return new DropdownMenuItem(
                          child: Text("     " + item.nome.toString() + '  -  ' + item.nome_time.toString()),
                          value: item.id.toString(),
                        );
                      }).toList() ??
                          [],
                      onChanged: (value) {
                        setState(() {
                          _selectedPlayer4 = value;
                          print(_selectedPlayer4.toString() + ' p4');

                        });
                      },
                      value: _selectedPlayer4,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 40.0, right: 40.0, top: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: Colors.blueGrey)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      hint: Text(
                        '\n    Selecione o player 5',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      items: jogador?.map((item) {
                        return new DropdownMenuItem(
                          child: Text("     " + item.nome.toString() + '  -  ' + item.nome_time.toString()),
                          value: item.id.toString(),
                        );
                      }).toList() ??
                          [],
                      onChanged: (value) {
                        setState(() {
                          _selectedPlayer5 = value;
                          print(_selectedPlayer5.toString() + ' p5');
                        });
                      },
                      value: _selectedPlayer5,
                    ),
                  ),
                ),
              ],
            )));
  }

  _getAllJogadores() async {
    api.jogadores(widget.token).then((list) {
      setState(() {
        isLoading = false;
        jogador = list;
      });
    });
  }


  void _exibirDialogo() {
    showDialog(
      context:  context,
      builder:  (BuildContext context) {
        return AlertDialog();
      },
    );
  }
}
