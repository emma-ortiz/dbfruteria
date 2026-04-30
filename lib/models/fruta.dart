class Fruta {
  String id;
  String nombre;
  double precio;
  String categoria;

  Fruta({
    required this.id,
    required this.nombre,
    required this.precio,
    required this.categoria,
  });

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'precio': precio,
      'categoria': categoria,
    };
  }

  factory Fruta.fromFirestore(String id, Map<String, dynamic> data) {
    return Fruta(
      id: id,
      nombre: data['nombre'],
      precio: (data['precio'] as num).toDouble(),
      categoria: data['categoria'],
    );
  }
}
