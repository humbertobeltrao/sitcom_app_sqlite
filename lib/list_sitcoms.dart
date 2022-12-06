import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pet_modulo_02/database.dart';
import 'package:pet_modulo_02/sitcom.dart';

class ListSitcoms extends StatefulWidget {
  const ListSitcoms({Key? key}) : super(key: key);

  @override
  State<ListSitcoms> createState() => _ListSitcomsState();
}

class _ListSitcomsState extends State<ListSitcoms> {
  DatabaseHandler handler = DatabaseHandler();
  @override
  void initState() {
    super.initState();
    handler.initializeDB().whenComplete(() {
      setState(() {
        handler.listSitcoms();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sitcom List'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<Sitcom>>(
            future: handler.listSitcoms(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data![index].sitcomName),
                      subtitle:
                          Text(snapshot.data![index].sitcomStreamingService),
                      leading: const Icon(Icons.movie),
                    );
                  },
                );
              }
              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [Text('No sitcom to be displayed')]);
            }),
      ),
    );
  }

  /*Widget diplaySitcomName(dynamic snapshot, int index) {
    return ListTile(
        title: Text(snapshot.data![index].sitcomName),
        subtitle: Text(snapshot.data![index].sitcomStreamingService),
        leading: const Icon(Icons.movie));
  }*/
}
