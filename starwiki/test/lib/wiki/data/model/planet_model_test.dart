import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:starwiki/features/characters/data/model/planet_model.dart';
import 'package:starwiki/features/characters/domain/entity/planet_entity.dart';

import '../../../../mock/planet_mock.dart';

void main() {
  const tPlanetModel = PlanetModel(planetName: 'Umbara');

  test('Tem que ser subclasse PlanetEntity', () {
    expect(tPlanetModel, isA<PlanetEntity>());
  });

  test('Tem que retornar um modelo válido', () {
    final Map<String, dynamic> jsonMap = json.decode(planetMock);
    final result = PlanetModel.fromJson(jsonMap);
    expect(result, tPlanetModel);
  });
}
