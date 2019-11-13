import 'package:drreamlineflutter_app/helper/Api.dart';
import 'package:drreamlineflutter_app/helper/login_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:drreamlineflutter_app/ui/Cadastro.dart';
import 'package:drreamlineflutter_app/ui/Principal.dart';

class LoginScreen extends StatefulWidget {

  final LoginScreen login;
  LoginScreen({this.login});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //constantes
  final _emailFocus = FocusNode();
  final _emailController= TextEditingController();
  final _senhaController= TextEditingController();
  final _formLogin = GlobalKey<FormState>();

  LoginHelper helper = LoginHelper();
  List<Login> login = List();
  Api api = new Api();


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
                        controller: _emailController,
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
                      controller: _senhaController,
                      obscureText: true,
                      //valida se o campo foi preenchido
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Digite sua senha';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 60,
                      child:RaisedButton(
                        padding: EdgeInsets.all(10),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Entrar", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500, letterSpacing: 1), ),
                            ]),
                        color: Colors.black87,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        onPressed: () async {
                          if (_formLogin.currentState.validate()) {
                            Login user = await api.login(
                                _emailController.text, _senhaController.text);
                            if (user != null) {
                              helper.saveLogado(user.id, user.token);
                              Navigator.pop(context);
                              await Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Principal(user.token, user.id)
                                  ));
                            }
                          }
                        }
                      ) ,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () async {
                            Navigator.pop(context);
                            await Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Cadastro()
                                  //PROXIMA PAGE
                                ));
                          },
                          child: Text(
                            "Não possui uma conta? Cadastrar-se", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )),
          onWillPop: () {
            SystemNavigator.pop();
          }),
    );
  }
}
