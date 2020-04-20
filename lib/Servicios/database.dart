import 'package:cafe_app4/modelos/bebidas.dart';
import 'package:cafe_app4/modelos/usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ServicioDatabase {
  final String uid;

  ServicioDatabase({this.uid});

  //Referencia a la colección
  final CollectionReference coleccionBebidas =
      Firestore.instance.collection("Bebidas");

  //Actualizar datos
  Future actualizarDatos(String nombre, String azucar, int fuerza) async {
    return await coleccionBebidas
        .document(uid)
        .setData({'azucar': azucar, 'nombre': nombre, 'fuerza': fuerza});
  }

  //Stream para la base de datos
  Stream<List<Bebidas>> get bebidas {
    return coleccionBebidas.snapshots().map(_convertirBebidas);
  }

  //Convertir las snapshots a bebidas
  List<Bebidas> _convertirBebidas(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Bebidas(
          nombre: doc.data["nombre"] ?? '',
          fuerza: doc.data["fuerza"] ?? 0,
          azucar: doc.data["azucar"] ?? "0");
    }).toList();
  }

  //Stream para el doc del user
  Stream<DatosUser> get datosUser {
    return coleccionBebidas.document(uid).snapshots().map(_convertirDatosUser);
  }

  //Convertir Snapshots a Datos User
  DatosUser _convertirDatosUser(DocumentSnapshot snapshot) {
    return DatosUser(
        uid: uid,
        nombre: snapshot.data["nombre"],
        azucar: snapshot.data["azucar"],
        fuerza: snapshot.data["fuerza"]);
  }
}
