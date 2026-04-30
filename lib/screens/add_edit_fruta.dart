import 'package:flutter/material.dart';
import '../models/fruta.dart';
import '../services/firestore_service.dart';

class AddEditFruta extends StatefulWidget {
  final Fruta? fruta;

  AddEditFruta({this.fruta});

  @override
  _AddEditFrutaState createState() => _AddEditFrutaState();
}

class _AddEditFrutaState extends State<AddEditFruta> {
  final _nombre = TextEditingController();
  final _precio = TextEditingController();
  final service = FirestoreService();

  @override
  void initState() {
    if (widget.fruta != null) {
      _nombre.text = widget.fruta!.nombre;
      _precio.text = widget.fruta!.precio.toString();
    }
    super.initState();
  }

  void guardar() {
    final fruta = Fruta(
      id: widget.fruta?.id ?? '',
      nombre: _nombre.text,
      precio: double.parse(_precio.text),
      categoria: "General",
    );

    if (widget.fruta == null) {
      service.agregarFruta(fruta);
    } else {
      service.actualizarFruta(fruta);
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Agregar / Editar")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _nombre, decoration: InputDecoration(labelText: "Nombre")),
            TextField(controller: _precio, decoration: InputDecoration(labelText: "Precio")),
            SizedBox(height: 20),
            ElevatedButton(onPressed: guardar, child: Text("Guardar"))
          ],
        ),
      ),
    );
  }
}
