import 'package:flutter/material.dart';
import '../database/database_helper.dart';

class Payment extends StatefulWidget {
  final double totalAmount;

  Payment({required this.totalAmount});

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _processPayment() async {
    String name = _nameController.text;

    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Silakan isi nama'), backgroundColor: Colors.red),
      );
      return;
    }

    DatabaseHelper dbHelper = DatabaseHelper();
    await dbHelper.insertPayment({
      'name': name,
      'total': widget.totalAmount,
      'created_at': DateTime.now().toString(),
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Pembayaran berhasil!'), backgroundColor: Colors.green),
    );

    Navigator.pushReplacementNamed(context, '/thankyou');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pembayaran')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Nama')),
            SizedBox(height: 20),
            Text('Total Harga: Rp ${widget.totalAmount.toStringAsFixed(2)}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _processPayment, child: Text('Bayar')),
          ],
        ),
      ),
    );
  }
}
