class CharacterProfileImageModel {
  final List<String>? result;

  const CharacterProfileImageModel({
    this.result,
  });

  CharacterProfileImageModel copyWith({
    List<String>? result,
  }) =>
      CharacterProfileImageModel(
        result: result ?? this.result,
      );

  factory CharacterProfileImageModel.fromJson(Map<String, dynamic> json) =>
      CharacterProfileImageModel(
        result: json["result"] == null
            ? []
            : List<String>.from(json["result"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "result":
            result == null ? [] : List<dynamic>.from(result!.map((x) => x)),
      };
}
