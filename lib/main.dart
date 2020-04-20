import 'package:cafe_app4/Servicios/auth.dart';
import 'package:cafe_app4/autenticar/envoltura.dart';
import 'package:cafe_app4/modelos/usuario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Usuario>.value(
        value: ServicioAuth().usuario, child: MaterialApp(home: Envoltura()));
  }
}
