import 'package:starwiki/wiki/domain/entity/character_entity.dart';

class CharacterModel extends CharacterEntity {
  const CharacterModel({
    required String name,
    required int height,
    required int mass,
    required String hairColor,
    required String skinColor,
    required String eyeColor,
    required String birthYear,
    required String gender,
    required String homeWorld,
    required List<String> specie,
  }) : super(
          name: name,
          height: height,
          mass: mass,
          hairColor: hairColor,
          skinColor: skinColor,
          eyeColor: eyeColor,
          birthYear: birthYear,
          gender: gender,
          homeWorld: homeWorld,
          specie: specie,
        );
}
