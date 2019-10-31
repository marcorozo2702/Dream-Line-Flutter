import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(30, 100, 30, 0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "REGISTRAR",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontFamily: 'Saira'),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                        textAlign: TextAlign.center,

                        autofocus: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Colors.black),
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
                      textAlign: TextAlign.center,

                      autofocus: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                              style: BorderStyle.solid, color: Colors.black),
                        ),
                        hintText: "Senha",
                        //labelText: "Senha"
                      ),
                      //passar a senha do campo> // controller: _senhaController,
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
                      textAlign: TextAlign.center,

                      autofocus: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                              style: BorderStyle.solid, color: Colors.black),
                        ),
                        hintText: "Nome do seu time",
                        //labelText: "Senha"
                      ),
                      //passar a senha do campo> // controller: _senhaController,
                      obscureText: true,
                      //valida se o campo foi preenchido
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Digite sua senha';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10,),
                    RaisedButton(
                      padding: EdgeInsets.all(20),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Cadastrar", style: TextStyle(fontSize: 18),),
                          ]),

                      color: Colors.black87,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),

                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
