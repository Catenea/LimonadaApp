import 'package:cafe_app4/home/item_bebida.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cafe_app4/modelos/bebidas.dart';

class ListaBebidas extends StatefulWidget {
  ListaBebidas({Key key}) : super(key: key);

  @override
  _ListaBebidasState createState() => _ListaBebidasState();
}

class _ListaBebidasState extends State<ListaBebidas> {
  @override
  Widget build(BuildContext context) {
    final bebidas = Provider.of<List<Bebidas>>(context) ?? [];

    return ListView.builder(
      itemCount: bebidas.length,
      itemBuilder: (context, index) {
        return CartaBebida(bebida: bebidas[index]);
      },
    );
  }
}
