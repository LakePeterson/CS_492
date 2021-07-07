import 'package:adventure/adventure.dart';
import 'planetary_system.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:math';
import 'dart:async';

class Adventure {
  PlanetSystem planetarySystem;
  Adventure({required this.planetarySystem});
  String name = '';

  void startAdventure() async {
    Map<String, dynamic> json_file =
        jsonDecode(await getFileContents('bin/planetarySystem.json'));

    List<dynamic> planets = json_file['planets'];

    print('Welcome to the Solar System!\n'
        'There are 9 planets to explore.\n'
        'What is your name?');

    name = stdin.readLineSync().toString();

    print(
        'Nice to meet you, $name. My name is Eliza, I\'m an old friend of Alexa\n'
        'Let\'s go on an adventure!');

    planetDestination(planets);
  }

  Future<String> getFileContents(String file) async {
    var info = '';

    final jsonFile = File(file);

    Stream<String> row =
        jsonFile.openRead().transform(utf8.decoder).transform(LineSplitter());

    await for (var character in row) {
      info += character.toString();
    }

    return info;
  }

  void planetDestination(List<dynamic> planets) {
    String input = '';
    String planetChoice = '';
    String planet = '';
    String description = '';

    print('Shall I randomly choose a planet for you to visit? (Y or N)');

    while (input != 'Y' && input != 'y' && input != 'N' && input != 'n') {
      input = stdin.readLineSync().toString();

      if (input == 'Y' || input == 'y') {
        Random random = new Random();
        int number = random.nextInt(8);

        planet = planets[number]['name'];
        description = planets[number]['description'];

        print('Traveling to $planet...\n'
            'Arrived at $planet. $description');
      } else if (input == 'N' || input == 'n') {
        print('Name the planet you would like to visit.');
        planetChoice = stdin.readLineSync().toString();

        planet = 'null';
        description = 'null';

        planets.forEach((i) {
          if (planetChoice == i['name']) {
            planet = i['name'];
            description = i['description'];
          }
        });

        print('Traveling to $planet...\n'
            'Arrived at $planet. $description');
      } else {
        print('Sorry, I didn\'t get that.');
      }
    }
  }
}
