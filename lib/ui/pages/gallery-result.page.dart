import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GalleryResultPage extends StatefulWidget {
  String query;
  String keyPixabay = '24390630-a03c7c83cc1b908d83d993bf1';
  int currentPage = 1;
  int totalPages = 0;
  int pageSize = 20;

  GalleryResultPage({
    required this.query,
  });

  @override
  _GalleryResultPageState createState() => _GalleryResultPageState();
}

class _GalleryResultPageState extends State<GalleryResultPage> {
  dynamic data;
  List<dynamic> hits = [];
  ScrollController scrollController = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        setState(() {
          if (widget.currentPage < widget.totalPages) {
            ++widget.currentPage;
            getData();
          }
        });
      }
    });
  }

  void getData() {
    var url = Uri.parse(
        "https://pixabay.com/api/?key=${widget.keyPixabay}&q=${widget.query}&page=${widget.currentPage}&per_page=${widget.pageSize}");
    print(url);
    http.get(url).then((response) {
      setState(() {
        data = json.decode(response.body);
        //print(data);
        hits.addAll(data['hits']);
        if (data['totalHits'] % widget.pageSize == 0) {
          widget.totalPages = data['totalHits'] ~/ widget.pageSize;
        } else
          widget.totalPages = (data['totalHits'] / widget.pageSize).floor() + 1;
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${widget.query} => ${widget.currentPage} / ${widget.totalPages}'),
        ),
        body: (data == null)
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                controller: scrollController,
                itemCount: (data == null ? 0 : hits.length),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: Card(
                          color: Colors.deepOrange,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                hits[index]['tags'],
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: Card(
                          child: Image.network(hits[index]['webformatURL']),
                        ),
                      )
                    ],
                  );
                }));
  }
}
