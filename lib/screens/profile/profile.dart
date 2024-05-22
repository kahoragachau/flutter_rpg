import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/screens/profile/skill_list.dart';
import 'package:flutter_rpg/screens/profile/stats_table.dart';
import 'package:flutter_rpg/services/character_store.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({
    super.key,
    required this.character,
    });

    final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledTitle(character.name),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            // Basic Info 
            Container(
              padding: const EdgeInsets.all(16),
              color: AppColors.secondaryColor.withOpacity(0.3),
              child: Row(
                children: [
                  Hero(
                    tag: character.id.toString(),
                    child: Image.asset('assets/img/vocations/${character.vocation.image}',
                    width: 140,
                    height: 140,
                    ),
                  ),
                const SizedBox(width: 30,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StyledHeading(character.vocation.title),
                      StyledText(character.vocation.description),
                    ],
                  ),
                )
                ],
              ),
            ),

            // Weapon And ability And Slogan 
            const SizedBox(height: 20,),
            Center(child: Icon(Icons.code, color: AppColors.primaryColor,),),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                color: AppColors.secondaryColor.withOpacity(0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const StyledHeading('Slogan'),
                    StyledText(character.slogan),
                    const SizedBox(height: 10,),

                    const StyledHeading('Weapon of choice'),
                    StyledText(character.vocation.weapon),
                    const SizedBox(height: 10,),

                    const StyledHeading('Unique ability'),
                    StyledText(character.vocation.ability),
                    const SizedBox(height: 10,),
                  ],
                ),
              ),
            ),

            // Stats and skills
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  StatsTable(character),
                  SkillList(character),
                ],
              ),
            ),

            // Save Button
            StyledButton(onPressed: () {

              Provider.of<CharacterStore>(context, listen: false).saveCharacter(character);


              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: const StyledHeading('Charcter was saved.'),
                showCloseIcon: true,
                duration: const Duration(seconds: 2),
                backgroundColor: AppColors.secondaryColor,
              ));
            }, 
            child: const StyledHeading('Save Character')),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
