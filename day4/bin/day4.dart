import 'package:aoc_input_helper/input_helper.dart';
import 'package:day4/card.dart';
import 'package:day4/part1.dart' as part1;
import 'package:day4/part2.dart' as part2;

void main() async {
  final lines = (await InputHelper.getLines(2023, 4))
      .where((line) => line.isNotEmpty)
      .toList();

  final cards = lines.map((line) => Card.parse(line)).toList();

  final result1 = part1.solve(cards);
  print('Part 1: $result1');

  final result2 = part2.solve(cards);
  print('Part 2: $result2');
}
