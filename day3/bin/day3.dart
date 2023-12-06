import 'package:aoc_input_helper/input_helper.dart';
import 'package:day3/number.dart';
import 'package:day3/part1.dart' as part1;
import 'package:day3/part2.dart' as part2;

void main() async {
  final lines =
      (await InputHelper.getLines(2023, 3)).where((l) => l.isNotEmpty).toList();

  final numbers = lines.indexed
      .map((e) => getNumbers(e.$2, e.$1))
      .expand((element) => element)
      .toList();

  final result1 = part1.solve(numbers, lines);
  print('Part 1: $result1');

  final result2 = part2.solve(numbers, lines);
  print('Part 2: $result2');
}

List<Number> getNumbers(String line, int lineNumber) {
  final numberRegex = RegExp(r'(\d+)');
  final matches = numberRegex.allMatches(line);
  return matches
      .map((match) =>
          Number(int.parse(match[1] ?? '0'), match.start, lineNumber))
      .toList();
}
