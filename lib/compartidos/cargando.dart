import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Cargando extends StatelessWidget {
  const Cargando({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          color: Colors.lightGreen[100],
          child: Center(
              child: SpinKitFoldingCube(
                  color: Colors.lightGreen[300], size: 50.0))),
    );
  }
}
