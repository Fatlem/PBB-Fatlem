import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
  // List variable to accommodate all data from the database
  List _get = [];

  // Different colors for different cards
  final _lightColors = [
    Colors.amber.shade300,
    Colors.lightGreen.shade300,
    Colors.lightBlue.shade300,
    Colors.orange.shade300,
    Colors.pinkAccent.shade100,
    Colors.tealAccent.shade100,
  ];

  @override
  void initState() {
    super.initState();
    // Fetch data when the widget is initialized
    _getData();
  }

  Future _getData() async {
    try {
      final response = await http.get(Uri.parse(
          // Gunakan alamat IP lokal Anda
          "http://localhost/latihan/note_app/list.php"));

      // Jika respons berhasil
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // Perbarui state dengan data yang diambil
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
        title: const Text('Note List'),
      ),
      body: _get.isNotEmpty
          // Gunakan masonry grid untuk menampilkan kartu
          ? MasonryGridView.count(
              crossAxisCount: 2,
              itemCount: _get.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      // Navigasi ke halaman edit dan kirim ID catatan
                      MaterialPageRoute(
                        builder: (context) => Edit(
                          id: _get[index]['id'],
                        ),
                      ),
                    );
                  },
                  child: Card(
                    // Berikan warna acak untuk setiap kartu
                    color: _lightColors[index % _lightColors.length],
                    child: Container(
                      // Atur tinggi yang berbeda untuk kartu
                      constraints: BoxConstraints(
                        minHeight: (index % 2 + 1) * 85,
                      ),
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${_get[index]['date']}',
                            style: const TextStyle(color: Colors.black),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '${_get[index]['title']}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: Text(
                "No Data Available",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            // Navigasi ke halaman tambah
            MaterialPageRoute(builder: (context) => const Add()),
          );
        },
      ),
    );
  }
}
