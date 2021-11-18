import 'package:basics_flutter/ui/pages/home.page.dart';
import 'package:flutter/material.dart';

import 'gallery-result.page.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  String query ='';
  TextEditingController textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery de ${query}'),
      ),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(hintText: 'Chercher une place. Ex: Senegal'),
                style: TextStyle(fontSize: 22),
                onChanged: (value){
                  setState(() {
                    query = value;
                  });
                },
                onSubmitted: (value) {
                  query = value;
                  Navigator.push(context, MaterialPageRoute(builder: (context) => GalleryResultPage(query: query,)));
                  textEditingController.text = '';
                },
              )),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => GalleryResultPage(query: query,)));
                  textEditingController.text = '';
                },
                child: Text(
                  'Rechercher',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}
