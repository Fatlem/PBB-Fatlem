import 'package:flutter/material.dart';
import '../database/database_helper.dart';

class Purchase {
  final int id;
  final double total;

  Purchase({required this.id, required this.total});
}

class PurchaseHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('History Belanja')),
      body: FutureBuilder<List<Purchase>>(
        future: DatabaseHelper().getPurchaseHistory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Tidak ada riwayat belanja.'));
          }

          final purchases = snapshot.data!;
          return ListView.builder(
            itemCount: purchases.length,
            itemBuilder: (context, index) {
              final purchase = purchases[index];
              return ListTile(
                title: Text('Order ID: ${purchase.id}'),
                subtitle: Text('Total: Rp ${purchase.total.toStringAsFixed(2)}'),
                onTap: () {
                  // You can add functionality here if needed
                },
              );
            },
          );
        },
      ),
    );
  }
}
