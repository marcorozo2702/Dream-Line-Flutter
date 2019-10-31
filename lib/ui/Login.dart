import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:drreamlineflutter_app/ui/Cadastro.dart';
import 'package:drreamlineflutter_app/ui/Principal.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //constantes

  final _emailFocus = FocusNode();

  final _formLogin = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
          child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 120, left: 30, right: 30),
              child: Form(
                key: _formLogin,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: 144,
                      height: 144,
                      child: Image.asset('images/ic_logo.png'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0,
                              right: 20.0,
                              top: 10.0,
                              bottom: 100.0),
                          child: Text(
                            "DREAM LINE",
                            style:
                                TextStyle(fontSize: 40.0, fontFamily: 'Saira'),
                          ),
                        )
                      ],
                    ),
                    TextFormField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Colors.black45)),
                            hintText: "Email"
                            //labelText: "email"
                            ),
                        focusNode: _emailFocus,
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
                    SizedBox(height: 30),
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: RaisedButton(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Login", style: TextStyle(fontSize: 16),),
                                  ]),
                              color: Colors.black87,
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              onPressed: () async {
                                Navigator.pop(context);
                                await Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Principal()
                                      //PROXIMA PAGE
                                        ));
                              },
                            ),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: RaisedButton(
                              padding: EdgeInsets.all(10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[Text("Registrar-se", style: TextStyle(fontSize: 16),)],
                                ),
                                color: Colors.white,
                                textColor: Colors.black87,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                onPressed: () async {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Cadastro(),
                                      ),
                                  );
                                }),
                          ),
//                        child: RaisedButton(
//                            child: Row(
//                              crossAxisAlignment: CrossAxisAlignment.center,
//                              mainAxisAlignment: MainAxisAlignment.center,
//                              children: <Widget>[
//                                Text("Cadastrar")
//                              ],
//                            ),
//                            color: Colors.white,
//                            textColor: Colors.black87,
//                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
//                            onPressed: () async {
//                              Navigator.push(
//                                  context,
//                                  MaterialPageRoute(
//                                    //proxima page
//                                  ));
//                            }),
                        )
                      ],
                    ),
                  ],
                ),
              )),
          onWillPop: () {
            SystemNavigator.pop();
          }),
    );
  }
}
