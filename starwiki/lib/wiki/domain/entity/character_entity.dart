import 'package:equatable/equatable.dart';

class CharacterEntity extends Equatable {
  final String name;
  final int height;
  final int mass;
  final String hairColor;
  final String skinColor;
  final String eyeColor;
  final String birthYear;
  final String gender;
  final String homeWorld;
  final List<String> specie;

  const CharacterEntity({
    required this.name,
    required this.height,
    required this.mass,
    required this.hairColor,
    required this.skinColor,
    required this.eyeColor,
    required this.birthYear,
    required this.gender,
    required this.homeWorld,
    required this.specie,
  });

  @override
  List<Object?> get props => [
        name,
        height,
        mass,
        hairColor,
        skinColor,
        eyeColor,
        birthYear,
        gender,
        homeWorld,
        specie,
      ];
}
