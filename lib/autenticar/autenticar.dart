import 'package:cafe_app4/autenticar/iniciar_sesion.dart';
import 'package:cafe_app4/autenticar/registrar.dart';
import 'package:flutter/material.dart';

class Autenticar extends StatefulWidget {
  Autenticar({Key key}) : super(key: key);

  @override
  _AutenticarState createState() => _AutenticarState();
}

class _AutenticarState extends State<Autenticar> {
  bool mostrarIniciar = true;

  //Funcion para alternar entre pantallas
  void cambiarVista() {
    setState(() {
      mostrarIniciar = !mostrarIniciar;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (mostrarIniciar) {
      return IniciarSesion(cambiarVista: cambiarVista);
    } else {
      return Registrar(cambiarVista: cambiarVista);
    }
  }
}
