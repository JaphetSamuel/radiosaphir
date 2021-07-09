import 'dart:convert';

import 'package:get/get.dart';

class EmissionProvider extends GetConnect {
  final baseUrl = "http://radiosaphir.net/wp-json/wp/v2/emissions";

  List emissions = [
    {'nom': "Valeur d'ici", "image": "2.jpg"},
    {'nom': "Table ronde", "image": "4.jpg"},
    {'nom': "Educ +", "image": "5.jpg"},
    {'nom': "Santé", "image": "6.jpg"},
    {'nom': "Matinal Maida", "image": "7.jpg"},
    {'nom': "Saphir Culture", "image": "8.jpg"},
  ];

  List<dynamic> getAll() {
    return this.emissions;
  }
}
