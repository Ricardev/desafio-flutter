import 'package:starwiki/features/characters/domain/entity/character_entity.dart';

class CharacterModel extends CharacterEntity {
  const CharacterModel({
    required String name,
    required String height,
    required String mass,
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

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      name: json['name'],
      height: json['height'],
      mass: json['mass'],
      hairColor: json['hair_color'],
      skinColor: json['skin_color'],
      eyeColor: json['eye_color'],
      birthYear: json['birth_year'],
      gender: json['gender'],
      homeWorld: json['homeworld'],
      specie:
          (json['species'] as List).map((dynamic e) => e.toString()).toList(),
    );
  }
}
