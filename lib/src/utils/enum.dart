import 'package:supercoder_test/src/utils/exports.dart';

enum CharacterGender {
  boy,
  girl,
  nonBinary;

  String get nameUpper => this == nonBinary ? "Non-Binary" : name.capitalize!;

  static CharacterGender getChar(String name) {
    return CharacterGender.values.firstWhere((e) => e.nameUpper == name);
  }
}

enum CharacterGenderGeneral {
  male,
  female,
  nonBinary;

  String get nameUpper => this == nonBinary ? "Non-Binary" : name.capitalize!;

  static String getChar(String? name) {
    switch (name?.toLowerCase()) {
      case "boy":
        return CharacterGenderGeneral.male.nameUpper;
      case "girl":
        return CharacterGenderGeneral.female.nameUpper;  
      default:
        return CharacterGenderGeneral.nonBinary.nameUpper;
    }
  }

}
