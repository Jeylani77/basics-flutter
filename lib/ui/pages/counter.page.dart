import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Compteur')),
      body: Center(
        child: Text('Valeur Compteur : ${counter}',
          style: TextStyle(fontSize: 22, color: Colors.blue),),

      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
              setState(() {
                --counter;
              });
            },
          ),
          SizedBox(height: 10,),
          
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              setState(() {
                ++counter;
              });
            },
          ),
        ],
      )
    );
  }
}
