import 'package:cafe_app4/autenticar/autenticar.dart';
import 'package:cafe_app4/home/home.dart';
import 'package:cafe_app4/modelos/usuario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Envoltura extends StatelessWidget {
  const Envoltura({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuario = Provider.of<Usuario>(context);

    if (usuario == null) {
      return Autenticar();
    } else {
      return Home();
    }
  }
}
