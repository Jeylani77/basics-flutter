import 'package:basics_flutter/ui/pages/counter.page.dart';
import 'package:basics_flutter/ui/pages/gallery.page.dart';
import 'package:basics_flutter/ui/pages/home.page.dart';
import 'package:basics_flutter/ui/pages/meteo.page.dart';
import 'package:basics_flutter/ui/pages/quizz.page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/" : (context) => HomePage(),
        "/meteo" : (context) => MeteoPage(),
        "/gallery" : (context) => GalleryPage(),
        "/counter" : (context) => CounterPage(),
        "/quizz" : (context) => QuizzPage(),
      },
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: "/",
    );
  }
}



