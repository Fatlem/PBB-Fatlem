import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Dashboard')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // Navigasi ke halaman kelola produk
              Navigator.pushNamed(context, '/manage_products'); // Ganti dengan rute yang sesuai
            },
            child: Text('Kelola Produk'),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigasi ke halaman kelola konsumen
              Navigator.pushNamed(context, '/manage_customers'); // Ganti dengan rute yang sesuai
            },
            child: Text('Kelola Konsumen'),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigasi ke laporan penjualan
              Navigator.pushNamed(context, '/sales_report'); // Ganti dengan rute yang sesuai
            },
            child: Text('Laporan Penjualan'),
          ),
        ],
      ),
    );
  }
}
