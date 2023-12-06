import 'package:aoc_input_helper/input_helper.dart';
import 'package:day2/game.dart';
import 'package:day2/part1.dart' as part1;
import 'package:day2/part2.dart' as part2;

void main() async {
  final lines = (await InputHelper.getLines(2023, 2))
      .where((line) => line.isNotEmpty)
      .toList();

  final games = lines.map((line) => Game.parse(line)).toList();

  final result1 = part1.solve(games);
  print('Part 1: $result1');

  final result2 = part2.solve(games);
  print('Part 2: $result2');
}
