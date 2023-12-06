import 'dart:math';

class Number {
  final int value;
  final int index;
  final int line;

  Number(this.value, this.index, this.line);

  bool isPartNumber(List<String> lines) {
    final lineAbove = line > 0 ? _checkLine(lines[line - 1]) : false;
    final lineBelow =
        line < lines.length - 1 ? _checkLine(lines[line + 1]) : false;
    return lineAbove || lineBelow || _checkSides(lines[line]);
  }

  bool _checkLine(String line) {
    final start = max(index - 1, 0);
    final end = min(index + value.toString().length, line.length - 1);
    final sub = line.substring(start, end + 1);
    return sub.runes.any((r) => r != '.'.runes.first);
  }

  bool _checkSides(String line) {
    var start = this.index == 0 ? false : line[this.index - 1] != '.';
    var end = this.index + value.toString().length == line.length
        ? false
        : line[this.index + value.toString().length] != '.';
    return start || end;
  }

  bool isInGearRange(int lastLine, int lineLength, int line, int index) {
    final lineAbove = max(this.line - 1, 0);
    final lineBelow = min(this.line + 1, lastLine);
    final start = max(this.index - 1, 0);
    final end = min(this.index + value.toString().length, lineLength - 1);
    return lineAbove <= line &&
        lineBelow >= line &&
        start <= index &&
        end >= index;
  }
}
