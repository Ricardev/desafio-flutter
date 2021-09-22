import 'package:starwiki/features/characters/domain/entity/planet_entity.dart';

class PlanetModel extends PlanetEntity {
  const PlanetModel({
    required String planetName,
  }) : super(
          planetName: planetName,
        );

  static dynamic fromJson(Map<String, dynamic> json) {
    return PlanetModel(
      planetName: json['name'],
    );
  }
}
