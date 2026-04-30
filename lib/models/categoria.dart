class Categoria {
  String id;
  String nombre;

  Categoria({required this.id, required this.nombre});

  factory Categoria.fromFirestore(String id, Map<String, dynamic> data) {
    return Categoria(
      id: id,
      nombre: data['nombre'],
    );
  }
}
