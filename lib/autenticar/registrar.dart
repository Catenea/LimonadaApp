import 'package:cafe_app4/compartidos/cargando.dart';
import 'package:cafe_app4/compartidos/constantes.dart';
import 'package:flutter/material.dart';
import 'package:cafe_app4/Servicios/auth.dart';

class Registrar extends StatefulWidget {
  final Function cambiarVista;

  Registrar({Key key, this.cambiarVista}) : super(key: key);

  @override
  _RegistrarState createState() => _RegistrarState();
}

class _RegistrarState extends State<Registrar> {
  final ServicioAuth _auth = ServicioAuth();
  final _formKey = GlobalKey<FormState>();
  bool cargando = false;

  //Estado Campos de Texto

  String correo = "";
  String contra = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return cargando
        ? Cargando()
        : Scaffold(
            backgroundColor: Colors.lightGreen[100],
            appBar: AppBar(
              backgroundColor: Colors.lightGreen[300],
              title: Text("Registrarse"),
              elevation: 0.0,
              actions: <Widget>[
                FlatButton.icon(
                    icon: Icon(Icons.person),
                    label: Text("Iniciar Sesión"),
                    onPressed: () {
                      widget.cambiarVista();
                    })
              ],
            ),
            body: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                child: Form(
                  key: _formKey,
                  child: Column(children: <Widget>[
                    SizedBox(height: 20),
                    TextFormField(
                        decoration:
                            decoracionInput.copyWith(hintText: "Correo"),
                        validator: (val) =>
                            val.isEmpty ? "Ingrese un correo" : null,
                        onChanged: (val) {
                          setState(() {
                            correo = val;
                          });
                        }),
                    SizedBox(height: 20),
                    TextFormField(
                        decoration:
                            decoracionInput.copyWith(hintText: "Contraseña"),
                        validator: (val) => val.length < 6
                            ? "Ingrese una contraseña mayor a 6 carácteres"
                            : null,
                        obscureText: true,
                        onChanged: (val) {
                          setState(() {
                            contra = val;
                          });
                        }),
                    SizedBox(height: 20),
                    RaisedButton(
                      color: Colors.lightGreen[300],
                      child: Text(
                        "Registrar",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() {
                            cargando = true;
                          });
                          dynamic resultado =
                              await _auth.registrarConCorreo(correo, contra);
                          if (resultado == null) {
                            setState(() {
                              error = "Por favor ingrese datos válidos";
                              cargando = false;
                            });
                          }
                        }
                      },
                    ),
                    SizedBox(height: 12),
                    Text(error, style: TextStyle(color: Colors.red))
                  ]),
                )),
          );
  }
}
