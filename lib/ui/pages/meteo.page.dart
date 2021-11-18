import 'package:basics_flutter/ui/pages/meteo-result.page.dart';
import 'package:flutter/material.dart';

class MeteoPage extends StatefulWidget {
  const MeteoPage({Key? key}) : super(key: key);

  @override
  State<MeteoPage> createState() => _MeteoPageState();
}

class _MeteoPageState extends State<MeteoPage> {
  String query ='';
  TextEditingController textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meteo de ${query}'),
      ),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(hintText: 'Taper une ville'),
                style: TextStyle(fontSize: 22),
                onChanged: (value){
                  setState(() {
                    query = value;
                  });
                },
                onSubmitted: (value) {
                  query = value;
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MeteoResultPage(query: query,)));
                  textEditingController.text = '';
                },
              )),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MeteoResultPage(query: query,)));
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
