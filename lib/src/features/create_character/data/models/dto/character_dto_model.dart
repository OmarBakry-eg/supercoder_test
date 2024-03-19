class CharacterDtoModel {
  final String? name;
  final String? firstMessage;
  final String? scenario;
  final String? exampleDialogues;
  final String? profileImageUrl;
  final String? backgroundImageUrl;
  final String? style;
  final String? introduce;
  final bool? isNsfw;
  final int? voiceId;
  final String? description;
  final String? tags;
  final String? visibility;
  final String? gender;
  final String? region;
  final String? ageGroup;
  final String? height;
  final String? occupation;

  const CharacterDtoModel({
    this.name,
    this.firstMessage,
    this.scenario,
    this.exampleDialogues,
    this.profileImageUrl,
    this.backgroundImageUrl,
    this.style,
    this.introduce,
    this.isNsfw,
    this.voiceId,
    this.description,
    this.tags,
    this.visibility,
    this.gender,
    this.region,
    this.ageGroup,
    this.height,
    this.occupation,
  });

  CharacterDtoModel copyWith({
    String? name,
    String? firstMessage,
    String? scenario,
    String? exampleDialogues,
    String? profileImageUrl,
    String? backgroundImageUrl,
    String? style,
    String? introduce,
    bool? isNsfw,
    int? voiceId,
    String? description,
    String? tags,
    String? visibility,
    String? gender,
    String? region,
    String? ageGroup,
    String? height,
    String? occupation,
  }) =>
      CharacterDtoModel(
        name: name ?? this.name,
        firstMessage: firstMessage ?? this.firstMessage,
        scenario: scenario ?? this.scenario,
        exampleDialogues: exampleDialogues ?? this.exampleDialogues,
        profileImageUrl: profileImageUrl ?? this.profileImageUrl,
        backgroundImageUrl: backgroundImageUrl ?? this.backgroundImageUrl,
        style: style ?? this.style,
        introduce: introduce ?? this.introduce,
        isNsfw: isNsfw ?? this.isNsfw,
        voiceId: voiceId ?? this.voiceId,
        description: description ?? this.description,
        tags: tags ?? this.tags,
        visibility: visibility ?? this.visibility,
        gender: gender ?? this.gender,
        region: region ?? this.region,
        ageGroup: ageGroup ?? this.ageGroup,
        height: height ?? this.height,
        occupation: occupation ?? this.occupation,
      );

  factory CharacterDtoModel.fromJson(Map<String, dynamic> json) =>
      CharacterDtoModel(
        name: json["name"],
        firstMessage: json["firstMessage"],
        scenario: json["scenario"],
        exampleDialogues: json["exampleDialogues"],
        profileImageUrl: json["profileImageUrl"],
        backgroundImageUrl: json["backgroundImageUrl"],
        style: json["style"],
        introduce: json["introduce"],
        isNsfw: json["isNsfw"],
        voiceId: json["voiceId"],
        description: json["description"],
        tags: json["tags"],
        visibility: json["visibility"],
        gender: json["gender"],
        region: json["region"],
        ageGroup: json["ageGroup"],
        height: json["height"],
        occupation: json["occupation"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "firstMessage": firstMessage,
        "scenario": scenario,
        "exampleDialogues": exampleDialogues,
        "profileImageUrl": profileImageUrl,
        "backgroundImageUrl": backgroundImageUrl,
        "style": style,
        "introduce": introduce,
        "isNsfw": isNsfw,
        "voiceId": voiceId,
        "description": description,
        "tags": tags,
        "visibility": visibility,
        "gender": gender,
        "region": region,
        "ageGroup": ageGroup,
        "height": height,
        "occupation": occupation,
      };
}