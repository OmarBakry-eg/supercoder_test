import 'package:supercoder_test/src/utils/exports.dart';

class GenerateCharacterProfileImageModel {
  final String? prompt;
  final String? imageUrl;
  final int? numOutputs;
  final String? style;
  final String? gender;

  const GenerateCharacterProfileImageModel({
    this.prompt,
    this.imageUrl,
    this.numOutputs,
    this.style,
    this.gender,
  });

  GenerateCharacterProfileImageModel copyWith({
    String? prompt,
    dynamic imageUrl,
    int? numOutputs,
    String? style,
    String? gender,
  }) =>
      GenerateCharacterProfileImageModel(
        prompt: prompt ?? this.prompt,
        imageUrl: imageUrl ?? this.imageUrl,
        numOutputs: numOutputs ?? this.numOutputs,
        style: style ?? this.style,
        gender: gender ?? this.gender,
      );

  factory GenerateCharacterProfileImageModel.fromJson(
          Map<String, dynamic> json) =>
      GenerateCharacterProfileImageModel(
        prompt: json["prompt"],
        imageUrl: json["imageUrl"],
        numOutputs: json["numOutputs"],
        style: json["style"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "prompt": prompt ?? "woman",
        "imageUrl": imageUrl,
        "numOutputs": numOutputs ?? 6,
        "style": style ?? "anime",
        "gender": CharacterGenderGeneral.getChar(gender),
      };
}
