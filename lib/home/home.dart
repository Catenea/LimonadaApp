import 'package:cafe_app4/Servicios/auth.dart';
import 'package:cafe_app4/Servicios/database.dart';
import 'package:cafe_app4/home/formulario_config.dart';
import 'package:cafe_app4/home/lista_bebidas.dart';
import 'package:cafe_app4/modelos/bebidas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ServicioAuth _auth = ServicioAuth();

  @override
  Widget build(BuildContext context) {
    void mostrarPanelConfig() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
                padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 20.0),
                child: FormularioConfig());
          });
    }

    return StreamProvider<List<Bebidas>>.value(
      value: ServicioDatabase().bebidas,
      child: Scaffold(
        backgroundColor: Colors.indigo[50],
        appBar: AppBar(
            title: Text("Limonadas"),
            backgroundColor: Colors.lightGreen[300],
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                label: Text(
                  "Salir",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  await _auth.cerrarSesion();
                },
              ),
              FlatButton.icon(
                icon: Icon(Icons.settings, color: Colors.white),
                label:
                    Text("Configurar", style: TextStyle(color: Colors.white)),
                onPressed: () => mostrarPanelConfig(),
              )
            ]),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/fondo_lima.jpg"),
                    fit: BoxFit.cover)),
            child: ListaBebidas()),
      ),
    );
  }
}
