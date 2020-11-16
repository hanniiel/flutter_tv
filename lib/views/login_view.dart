import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tv/bloc/auth/bloc_authentication.dart';
import 'package:flutter_tv/bloc/login/bloc_login.dart';
import 'package:flutter_tv/components/common/rounded_button.dart';
import 'package:flutter_tv/views/home_view.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'loginView';
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocListener<LoginBloc, LoginState>(
        listener: (_, state) {
          if (state.isSuccess) {
            BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
            Navigator.pushReplacementNamed(context, HomeScreen.id);
          } else if (state.isReset) {
            showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: Text('Restablecer contraseña'),
                    content: Text('Se ha enviado el correo'),
                    actions: [
                      FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Aceptar'),
                      )
                    ],
                  );
                });
          } else if (state.isFailure) {
            showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: Text('Error'),
                    content: Text('Ha ocurrido un error al iniciar sesión'),
                    actions: [
                      FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Aceptar'),
                      )
                    ],
                  );
                });
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Ingresa',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 26.0,
                      fontFamily: 'Cocogoose',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Container(
              padding: EdgeInsets.only(right: 20.0, left: 20.0),
              child: TextField(
                  textCapitalization: TextCapitalization.none,
                  controller: _controllerEmail,
                  keyboardType: TextInputType.visiblePassword,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w200,
                  ),
                  decoration: InputDecoration(
                      hintText: "Correo electrónico",
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                      ),
                      prefixIcon: Icon(
                        Icons.mail_outline,
                        color: Color(0xffFFFFFF).withOpacity(0.6),
                      ),
                      fillColor: Color(0xffFFFFFF).withOpacity(0.52),
                      filled: true,
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                          borderSide: false
                              ? BorderSide(
                                  color: Color(0xFFffffff).withOpacity(0.62))
                              : BorderSide(width: 0),
                          borderRadius:
                              BorderRadius.all(Radius.circular(33.0))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: false
                              ? BorderSide(
                                  color: Color(0xFFFFFFFF).withOpacity(0.62))
                              : BorderSide(width: 0),
                          borderRadius:
                              BorderRadius.all(Radius.circular(33.0))))),
            ),
            Container(
              margin: EdgeInsets.only(top: 12.0),
              padding: EdgeInsets.only(right: 20.0, left: 20.0),
              child: TextField(
                  textCapitalization: TextCapitalization.none,
                  obscureText: true,
                  controller: _controllerPassword,
                  keyboardType: TextInputType.visiblePassword,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w200,
                  ),
                  decoration: InputDecoration(
                      hintText: "Contraseña",
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                      ),
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Color(0xffFFFFFF).withOpacity(0.6),
                      ),
                      fillColor: Color(0xffFFFFFF).withOpacity(0.52),
                      filled: true,
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                          borderSide: false
                              ? BorderSide(
                                  color: Color(0xFFffffff).withOpacity(0.62))
                              : BorderSide(width: 0),
                          borderRadius:
                              BorderRadius.all(Radius.circular(33.0))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: false
                              ? BorderSide(
                                  color: Color(0xFFFFFFFF).withOpacity(0.62))
                              : BorderSide(width: 0),
                          borderRadius:
                              BorderRadius.all(Radius.circular(33.0))))),
            ),
            Padding(
                padding: EdgeInsets.only(left: 25, top: 15),
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) {
                        var resetController = TextEditingController();
                        return AlertDialog(
                          title: Text('Restablecer contraseña'),
                          content: TextField(
                            controller: resetController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: "email",
                            ),
                          ),
                          actions: [
                            FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancelar'),
                            ),
                            FlatButton(
                              onPressed: () {
                                print(resetController.value.text);
                                BlocProvider.of<LoginBloc>(context).add(
                                    ResetPassword(resetController.value.text));
                                Navigator.pop(context);
                              },
                              child: Text('Enviar'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    '¿Olvidaste tu contraseña?',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Helvetica Neu',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                )),
            RoundedButtonGradient(
              text: "Iniciar sesión",
              marginGeometry: EdgeInsets.fromLTRB(63, 50, 63, 80),
              height: 58.0,
              onPress: () {
                BlocProvider.of<LoginBloc>(context).add(
                    LoginWithCredentialsPressed(
                        email: _controllerEmail.value.text,
                        password: _controllerPassword.value.text));
              },
            ),
          ],
        ),
      ),
    );
  }
}
