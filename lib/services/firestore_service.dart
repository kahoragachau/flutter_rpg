import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rpg/models/character.dart';

class FirestoreService {

  static final ref = FirebaseFirestore.instance
  .collection('characters')
  .withConverter(
    fromFirestore: Character.fromFirestore, 
    toFirestore: (Character c, _) => c.toFirestore()
  );
  
  // Add a new Character
  static Future<void> addCharacter(Character character) async{
    await ref.doc(character.id).set(character);
  }

  // fetch characters from firestore
  static Future<QuerySnapshot<Character>> getCharactersOnce() {
    return ref.get();
  }

}
