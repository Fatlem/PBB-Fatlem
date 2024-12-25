import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'add.dart';
import 'edit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  List _get = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future _getData() async {
    try {
      final response = await http.get(Uri.parse("http://localhost/latihan/barang_app/list.php"));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _get = data;
        });
      } else {
        print('Gagal memuat data: ${response.statusCode}');
      }
    } catch (e) {
      print('Kesalahan: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Barang'),
      ),
      body: _get.isNotEmpty
          ? ListView.builder(
              itemCount: _get.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_get[index]['nmBrg']),
                  subtitle: Text('Stok: ${_get[index]['stok']}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Edit(id: _get[index]['id']),
                      ),
                    );
                  },
                );
              },
            )
          : const Center(child: Text("Tidak ada data")),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Add()));
        },
      ),
    );
  }
}
