class Categoria {
  String id;
  String nombre;

  Categoria({required this.id, required this.nombre});

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
    };
  }

  factory Categoria.fromFirestore(String id, Map<String, dynamic> data) {
    return Categoria(
      id: id,
      nombre: data['nombre'],
    );
  }
}
