import 'package:aoc_input_helper/input_helper.dart';
import 'package:day1/part1.dart' as part1;
import 'package:day1/part2.dart' as part2;

main() async {
  final input = (await InputHelper.getLines(2023, 1))
      .where((line) => line.isNotEmpty)
      .toList();

  final result1 = part1.solve(input);
  print('Part 1: $result1');

  final result2 = part2.solve(input);
  print('Part 2: $result2');
}
