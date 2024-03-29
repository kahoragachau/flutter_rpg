import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rpg/screens/home/character_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List characters = ['Mario', 'Luigi', 'Peach', 'Toad', 'Bowser', 'Koopa'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Characters"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text("Character List"),
            Expanded(
              child: ListView.builder(
                itemCount: characters.length,
                itemBuilder: (_, index) {
                  return const CharacterCard();
                },
              ),
            ),
            FilledButton(
              onPressed: () {}, 
              child: const Text("Create New")
              ),
          ],
        ),
      ),
    );
  }
}