import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';

class Heart extends StatefulWidget {
  const Heart({super.key, required this.character});

  final Character character;

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200,),
      vsync: this
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.favorite, color: Colors.grey[800],),
      onPressed: () {
        widget.character.toggleIsFav();
      },
    );
  }
}