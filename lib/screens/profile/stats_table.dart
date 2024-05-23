import 'package:flutter/material.dart';
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

  double turns = 0.0;

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
                AnimatedRotation(
                  turns: turns,
                  duration: const Duration(milliseconds: 200),
                  child: Icon(Icons.star,
                  // Add terniary operator to check if there available points display yellow else grey
                    color: widget.character.points > 0 ? Colors.yellow : Colors.grey
                  ),
                ),
                const SizedBox(width: 20,),
                const StyledText('Stat points available: '),
                const Expanded(child: SizedBox(width: 20,)),
                StyledHeading(widget.character.points.toString()),
              ],
            ),
          ),

          // Stats Table
          Table(
            children: widget.character.statsAsFormattedList.map((stat) {
              return TableRow(
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor.withOpacity(0.5),
                ),
                children: [

                  // Stat title
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: StyledHeading(stat['title']!),
                    ),
                  ),

                  // Stat Value
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: StyledHeading(stat['value']!),
                    ),
                  ),

                  // Increase Stat Icon

                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: IconButton(
                      icon: Icon(Icons.arrow_upward, color: AppColors.textColor,),
                      onPressed: () {
                        setState(() {
                          widget.character.increaseStat(stat['title']!);
                          turns += 0.5;
                        });
                      },
                    )
                  ),

                  // Decrease Stat Icon
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: IconButton(
                      icon: Icon(Icons.arrow_downward, color: AppColors.textColor,),
                      onPressed: () {
                        setState(() {
                          widget.character.decreaseStat(stat['title']!);
                          turns -= 0.5;
                        });
                      },
                    ),
                  )
                ]
              );
            }
          ).toList()),
        ],
      ),
    );
  }
}