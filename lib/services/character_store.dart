import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/services/firestore_service.dart';

class CharacterStore extends ChangeNotifier {

  final List<Character> _characters = [
  ];

  get characters => _characters;

  // add character
  void addCharacter(Character character) {
    FirestoreService.addCharacter(character);
    _characters.add(character);
    notifyListeners();
  }

  // initially fetch characters
  void fetchCharactersOnce() async {

    // check if characters are empty 
    if(characters.length == 0) {
      final snapshot = await FirestoreService.getCharactersOnce();

      // loop through snapshot docs 
      for(var doc in snapshot.docs) {
        _characters.add(doc.data());
      }
      notifyListeners();
    }
  }
}
