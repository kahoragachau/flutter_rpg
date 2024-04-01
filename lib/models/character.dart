class Character {

  // fields: note that keyword 'final' basically means the value won't change in the future, 
  //         the '_' is used to represent a private field
  final String name;
  final String slogan;
  final String id;
  bool _isFav = false;

  void toggleIsFav() {
    _isFav = !_isFav;
  }
}