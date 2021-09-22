import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:starwiki/features/characters/data/model/specie_model.dart';

import 'package:starwiki/features/characters/domain/entity/specie_entity.dart';

import '../../../../mock/specie_mock.dart';

void main() {
  const tSpecieModel = SpecieModel(specieName: 'Droid');

  test('Tem que ser subclasse SpecieEntity', () {
    expect(tSpecieModel, isA<SpecieEntity>());
  });

  test('Tem que retornar um modelo válido', () {
    final Map<String, dynamic> jsonMap = json.decode(specieMock);
    final result = SpecieModel.fromJson(jsonMap);
    expect(result, tSpecieModel);
  });
}
