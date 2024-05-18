import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rpg/models/skill.dart';
import 'package:flutter_rpg/models/stats.dart';
import 'package:flutter_rpg/models/vocation.dart';

class Character with Stats {

  // constructor
  Character({
    required this.id,
    required this.name,
    required this.vocation,
    required this.slogan,
  });

  // fields: note that keyword 'final' basically means the value won't change in the future, 
  //         the '_' is used to represent a private field'
  final Set<Skill> skills ={};
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

  void updateSkill(Skill skill) {
    // since we want only one skill to be available we will clear the set
    skills.clear();
    skills.add(skill);
  }

// Below we are serializing and deserializing to and from firestore
  // Character to Firestore (map)
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'slogan': slogan,
      'isFav': _isFav,
      'vocation': vocation.toString(),
      'skills': skills.map((e) => e.id).toList(),
      'stats': statsAsMap,
      'points': points,
    };
  }

  // Character from Firestore
  factory Character.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options
  ) {
    // get data from snapshot
    final data = snapshot.data()!;

    // Make character instance
    Character character = Character(
      name: data['name'],
      slogan: data['slogan'],
      id: snapshot.id,
      vocation: Vocation.values.firstWhere((element) => element.toString() == data['vocation'])
    );

    // update skills
    for (String id in data['skills']) {
      Skill skill = allSkills.firstWhere((element) => element.id == id);
      character.updateSkill(skill);
    }

    // set isFav
    if(data['isFav'] == true) {
      character.toggleIsFav();
    }

    // Assign Stats & Points
    character.setStats(points: data['points'], stats: data['stats']);

    return character;
  }
}

// Character Dummy Data
List<Character> characters = [
  Character(id: "1", name: "Klara", vocation: Vocation.wizard, slogan: "Kapumf!"),
  Character(id: "2", name: "Johnny", vocation: Vocation.junkie, slogan: "Light me up..."),
  Character(id: "3", name: "Crimson", vocation: Vocation.raider, slogan: "Fire in the hole!"),
  Character(id: "4", name: "Shaun", vocation: Vocation.ninja, slogan: "Alright then gang.")
];

