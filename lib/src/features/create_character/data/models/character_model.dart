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
    final dynamic age;
    final bool? isNsfw;
    final int? voiceId;
    final CharacterInfo? characterInfo;
    final int? modelConfigId;
    final String? speechUrl;
    final dynamic creatorId;
    final String? visibility;
    final String? gender;
    final dynamic creatorsNote;
    final dynamic description;
    final dynamic region;
    final dynamic ageGroup;
    final dynamic height;
    final dynamic occupation;
    final List<CharacterTag>? characterTag;
    final dynamic creator;
    final dynamic creatorInfo;
    final int? chatCount;
    final int? recentChatCount;
    final int? favoriteCount;
    final int? participantCount;
    final List<Tag>? tags;
    final bool? isFavorite;

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
        this.characterInfo,
        this.modelConfigId,
        this.speechUrl,
        this.creatorId,
        this.visibility,
        this.gender,
        this.creatorsNote,
        this.description,
        this.region,
        this.ageGroup,
        this.height,
        this.occupation,
        this.characterTag,
        this.creator,
        this.creatorInfo,
        this.chatCount,
        this.recentChatCount,
        this.favoriteCount,
        this.participantCount,
        this.tags,
        this.isFavorite,
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
        dynamic age,
        bool? isNsfw,
        int? voiceId,
        CharacterInfo? characterInfo,
        int? modelConfigId,
        String? speechUrl,
        dynamic creatorId,
        String? visibility,
        String? gender,
        dynamic creatorsNote,
        dynamic description,
        dynamic region,
        dynamic ageGroup,
        dynamic height,
        dynamic occupation,
        List<CharacterTag>? characterTag,
        dynamic creator,
        dynamic creatorInfo,
        int? chatCount,
        int? recentChatCount,
        int? favoriteCount,
        int? participantCount,
        List<Tag>? tags,
        bool? isFavorite,
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
            characterInfo: characterInfo ?? this.characterInfo,
            modelConfigId: modelConfigId ?? this.modelConfigId,
            speechUrl: speechUrl ?? this.speechUrl,
            creatorId: creatorId ?? this.creatorId,
            visibility: visibility ?? this.visibility,
            gender: gender ?? this.gender,
            creatorsNote: creatorsNote ?? this.creatorsNote,
            description: description ?? this.description,
            region: region ?? this.region,
            ageGroup: ageGroup ?? this.ageGroup,
            height: height ?? this.height,
            occupation: occupation ?? this.occupation,
            characterTag: characterTag ?? this.characterTag,
            creator: creator ?? this.creator,
            creatorInfo: creatorInfo ?? this.creatorInfo,
            chatCount: chatCount ?? this.chatCount,
            recentChatCount: recentChatCount ?? this.recentChatCount,
            favoriteCount: favoriteCount ?? this.favoriteCount,
            participantCount: participantCount ?? this.participantCount,
            tags: tags ?? this.tags,
            isFavorite: isFavorite ?? this.isFavorite,
        );

    factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        id: json["id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
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
        characterInfo: json["characterInfo"] == null ? null : CharacterInfo.fromJson(json["characterInfo"]),
        modelConfigId: json["modelConfigId"],
        speechUrl: json["speechUrl"],
        creatorId: json["creatorId"],
        visibility: json["visibility"],
        gender: json["gender"],
        creatorsNote: json["creatorsNote"],
        description: json["description"],
        region: json["region"],
        ageGroup: json["ageGroup"],
        height: json["height"],
        occupation: json["occupation"],
        characterTag: json["CharacterTag"] == null ? [] : List<CharacterTag>.from(json["CharacterTag"]!.map((x) => CharacterTag.fromJson(x))),
        creator: json["creator"],
        creatorInfo: json["creatorInfo"],
        chatCount: json["chatCount"],
        recentChatCount: json["recentChatCount"],
        favoriteCount: json["favoriteCount"],
        participantCount: json["participantCount"],
        tags: json["tags"] == null ? [] : List<Tag>.from(json["tags"]!.map((x) => Tag.fromJson(x))),
        isFavorite: json["isFavorite"],
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
        "characterInfo": characterInfo?.toJson(),
        "modelConfigId": modelConfigId,
        "speechUrl": speechUrl,
        "creatorId": creatorId,
        "visibility": visibility,
        "gender": gender,
        "creatorsNote": creatorsNote,
        "description": description,
        "region": region,
        "ageGroup": ageGroup,
        "height": height,
        "occupation": occupation,
        "CharacterTag": characterTag == null ? [] : List<dynamic>.from(characterTag!.map((x) => x.toJson())),
        "creator": creator,
        "creatorInfo": creatorInfo,
        "chatCount": chatCount,
        "recentChatCount": recentChatCount,
        "favoriteCount": favoriteCount,
        "participantCount": participantCount,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x.toJson())),
        "isFavorite": isFavorite,
    };
}

class CharacterInfo {
    final String? name;
    final List<dynamic>? tags;
    final String? creator;
    final String? scenario;
    final String? firstMes;
    final Extensions? extensions;
    final String? description;
    final String? mesExample;
    final String? personality;
    final String? creatorNotes;
    final String? systemPrompt;
    final String? characterVersion;
    final List<dynamic>? alternateGreetings;
    final String? postHistoryInstructions;

    CharacterInfo({
        this.name,
        this.tags,
        this.creator,
        this.scenario,
        this.firstMes,
        this.extensions,
        this.description,
        this.mesExample,
        this.personality,
        this.creatorNotes,
        this.systemPrompt,
        this.characterVersion,
        this.alternateGreetings,
        this.postHistoryInstructions,
    });

    CharacterInfo copyWith({
        String? name,
        List<dynamic>? tags,
        String? creator,
        String? scenario,
        String? firstMes,
        Extensions? extensions,
        String? description,
        String? mesExample,
        String? personality,
        String? creatorNotes,
        String? systemPrompt,
        String? characterVersion,
        List<dynamic>? alternateGreetings,
        String? postHistoryInstructions,
    }) => 
        CharacterInfo(
            name: name ?? this.name,
            tags: tags ?? this.tags,
            creator: creator ?? this.creator,
            scenario: scenario ?? this.scenario,
            firstMes: firstMes ?? this.firstMes,
            extensions: extensions ?? this.extensions,
            description: description ?? this.description,
            mesExample: mesExample ?? this.mesExample,
            personality: personality ?? this.personality,
            creatorNotes: creatorNotes ?? this.creatorNotes,
            systemPrompt: systemPrompt ?? this.systemPrompt,
            characterVersion: characterVersion ?? this.characterVersion,
            alternateGreetings: alternateGreetings ?? this.alternateGreetings,
            postHistoryInstructions: postHistoryInstructions ?? this.postHistoryInstructions,
        );

    factory CharacterInfo.fromJson(Map<String, dynamic> json) => CharacterInfo(
        name: json["name"],
        tags: json["tags"] == null ? [] : List<dynamic>.from(json["tags"]!.map((x) => x)),
        creator: json["creator"],
        scenario: json["scenario"],
        firstMes: json["first_mes"],
        extensions: json["extensions"] == null ? null : Extensions.fromJson(json["extensions"]),
        description: json["description"],
        mesExample: json["mes_example"],
        personality: json["personality"],
        creatorNotes: json["creator_notes"],
        systemPrompt: json["system_prompt"],
        characterVersion: json["character_version"],
        alternateGreetings: json["alternate_greetings"] == null ? [] : List<dynamic>.from(json["alternate_greetings"]!.map((x) => x)),
        postHistoryInstructions: json["post_history_instructions"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "creator": creator,
        "scenario": scenario,
        "first_mes": firstMes,
        "extensions": extensions?.toJson(),
        "description": description,
        "mes_example": mesExample,
        "personality": personality,
        "creator_notes": creatorNotes,
        "system_prompt": systemPrompt,
        "character_version": characterVersion,
        "alternate_greetings": alternateGreetings == null ? [] : List<dynamic>.from(alternateGreetings!.map((x) => x)),
        "post_history_instructions": postHistoryInstructions,
    };
}

class Extensions {
    final bool? fav;
    final String? world;
    final DepthPrompt? depthPrompt;

    Extensions({
        this.fav,
        this.world,
        this.depthPrompt,
    });

    Extensions copyWith({
        bool? fav,
        String? world,
        DepthPrompt? depthPrompt,
    }) => 
        Extensions(
            fav: fav ?? this.fav,
            world: world ?? this.world,
            depthPrompt: depthPrompt ?? this.depthPrompt,
        );

    factory Extensions.fromJson(Map<String, dynamic> json) => Extensions(
        fav: json["fav"],
        world: json["world"],
        depthPrompt: json["depth_prompt"] == null ? null : DepthPrompt.fromJson(json["depth_prompt"]),
    );

    Map<String, dynamic> toJson() => {
        "fav": fav,
        "world": world,
        "depth_prompt": depthPrompt?.toJson(),
    };
}

class DepthPrompt {
    final int? depth;
    final String? prompt;

    DepthPrompt({
        this.depth,
        this.prompt,
    });

    DepthPrompt copyWith({
        int? depth,
        String? prompt,
    }) => 
        DepthPrompt(
            depth: depth ?? this.depth,
            prompt: prompt ?? this.prompt,
        );

    factory DepthPrompt.fromJson(Map<String, dynamic> json) => DepthPrompt(
        depth: json["depth"],
        prompt: json["prompt"],
    );

    Map<String, dynamic> toJson() => {
        "depth": depth,
        "prompt": prompt,
    };
}

class CharacterTag {
    final Tag? tag;

    CharacterTag({
        this.tag,
    });

    CharacterTag copyWith({
        Tag? tag,
    }) => 
        CharacterTag(
            tag: tag ?? this.tag,
        );

    factory CharacterTag.fromJson(Map<String, dynamic> json) => CharacterTag(
        tag: json["tag"] == null ? null : Tag.fromJson(json["tag"]),
    );

    Map<String, dynamic> toJson() => {
        "tag": tag?.toJson(),
    };
}

class Tag {
    final int? id;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final String? name;

    Tag({
        this.id,
        this.createdAt,
        this.updatedAt,
        this.name,
    });

    Tag copyWith({
        int? id,
        DateTime? createdAt,
        DateTime? updatedAt,
        String? name,
    }) => 
        Tag(
            id: id ?? this.id,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            name: name ?? this.name,
        );

    factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        id: json["id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "name": name,
    };
}
