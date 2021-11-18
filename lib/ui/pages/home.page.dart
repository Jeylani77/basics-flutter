import 'package:basics_flutter/ui/widgets/drawer.widget.dart';
import 'package:flutter/cupertino.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("Welcome to Flutter Basics App.\n Happy Coding :)",
                  style: Theme.of(context).textTheme.headline5),
            ),
            SizedBox(height: 20,),
            Center(
              child: Text("NB : Open Drawer...",
                  style: TextStyle(fontSize: 22, color: Colors.blue)),
            ),
          ],
        ),
      ),
    );
  }
}
