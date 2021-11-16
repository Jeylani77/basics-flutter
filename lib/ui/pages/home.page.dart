import 'package:basics_flutter/ui/widgets/drawer.widget.dart';
import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text("Home Page", style: Theme.of(context).textTheme.headline4),
      ),
    );
  }
}