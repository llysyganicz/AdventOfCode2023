import 'package:day4/card.dart';

int solve(List<Card> cards) {
  return cards.map((card) => card.score).reduce((a, b) => a + b);
}
