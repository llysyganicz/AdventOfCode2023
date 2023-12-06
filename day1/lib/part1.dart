bool _isDigit(int rune) {
  return rune >= Runes('0').first && rune <= Runes('9').last;
}

int solve(List<String> lines) {
  return lines.map((line) {
    final digits = line.runes
        .where((rune) => _isDigit(rune))
        .map((e) => String.fromCharCode(e));
    final number = digits.first + digits.last;
    return int.parse(number);
  }).fold(0, (previousValue, element) => previousValue + element);
}
