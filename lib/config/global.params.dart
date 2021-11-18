import 'package:flutter/material.dart';

class GlobalParams {
  static List<Map<String, dynamic>> menus = [
  {"title" : "Compteur", "icon" : Icon(Icons.home, color: Colors.blue,), "route" : "/counter"},
    {"title" : "Meteo", "icon" : Icon(Icons.map, color: Colors.blue,), "route" : "/meteo"},
    {"title" : "Galerie", "icon" : Icon(Icons.camera, color: Colors.blue,), "route" : "/gallery"},
  ];
}