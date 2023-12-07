import 'package:day4/card.dart';

int solve(List<Card> cards) {
  final cardsCount =
      Map<int, int>.fromIterable(cards, key: (c) => c.id, value: ((_) => 1));

  for (var card in cards) {
    var nextCards = card.matchingNumbers;
    while (nextCards > 0) {
      final index = card.id + nextCards - 1;
      cardsCount[index] = cardsCount[index]! + 1 * cardsCount[card.id - 1]!;
      --nextCards;
    }
  }

  return cardsCount.values.reduce((value, element) => value + element);
}
