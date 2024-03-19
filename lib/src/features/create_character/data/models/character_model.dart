class CharacterModel {
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? name;
  final String? firstMessage;
  final String? persona;
  final String? scenario;
  final String? exampleDialogues;
  final String? profileImageUrl;
  final String? backgroundImageUrl;
  final String? style;
  final String? introduce;
  final String? shortIntroduce;
  final int? age;
  final bool? isNsfw;
  final int? voiceId;
  final String? speechUrl;
  final String? creatorId;
  final String? region;
  final String? ageGroup;
  final String? height;

  const CharacterModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.firstMessage,
    this.persona,
    this.scenario,
    this.exampleDialogues,
    this.profileImageUrl,
    this.backgroundImageUrl,
    this.style,
    this.introduce,
    this.shortIntroduce,
    this.age,
    this.isNsfw,
    this.voiceId,
    this.speechUrl,
    this.creatorId,
    this.region,
    this.ageGroup,
    this.height,
  });

  CharacterModel copyWith({
    int? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    String? firstMessage,
    String? persona,
    String? scenario,
    String? exampleDialogues,
    String? profileImageUrl,
    String? backgroundImageUrl,
    String? style,
    String? introduce,
    String? shortIntroduce,
    int? age,
    bool? isNsfw,
    int? voiceId,
    String? speechUrl,
    String? creatorId,
    String? region,
    String? ageGroup,
    String? height,
  }) =>
      CharacterModel(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        name: name ?? this.name,
        firstMessage: firstMessage ?? this.firstMessage,
        persona: persona ?? this.persona,
        scenario: scenario ?? this.scenario,
        exampleDialogues: exampleDialogues ?? this.exampleDialogues,
        profileImageUrl: profileImageUrl ?? this.profileImageUrl,
        backgroundImageUrl: backgroundImageUrl ?? this.backgroundImageUrl,
        style: style ?? this.style,
        introduce: introduce ?? this.introduce,
        shortIntroduce: shortIntroduce ?? this.shortIntroduce,
        age: age ?? this.age,
        isNsfw: isNsfw ?? this.isNsfw,
        voiceId: voiceId ?? this.voiceId,
        speechUrl: speechUrl ?? this.speechUrl,
        creatorId: creatorId ?? this.creatorId,
        region: region ?? this.region,
        ageGroup: ageGroup ?? this.ageGroup,
        height: height ?? this.height,
      );

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        id: json["id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        name: json["name"],
        firstMessage: json["firstMessage"],
        persona: json["persona"],
        scenario: json["scenario"],
        exampleDialogues: json["exampleDialogues"],
        profileImageUrl: json["profileImageUrl"],
        backgroundImageUrl: json["backgroundImageUrl"],
        style: json["style"],
        introduce: json["introduce"],
        shortIntroduce: json["shortIntroduce"],
        age: json["age"],
        isNsfw: json["isNsfw"],
        voiceId: json["voiceId"],
        speechUrl: json["speechUrl"],
        creatorId: json["creatorId"],
        region: json["region"],
        ageGroup: json["ageGroup"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "name": name,
        "firstMessage": firstMessage,
        "persona": persona,
        "scenario": scenario,
        "exampleDialogues": exampleDialogues,
        "profileImageUrl": profileImageUrl,
        "backgroundImageUrl": backgroundImageUrl,
        "style": style,
        "introduce": introduce,
        "shortIntroduce": shortIntroduce,
        "age": age,
        "isNsfw": isNsfw,
        "voiceId": voiceId,
        "speechUrl": speechUrl,
        "creatorId": creatorId,
        "region": region,
        "ageGroup": ageGroup,
        "height": height,
      };
}
