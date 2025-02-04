import 'package:flutter/material.dart';
import 'package:menu_makanan/menu_page.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplikasi Pemesanan Makanan",
      debugShowCheckedModeBanner: false, // Menghilangkan banner "debug" di pojok
      theme: ThemeData(
        primarySwatch: Colors.blue, // Menambahkan tema dasar untuk aplikasi
      ),
      home: MenuPage(),
    );
  }
}
