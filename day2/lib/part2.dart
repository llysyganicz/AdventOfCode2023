import 'package:day2/game.dart';

int solve(List<Game> games) => games.map((game) {
      final set = game.getMax();
      return set.red * set.green * set.blue;
    }).fold(0, (sum, game) => sum + game);
