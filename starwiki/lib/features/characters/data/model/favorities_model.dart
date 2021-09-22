import 'package:starwiki/features/characters/domain/entity/favorities_entity.dart';

class FavoritiesModel extends FavoritiesEntity {
  const FavoritiesModel({
    required String status,
    required String message,
  }) : super(
          status: status,
          message: message,
        );

  static dynamic fromJson(Map<String, dynamic> json) {
    return FavoritiesModel(
      status: json['status'] ?? json['error'],
      message: json['message'] ?? json['error_message'],
    );
  }
}
