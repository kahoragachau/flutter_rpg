import 'package:flutter_rpg/models/vocation.dart';

class Skill {

  final String id;
  final String name;
  final String image;
  final Vocation vocation;

  Skill({
    required this.id,
    required this.name,
    required this.image,
    required this.vocation
  });
}