import 'package:flutter/material.dart';
import '../services/firestore_service.dart';
import '../models/fruta.dart';
import 'add_edit_fruta.dart';

class HomeScreen extends StatelessWidget {
  final service = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Frutería")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => AddEditFruta()));
        },
        child: Icon(Icons.add),
      ),
      body: StreamBuilder<List<Fruta>>(
        stream: service.obtenerFrutas(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();

          final frutas = snapshot.data!;

          return ListView.builder(
            itemCount: frutas.length,
            itemBuilder: (context, i) {
              final f = frutas[i];
              return ListTile(
                title: Text(f.nombre),
                subtitle: Text("Precio: ${f.precio}"),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => service.eliminarFruta(f.id),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
