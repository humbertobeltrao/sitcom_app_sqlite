import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pet_modulo_02/database.dart';
import 'package:pet_modulo_02/list_sitcoms.dart';
import 'package:pet_modulo_02/sitcom.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(title: 'My Sitcom List'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController txtSitcomName = TextEditingController();
  TextEditingController txtSitcomStreamingService = TextEditingController();
  DatabaseHandler handler = new DatabaseHandler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Sitcoms'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(
                            color: Colors.amber, style: BorderStyle.solid)),
                    hintText: 'Sitcom'),
                controller: txtSitcomName,
                style: const TextStyle(fontSize: 20.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(
                            color: Colors.amber, style: BorderStyle.solid)),
                    hintText: 'Sitcom Streaming Service'),
                controller: txtSitcomStreamingService,
                style: const TextStyle(fontSize: 20.0),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ListSitcoms()));
                },
                child: const Text('Show Sitcom List'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Sitcom sitcom = Sitcom(
              sitcomName: txtSitcomName.text,
              sitcomStreamingService: txtSitcomStreamingService.text);
          handler.insertSitcom(sitcom);
          txtSitcomName.text = '';
          txtSitcomStreamingService.text = '';
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
