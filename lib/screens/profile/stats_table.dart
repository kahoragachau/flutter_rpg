import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class StatsTable extends StatefulWidget {
  const StatsTable(this.character,{super.key});

  final Character character;
  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Available points

          Container(
            color: AppColors.secondaryColor,
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Icon(Icons.star,
                // Add terniary operator to check if there available points display yellow else grey
                  color: widget.character.points > 0 ? Colors.yellow : Colors.grey
                ),
                const SizedBox(width: 20,),
                const StyledText('Stat points available: '),
                const Expanded(child: SizedBox(width: 20,)),
                StyledHeading(widget.character.points.toString()),
              ],
            ),
          )
        ],
      ),
    );
  }
}