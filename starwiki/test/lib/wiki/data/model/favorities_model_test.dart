import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:starwiki/features/characters/data/model/favorities_model.dart';
import 'package:starwiki/features/characters/domain/entity/favorities_entity.dart';

import '../../../../mock/favorities_error_mock.dart';
import '../../../../mock/favorities_sucess_mock.dart';

void main() {
  const tFavoriteModelSucess = FavoritiesModel(
    message: 'May the force be with you',
    status: 'success',
  );
  const tFavoriteModelError = FavoritiesModel(
      status: 'internal error',
      message: 'Only at the end do you realize the power of the Dark Side.');

  test('Tem que ser subclasse FavoritiesEntity no sucesso', () {
    expect(tFavoriteModelSucess, isA<FavoritiesEntity>());
  });

  test('Tem que ser subclasse FavoritiesEntity no error', () {
    expect(tFavoriteModelError, isA<FavoritiesEntity>());
  });

  test('Tem que retornar um modelo válido para FavoritiesEntity no error',
      () {
    final Map<String, dynamic> jsonMap = json.decode(favoritiesMockError);
    final result = FavoritiesModel.fromJson(jsonMap);
    expect(result, tFavoriteModelError);
  });

  test('Tem que retornar um modelo válido para FavoritiesEntity no sucesso', () {
    final Map<String, dynamic> jsonMap = json.decode(favoritiesMockSucess);
    final result = FavoritiesModel.fromJson(jsonMap);
    expect(result, tFavoriteModelSucess);
  });
}
