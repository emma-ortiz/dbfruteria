class Fruta {
  String id;
  String nombre;
  double precio;
  String categoriaId;

  Fruta({
    required this.id,
    required this.nombre,
    required this.precio,
    required this.categoriaId,
  });

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'precio': precio,
      'categoriaId': categoriaId,
    };
  }

  factory Fruta.fromFirestore(String id, Map<String, dynamic> data) {
    return Fruta(
      id: id,
      nombre: data['nombre'],
      precio: (data['precio'] as num).toDouble(),
      categoriaId: data['categoriaId'],
    );
  }
}
