class Game {
  final int id;
  final List<CubeSet> sets;

  Game(this.id, this.sets);

  factory Game.parse(String input) {
    final split = input.split(':');
    final id = int.parse(split[0].split(' ')[1]);
    final sets = split[1].split(';').map((set) => CubeSet.parse(set)).toList();
    return Game(id, sets);
  }

  CubeSet getMax() {
    var r = 0, g = 0, b = 0;
    sets.forEach((set) {
      r = set.red > r ? set.red : r;
      g = set.green > g ? set.green : g;
      b = set.blue > b ? set.blue : b;
    });

    return CubeSet(r, g, b);
  }
}

class CubeSet {
  final int red;
  final int green;
  final int blue;

  CubeSet(this.red, this.green, this.blue);

  factory CubeSet.parse(String input) {
    var r = 0, g = 0, b = 0;
    input.split(',').forEach((part) {
      final split = part.split(' ').where((e) => e.isNotEmpty).toList();
      final color = split[1];
      final value = int.parse(split[0]);
      switch (color) {
        case 'red':
          r = value;
          break;
        case 'green':
          g = value;
          break;
        case 'blue':
          b = value;
          break;
      }
    });
    return CubeSet(r, g, b);
  }
}
