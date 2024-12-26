import 'package:flutter/material.dart';

import 'database/db_helper.dart';
import 'model/contact.dart';

class FormKontak extends StatefulWidget {
  final Kontak? kontak;

  FormKontak({this.kontak});

  @override
  State<FormKontak> createState() => _FormKontakState();
}

class _FormKontakState extends State<FormKontak> {
  DbHelper db = DbHelper();

  TextEditingController? name;
  TextEditingController? mobileNo;
  TextEditingController? email;
  TextEditingController? company;

  @override
  void initState() {
    super.initState();
    name = TextEditingController(
      text: widget.kontak == null ? '' : widget.kontak!.name,
    );
    mobileNo = TextEditingController(
      text: widget.kontak == null ? '' : widget.kontak!.mobileNo,
    );
    email = TextEditingController(
      text: widget.kontak == null ? '' : widget.kontak!.email,
    );
    company = TextEditingController(
      text: widget.kontak == null ? '' : widget.kontak!.company,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Kontak'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Input Name
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TextField(
              controller: name,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          // Input Mobile No
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TextField(
              controller: mobileNo,
              decoration: InputDecoration(
                labelText: 'Mobile No',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          // Input Email
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TextField(
              controller: email,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          // Input Company
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TextField(
              controller: company,
              decoration: InputDecoration(
                labelText: 'Company',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          // Submit Button
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ElevatedButton(
              child: Text(
                widget.kontak == null ? 'Add' : 'Update',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                upsertKontak();
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> upsertKontak() async {
    if (widget.kontak != null) {
      // Update
      await db.updateKontak(
        Kontak.fromMap({
          'id': widget.kontak!.id,
          'name': name!.text,
          'mobileNo': mobileNo!.text,
          'email': email!.text,
          'company': company!.text,
        }),
      );
      Navigator.pop(context, 'update');
    } else {
      // Insert
      await db.saveKontak(
        Kontak(
          name: name!.text,
          mobileNo: mobileNo!.text,
          email: email!.text,
          company: company!.text,
        ),
      );
      Navigator.pop(context, 'save');
    }
  }
}
