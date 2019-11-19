import 'package:drreamlineflutter_app/helper/Api.dart';
import 'package:drreamlineflutter_app/helper/login_helper.dart';
import 'package:drreamlineflutter_app/ui/Login.dart';
import 'package:drreamlineflutter_app/utils/Dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Principal.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  LoginHelper helper = LoginHelper();
  Dialogs dialog = new Dialogs();
  Api api = new Api();

  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _emailFocus = FocusNode();
  final _formCadastro = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(60, 150, 60, 0),
          child: Form(
            key: _formCadastro,
            child: Column(
              children: <Widget>[
                Text(
                  "REGISTRAR",
                  style: TextStyle(
                      color: Colors.black, fontSize: 30, fontFamily: 'Saira'),
                ),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                    controller: _emailController,
                    focusNode: _emailFocus,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                              style: BorderStyle.solid, color: Colors.black),
                        ),
                        hintText: "Email"
                        //labelText: "email"
                        ),
//                      focusNode: _emailFocus,
                    keyboardType: TextInputType.emailAddress,
                    //passa o email do campo> //controller: _emailController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Digite seu email';
                      }
                      return null;
                    }),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _senhaController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                          style: BorderStyle.solid, color: Colors.black),
                    ),
                    hintText: "Senha",
                    //labelText: "Senha"
                  ),
                  obscureText: true,
                  //valida se o campo foi preenchido
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Digite sua senha';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _nomeController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                          style: BorderStyle.solid, color: Colors.black),
                    ),
                    hintText: "Nome Completo",
                    //labelText: "Senha"
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Digite seu nome';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                  padding: EdgeInsets.all(20),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Cadastrar",
                          style: TextStyle(fontSize: 18),
                        ),
                      ]),
                  color: Colors.black87,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  onPressed: () async {
                    if (_formCadastro.currentState.validate()) {
                      if (await api.cadastro(
                          _nomeController.text,
                          _emailController.text,
                          _senhaController.text) !=
                          null) {
                        Login user = await api.login(
                            _emailController.text, _senhaController.text);
                        if (user != null) {
                          helper.saveLogado(user.id, user.token);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Principal(user.token, user.id)));
                        }
                      } else {
                        dialog.showAlertDialog(
                            context, 'Aviso', 'Usuário não cadastrado');
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () async {
                        Navigator.pop(context);
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()
                                //PROXIMA PAGE
                                ));
                      },
                      child: Text(
                        "Cancelar",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
