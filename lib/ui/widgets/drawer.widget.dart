import 'package:basics_flutter/config/global.params.dart';
import 'package:flutter/material.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.white, Colors.deepOrange])),
              child: Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage("images/logo.jpg"),
                  radius: 50,
                ),
              )),
          ...GlobalParams.menus.map((item) {
            return Column(
              children: [
                ListTile(
                  title: Text('${item['title']}', style: TextStyle(fontSize: 22),),
                  leading: item['icon'],
                  trailing: Icon(Icons.arrow_right, color: Colors.orange,),
                  onTap: (){
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, "${item['route']}");
                  },
                ),
                Divider(height: 4, color: Colors.deepOrange,)
              ],
            );
          })
        ],
      ),
    );
  }
}
