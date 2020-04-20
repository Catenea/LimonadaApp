import 'package:cafe_app4/Servicios/database.dart';
import 'package:cafe_app4/modelos/usuario.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ServicioAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Crear Usuario en base a FirebaseUser

  Usuario _convertirUser(FirebaseUser usuario) {
    return usuario != null ? Usuario(uid: usuario.uid) : null;
  }

  //Stream cuando cambia el user

  Stream<Usuario> get usuario {
    return _auth.onAuthStateChanged.map(_convertirUser);
  }

  //Iniciar sesion anon

  Future iniciarAnon() async {
    try {
      AuthResult resultado = await _auth.signInAnonymously();
      FirebaseUser user = resultado.user;
      return _convertirUser(user);
    } catch (e) {
      print(e.toString());
    }
  }

  //Registrar con coreo y Contraseña
  Future registrarConCorreo(String correo, String contra) async {
    try {
      AuthResult resultado = await _auth.createUserWithEmailAndPassword(
          email: correo, password: contra);
      FirebaseUser user = resultado.user;

      //Crear un registro para el usuario
      await ServicioDatabase(uid: user.uid)
          .actualizarDatos('Nuevo Usuario', '0', 100);
      return _convertirUser(user);
    } catch (e) {
      print(e.toString());
    }
  }

  //Iniciar Sesión con correo y contraseña
  Future iniciarrConCorreo(String correo, String contra) async {
    try {
      AuthResult resultado = await _auth.signInWithEmailAndPassword(
          email: correo, password: contra);
      FirebaseUser user = resultado.user;
      return _convertirUser(user);
    } catch (e) {
      print(e.toString());
    }
  }

  //Cerrar Sesión

  Future cerrarSesion() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
