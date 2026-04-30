import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/fruta.dart';

class FirestoreService {
  final db = FirebaseFirestore.instance;

  // CREATE
  Future<void> agregarFruta(Fruta fruta) async {
    await db.collection('frutas').add(fruta.toMap());
  }

  // READ
  Stream<List<Fruta>> obtenerFrutas() {
    return db.collection('frutas').snapshots().map((snapshot) =>
        snapshot.docs
            .map((doc) => Fruta.fromFirestore(doc.id, doc.data()))
            .toList());
  }

  // UPDATE
  Future<void> actualizarFruta(Fruta fruta) async {
    await db.collection('frutas').doc(fruta.id).update(fruta.toMap());
  }

  // DELETE
  Future<void> eliminarFruta(String id) async {
    await db.collection('frutas').doc(id).delete();
  }
}

// OBTENER CATEGORIAS
Stream<List<Categoria>> obtenerCategorias() {
  return db.collection('categorias').snapshots().map((snapshot) =>
      snapshot.docs
          .map((doc) => Categoria.fromFirestore(doc.id, doc.data()))
          .toList());
}
