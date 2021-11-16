import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gallerie'),),
      body: Center(
        child: Text('Gallery Page', style: Theme.of(context).textTheme.headline4,),
      ),
    );
  }
}
