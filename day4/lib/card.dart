import 'dart:math';

class Card {
  final int id;
  final List<int> winningNumbers;
  final List<int> numbers;

  Card(this.id, this.winningNumbers, this.numbers);

  int get matchingNumbers =>
      Set.of(winningNumbers).intersection(Set.of(numbers)).length;

  int get score => pow(2, matchingNumbers - 1).toInt();

  factory Card.parse(String line) {
    final splittedLine = line.split(':');
    final id = int.parse(splittedLine[0].substring(5));

    final numberParts = splittedLine[1].split('|');
    final winningNumbers = numberParts[0]
        .split(' ')
        .where((n) => n.isNotEmpty)
        .map(int.parse)
        .toList();
    final numbers = numberParts[1]
        .split(' ')
        .where((n) => n.isNotEmpty)
        .map(int.parse)
        .toList();
    return Card(id, winningNumbers, numbers);
  }
}
