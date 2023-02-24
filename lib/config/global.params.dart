import 'package:flutter/material.dart';

class GlobalParams {
  static List<Map<String, dynamic>> menus = [
    {
      "title": "Accueil",
      "icon": Icon(
        Icons.home,
        color: Colors.blue,
      ),
      "route": "/home"
    },
    {
      "title": "Méteo",
      "icon": Icon(
        Icons.sunny_snowing,
        color: Colors.blue,
      ),
      "route": "/meteo"
    },
    {
      "title": "Gallerie",
      "icon": Icon(
        Icons.photo,
        color: Colors.blue,
      ),
      "route": "/gallerie"
    },
    {
      "title": "Pays",
      "icon": Icon(
        Icons.location_city,
        color: Colors.blue,
      ),
      "route": "/pays"
    },
    {
      "title": "Contact",
      "icon": Icon(
        Icons.contact_page,
        color: Colors.blue,
      ),
      "route": "/contact"
    },
    {
      "title": "Paramétres",
      "icon": Icon(
        Icons.settings,
        color: Colors.blue,
      ),
      "route": "/parametres"
    },
    {
      "title": "Déconnexion",
      "icon": Icon(
        Icons.logout,
        color: Colors.blue,
      ),
      "route": "/authentification"
    },
  ];
  static List<Map<String, dynamic>> accueil = [
    {
      "image": 'https://cdn-icons-png.flaticon.com/512/552/552448.png',
      "route": "/meteo"
    },
    {
      "image": 'https://cdn-icons-png.flaticon.com/512/1375/1375106.png',
      "route": "/gallerie"
    },
    {
      "image": 'https://cdn-icons-png.flaticon.com/128/2947/2947656.png',
      "route": "/pays"
    },
    {
      "image": 'https://cdn-icons-png.flaticon.com/512/1687/1687031.png',
      "route": "/contact"
    },
    {
      "image": 'https://cdn-icons-png.flaticon.com/512/126/126472.png',
      "route": "/parametres"
    },
    {
      "image": 'https://cdn-icons-png.flaticon.com/512/2767/2767155.png',
      "route": "/authentification"
    },
  ];
}
