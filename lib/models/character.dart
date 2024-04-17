import 'package:flutter_rpg/models/stats.dart';
import 'package:flutter_rpg/models/vocation.dart';

class Character with Stats {

  // constructor
  Character({
    required this.name,
    required this.slogan,
    required this.vocation,
    required this.id,
  });

  // fields: note that keyword 'final' basically means the value won't change in the future, 
  //         the '_' is used to represent a private field
  final Vocation vocation;
  final String name;
  final String slogan;
  final String id;
  bool _isFav = false;

  // getter, use getters to allow access for _isFav which is a private field

  bool get isFav => _isFav;

  void toggleIsFav() {
    _isFav = !_isFav;
  }
}