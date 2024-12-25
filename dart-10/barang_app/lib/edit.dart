import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Edit extends StatefulWidget {
  const Edit({super.key, required this.id});
  final String id;

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  final _formKey = GlobalKey<FormState>();
  
  var kdBrg = TextEditingController();
  var nmBrg = TextEditingController();
  var hrjBeli = TextEditingController();
  var hrjJual = TextEditingController();
  var stok = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future _getData() async {
    try {
      final response = await http.get(Uri.parse("http://localhost/latihan/barang_app/detail.php?id=${widget.id}"));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          kdBrg = TextEditingController(text: data['kdBrg']);
          nmBrg = TextEditingController(text: data['nmBrg']);
          hrjBeli = TextEditingController(text: data['hrjBeli']);
          hrjJual = TextEditingController(text: data['hrjJual']);
          stok = TextEditingController(text: data['stok']);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future _onUpdate(BuildContext context) async {
    try {
      return await http.post(
        Uri.parse("http://localhost/latihan/barang_app/update.php"),
        body: {
          "id": widget.id,
          "kdBrg": kdBrg.text,
          "nmBrg": nmBrg.text,
          "hrjBeli": hrjBeli.text,
          "hrjJual": hrjJual.text,
          "stok": stok.text,
        },
      ).then((value) {
        var data = jsonDecode(value.body);
        print(data["message"]);
        Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
      });
    } catch (e) {
      print(e);
    }
  }

  Future _onDelete(BuildContext context) async {
    try {
      return await http.post(
        Uri.parse("http://localhost/latihan/barang_app/delete.php"),
        body: {
          "id": widget.id,
        },
      ).then((value) {
        var data = jsonDecode(value.body);
        print(data["message"]);
        Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Barang"),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              _onDelete(context);
            },
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Kode Barang', style: TextStyle(fontWeight: FontWeight.bold)),
              TextFormField(controller: kdBrg, decoration: InputDecoration(hintText: "Kode Barang")),
              Text('Nama Barang', style: TextStyle(fontWeight: FontWeight.bold)),
              TextFormField(controller: nmBrg, decoration: InputDecoration(hintText: "Nama Barang")),
              Text('Harga Beli', style: TextStyle(fontWeight: FontWeight.bold)),
              TextFormField(controller: hrjBeli, decoration: InputDecoration(hintText: "Harga Beli")),
              Text('Harga Jual', style: TextStyle(fontWeight: FontWeight.bold)),
              TextFormField(controller: hrjJual, decoration: InputDecoration(hintText: "Harga Jual")),
              Text('Stok', style: TextStyle(fontWeight: FontWeight.bold)),
              TextFormField(controller: stok, decoration: InputDecoration(hintText: "Stok")),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _onUpdate(context);
                  }
                },
                child: Text("Update"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
