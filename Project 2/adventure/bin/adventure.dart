import 'package:adventure/adventure.dart';
import 'package:adventure/source/planetary_system.dart';

void main(List<String> arguments) {
  Adventure(planetarySystem: PlanetSystem(systemName: 'Solar System'))
      .startAdventure();
}
