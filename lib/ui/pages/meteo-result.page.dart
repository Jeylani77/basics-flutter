import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class MeteoResultPage extends StatefulWidget {
  String query = '';
  String keyMap = '40b1433f04deb0b90cab28dc51e252d3';
  MeteoResultPage({required this.query});
  @override
  _MeteoResultPageState createState() => _MeteoResultPageState();
}

class _MeteoResultPageState extends State<MeteoResultPage> {
  dynamic data;
  List<dynamic> list = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() {
    var url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/forecast?q=${widget.query}&appid=${widget.keyMap}");
    print(url);
    http.get(url).then((response) {
      setState(() {
        data = json.decode(response.body);
        //print(data);
        list.addAll(data['list']);
      });
    }).catchError((err) {
      print(err);
    });
  }
  ColorDynamic(index) {
    if (list[index]['weather'][0]['main'].toString().toLowerCase() == 'clouds' ) {
      return Colors.grey;
    } else if(list[index]['weather'][0]['main'].toString().toLowerCase() == 'clear') {
      return Colors.blue;
    } else if(list[index]['weather'][0]['main'].toString().toLowerCase() == 'rain') {
      return Colors.red;
    }else if(list[index]['weather'][0]['main'].toString().toLowerCase() == 'snow') {
      return Colors.black;
    }
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.query}'),
      ),
      body: (data == null)
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: (data == null ? 0 : list.length),
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: ColorDynamic(index),
                              child: Image.network(
                                  'https://openweathermap.org/img/w/${list[index]['weather'][0]['icon'].toString()}.png'),
                              /*backgroundImage: AssetImage(
                              'images/${list[index]['weather'][0]['main'].toString().toLowerCase()}.jpg'),*/
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${new DateFormat('E-dd/MM/yyyy').format(DateTime.fromMicrosecondsSinceEpoch(list[index]['dt'] * 1000000))}',
                                  style: TextStyle(
                                    fontSize: 22,
                                  ),
                                ),
                                Text(
                                  '${new DateFormat('HH:mm').format(DateTime.fromMicrosecondsSinceEpoch(list[index]['dt'] * 1000000))} | '
                                  '${list[index]['weather'][0]['main']}',
                                  style: TextStyle(
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          '${(list[index]['main']['temp'] - 273.15).round()} °C',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: ColorDynamic(index),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
    );
  }


}
