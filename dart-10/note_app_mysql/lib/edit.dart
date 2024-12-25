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
  
  // Initialize fields
  var title = TextEditingController();
  var content = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch data when the widget is initialized
    _getData();
  }

  // HTTP to get detail data
  Future _getData() async {
    try {
      final response = await http.get(Uri.parse(
          // Gunakan alamat IP lokal Anda
          "http://localhost/latihan/note_app/detail.php?id=${widget.id}"));

      // If response is successful
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          title = TextEditingController(text: data['title']);
          content = TextEditingController(text: data['content']);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future _onUpdate(BuildContext context) async {
    try {
      return await http.post(
        Uri.parse("http://localhost/latihan/note_app/update.php"),
        body: {
          "id": widget.id,
          "title": title.text,
          "content": content.text,
        },
      ).then((value) {
        // Print message after update to database
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
        Uri.parse("http://localhost/latihan/note_app/delete.php"),
        body: {
          "id": widget.id,
        },
      ).then((value) {
        // Print message after delete from database
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
        title: const Text("Edit Note"),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // Show dialog to confirm delete data
                    return AlertDialog(
                      content: const Text('Are you sure you want to delete this?'),
                      actions: <Widget>[
                        ElevatedButton(
                          child: const Icon(Icons.cancel),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        ElevatedButton(
                          child: const Icon(Icons.check_circle),
                          onPressed: () => _onDelete(context),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(Icons.delete),
            ),
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
              const Text(
                'Title',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              TextFormField(
                controller: title,
                decoration: InputDecoration(
                  hintText: "Type Note Title",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Note Title is Required!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Content',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              TextFormField(
                controller: content,
                keyboardType: TextInputType.multiline,
                minLines: 5,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Type Note Content',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Note Content is Required!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  // Validate
                  if (_formKey.currentState!.validate()) {
                    // Send data to database with this method
                    _onUpdate(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
