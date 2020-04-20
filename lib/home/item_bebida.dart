import 'package:flutter/material.dart';
import 'package:cafe_app4/modelos/bebidas.dart';

class CartaBebida extends StatelessWidget {
  final Bebidas bebida;
  CartaBebida({this.bebida});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
        child: ListTile(
            leading: CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.lime[bebida.fuerza],
              backgroundImage: AssetImage("assets/icono_cafe.png"),
            ),
            title: Text(bebida.nombre),
            subtitle: Text('Con ${bebida.azucar} de azúcar')),
      ),
    );
  }
}
