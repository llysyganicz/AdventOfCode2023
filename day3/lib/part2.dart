import 'package:day3/number.dart';

List<int> _getGears(String line, int start) {
  final index = line.indexOf('*', start);
  if (index == -1) {
    return [];
  } else {
    return [index, ..._getGears(line, index + 1)];
  }
}

int solve(List<Number> numbers, List<String> lines) {
  final gears = lines.indexed
      .map((line) => _getGears(line.$2, 0).map((e) => (line.$1, e)))
      .expand((element) => element)
      .toList();
  return gears.fold(0, (previousValue, g) {
    final parts = numbers
        .where((n) =>
            n.isInGearRange(lines.length - 1, lines[g.$1].length, g.$1, g.$2))
        .toList();
    if (parts.length == 2) {
      return previousValue + parts[0].value * parts[1].value;
    } else {
      return previousValue;
    }
  });
}
