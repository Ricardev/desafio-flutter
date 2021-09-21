import 'package:starwiki/features/characters/domain/entity/people_info_entity.dart';

import 'character_model.dart';

class PeopleInfoModel extends PeopleInfoEntity {
  const PeopleInfoModel({
    required int count,
    required String next,
    required String previous,
    required List<CharacterModel> characters,
  }) : super(
          count: count,
          next: next,
          previous: previous,
          characters: characters,
        );

  factory PeopleInfoModel.fromJson(Map<String, dynamic> json) {
    return PeopleInfoModel(
      count: json['count'],
      next: json['next'] ?? 'last',
      previous: json['previous'] ?? 'first',
      characters: (json['results'] as List)
          .map((dynamic e) => CharacterModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['next'] != null ? next : null;
    data['previous'] != null ? previous : null;
    data['results'] = characters;
    return data;
  }
}
