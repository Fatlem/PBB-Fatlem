import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  final _formKey = GlobalKey<FormState>();
  
  var kdBrg = TextEditingController();
  var nmBrg = TextEditingController();
  var hrjBeli = TextEditingController();
  var hrjJual = TextEditingController();
  var stok = TextEditingController();

  Future _onSubmit() async {
    try {
      return await http.post(
        Uri.parse("http://localhost/latihan/barang_app/create.php"),
        body: {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Barang"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(20.0),
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
                    _onSubmit();
                  }
                },
                child: Text("Simpan"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
