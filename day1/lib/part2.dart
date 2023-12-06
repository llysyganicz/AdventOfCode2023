List<int> _getDigits(String line, String number, int start) {
  final index = line.indexOf(number, start);
  if (index == -1)
    return [];
  else {
    final next = _getDigits(line, number, index + 1);
    return [index, ...next];
  }
}

String _toSpelledDigit(int digit) {
  switch (digit) {
    case 1:
      return 'one';
    case 2:
      return 'two';
    case 3:
      return 'three';
    case 4:
      return 'four';
    case 5:
      return 'five';
    case 6:
      return 'six';
    case 7:
      return 'seven';
    case 8:
      return 'eight';
    case 9:
      return 'nine';
    default:
      throw Exception('Invalid digit: $digit');
  }
}

List<(int, int)> _getIndexedSpelledDigits(String line) =>
    List.generate(9, (index) => index + 1)
        .map((e) => (e, _toSpelledDigit(e)))
        .map((e) =>
            _getDigits(line, e.$2, 0).map((index) => (index, e.$1)).toList())
        .expand((element) => element)
        .toList();

List<(int, int)> _getIndexedDigits(String line) =>
    List.generate(9, (index) => index + 1)
        .map((e) => (e, e.toString()))
        .map((e) =>
            _getDigits(line, e.$2, 0).map((index) => (index, e.$1)).toList())
        .expand((element) => element)
        .toList();

int solve(List<String> lines) {
  return lines.map((line) {
    final indexedDigits = _getIndexedDigits(line);
    indexedDigits.addAll(_getIndexedSpelledDigits(line));
    indexedDigits.sort((a, b) => a.$1.compareTo(b.$1));
    final digits = indexedDigits.map((e) => e.$2).toList();
    return digits.first * 10 + digits.last;
  }).fold(0, (previousValue, element) => previousValue + element);
}
