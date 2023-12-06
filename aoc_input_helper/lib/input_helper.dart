import 'dart:io';

import 'package:http/http.dart' as http;

class InputHelper {
  static String _getSessionId() {
    final env = Platform.environment;
    if (env.containsKey('AOC_SESSION_ID')) {
      return env['AOC_SESSION_ID']!;
    } else {
      throw Exception('AOC_SESSION_ID environment variable not set');
    }
  }

  static Future<String> getInput(int year, int day) async {
    var client = http.Client();
    final headers = Map<String, String>();
    headers['Cookie'] = 'session=${_getSessionId()}';
    return await client.read(
        Uri.parse('https://adventofcode.com/$year/day/$day/input'),
        headers: headers);
  }

  static Future<List<String>> getLines(int year, int day) async {
    var input = await getInput(year, day);
    return input.split('\n');
  }
}
