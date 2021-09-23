class TableNames {
  static const String favorites = 'favorites';
}

class CreateTableQueries {
  static const String favorites = "CREATE TABLE ${TableNames.favorites} ("
      "insercaoId INTEGER PRIMARY KEY AUTOINCREMENT, "
      "id TEXT NOT NULL, "
      "height TEXT, "
      "hair_color TEXT, "
      "skin_color TEXT, "
      "eye_color TEXT, "
      "birth_year TEXT, "
      "gender TEXT"
      ")";
}
