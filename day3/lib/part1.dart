import 'package:day3/number.dart';

int solve(List<Number> numbers, List<String> lines) => numbers
    .where((n) => n.isPartNumber(lines))
    .fold(0, (previousValue, element) => previousValue + element.value);
