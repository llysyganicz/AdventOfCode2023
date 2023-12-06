import 'package:day2/game.dart';

int solve(List<Game> games) => games
    .map((game) => (game.id, game.getMax()))
    .where((game) =>
        game.$2.red <= 12 && game.$2.green <= 13 && game.$2.blue <= 14)
    .fold(0, (sum, game) => sum + game.$1);
