// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/screens/create/vocation_card.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {

  final _nameController = TextEditingController();
  final _sloganController =TextEditingController();

  // Dispose name and slogan controller to free up memory
  @override
  void dispose() {
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  // Handle Vocation Selection
  Vocation selectedVocation = Vocation.junkie;

  void updateVocation(Vocation vocation) {
    setState(() {
      selectedVocation = vocation;
    });
  }

  // Submit Character
  void handleSubmit() {
    if(_nameController.text.trim().isEmpty) {
      print("Name must not be empty");
      return;
    }

    if (_sloganController.text.trim().isEmpty) {
      print("Slogan must not be empty");
      return;
    }

    print(_nameController.text);
    print(_sloganController.text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle("Characters Creation"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // welcome message
              Center(
                child: Icon(Icons.code, color: AppColors.primaryColor)
              ),
              const Center(
                child: StyledHeading("Welcome New Player"),
              ),
              const Center(
                child: StyledText("Create a name & slogan for your character."),
              ),
              const SizedBox(height: 30),
          
              // input fields for slogan and name
              TextField(
                controller: _nameController,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                cursorColor: AppColors.textColor,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_2),
                  label: StyledText('Character Name')
                ),
              ),
              const SizedBox(height: 20,),
          
              TextField(
                controller: _sloganController,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium
                ),
                cursorColor: AppColors.textColor,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.chat),
                  label: StyledText("Character Slogan")
                ),
              ),
          
              const SizedBox(height: 30,),
          
              // Select Vocation title
              Center(
                child: Icon(Icons.code, color: AppColors.primaryColor,),
              ),
          
              const Center(
                child: StyledHeading("Choose a vocation"),
              ),
              const Center(
                child: StyledText("This Determines your available skills"),
              ),
          
              const SizedBox(height: 30,),
          
              // Vocation Cards
              VocationCard(
                selected: selectedVocation == Vocation.junkie,
                onTap: updateVocation,
                vocation: Vocation.junkie,
              ),
          
              VocationCard(
                selected: selectedVocation == Vocation.ninja,
                onTap: updateVocation,
                vocation: Vocation.ninja,
              ),
          
              VocationCard(
                selected: selectedVocation == Vocation.raider,
                onTap: updateVocation,
                vocation: Vocation.raider,
              ),
          
              VocationCard(
                selected: selectedVocation == Vocation.wizard,
                onTap: updateVocation,
                vocation: Vocation.wizard,
              ),
          
              // Create Character Button 
          
              Center(
                child: StyledButton(
                    onPressed: handleSubmit, 
                    child: const StyledHeading('Create Character'),
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
