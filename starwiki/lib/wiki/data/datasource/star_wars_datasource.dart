import 'package:starwiki/wiki/data/model/people_info_model.dart';

abstract class StarWarsDatasource {
  Future<PeopleInfoModel> getCharactersFromData();
}
