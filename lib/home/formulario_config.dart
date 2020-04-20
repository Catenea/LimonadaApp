import 'package:cafe_app4/Servicios/database.dart';
import 'package:cafe_app4/compartidos/cargando.dart';
import 'package:flutter/material.dart';
import 'package:cafe_app4/compartidos/constantes.dart';
import 'package:cafe_app4/modelos/usuario.dart';
import 'package:provider/provider.dart';

class FormularioConfig extends StatefulWidget {
  FormularioConfig({Key key}) : super(key: key);

  @override
  _FormularioConfigState createState() => _FormularioConfigState();
}

class _FormularioConfigState extends State<FormularioConfig> {
  final _formKey = GlobalKey<FormState>();
  final List<String> azucares = ["0", "1", "2", "3", "4"];

  String _nombreActual;
  String _azucarActual;
  int _fuerzaActual;

  @override
  Widget build(BuildContext context) {
    final usuario = Provider.of<Usuario>(context);

    return StreamBuilder<DatosUser>(
        stream: ServicioDatabase(uid: usuario.uid).datosUser,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            DatosUser datosUser = snapshot.data;
            return Form(
              key: _formKey,
              child: Column(children: <Widget>[
                Text("Configuración", style: TextStyle(fontSize: 20.0)),
                SizedBox(height: 20.0),
                TextFormField(
                  initialValue: datosUser.nombre,
                  decoration: decoracionInput,
                  validator: (val) => val.isEmpty ? "Ingrese un nombre" : null,
                  onChanged: (val) => setState(() => _nombreActual = val),
                ),
                SizedBox(height: 20.0),
                //Dropdown
                DropdownButtonFormField(
                    decoration: decoracionInput,
                    value: _azucarActual ?? datosUser.azucar,
                    items: azucares.map((azucar) {
                      return DropdownMenuItem(
                          value: azucar, child: Text("${azucar} de azucar"));
                    }).toList(),
                    onChanged: (val) => setState(() => _azucarActual = val)),
                Slider(
                    activeColor:
                        Colors.lightGreen[_fuerzaActual ?? datosUser.fuerza],
                    inactiveColor:
                        Colors.lightGreen[_fuerzaActual ?? datosUser.fuerza],
                    min: 100.0,
                    max: 900.0,
                    divisions: 8,
                    value: (_fuerzaActual ?? datosUser.fuerza).toDouble(),
                    onChanged: (val) =>
                        setState(() => _fuerzaActual = val.round())),
                //Deslizador
                RaisedButton(
                  color: Colors.lightGreen[300],
                  child: Text(
                    "Actualizar",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      await ServicioDatabase(uid: usuario.uid).actualizarDatos(
                          _nombreActual ?? datosUser.nombre,
                          _azucarActual ?? datosUser.azucar,
                          _fuerzaActual ?? datosUser.fuerza);
                      Navigator.pop(context);
                    }
                  },
                )
              ]),
            );
          } else {
            return Cargando();
          }
        });
  }
}
