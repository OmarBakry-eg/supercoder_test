class ChatModel {
  final List<ChatData>? data;
  final String? cursor;
  final bool? hasNextPage;

  ChatModel({
    this.data,
    this.cursor,
    this.hasNextPage,
  });

  ChatModel copyWith({
    List<ChatData>? data,
    String? cursor,
    bool? hasNextPage,
  }) =>
      ChatModel(
        data: data ?? this.data,
        cursor: cursor ?? this.cursor,
        hasNextPage: hasNextPage ?? this.hasNextPage,
      );

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        data: json["data"] == null
            ? []
            : List<ChatData>.from(json["data"]!.map((x) => ChatData.fromJson(x))),
        cursor: json["cursor"],
        hasNextPage: json["hasNextPage"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "cursor": cursor,
        "hasNextPage": hasNextPage,
      };
}

class ChatData {
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? speaker;
  final String? text;
  final String? contentType;
  final dynamic speechUrl;
  final List<ChatData>? alternateResponses;

  ChatData({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.speaker,
    this.text,
    this.contentType,
    this.speechUrl,
    this.alternateResponses,
  });

  ChatData copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? speaker,
    String? text,
    String? contentType,
    dynamic speechUrl,
    List<ChatData>? alternateResponses,
  }) =>
      ChatData(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        speaker: speaker ?? this.speaker,
        text: text ?? this.text,
        contentType: contentType ?? this.contentType,
        speechUrl: speechUrl ?? this.speechUrl,
        alternateResponses: alternateResponses ?? this.alternateResponses,
      );

  factory ChatData.fromJson(Map<String, dynamic> json) => ChatData(
        id: json["id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        speaker: json["speaker"],
        text: json["text"],
        contentType: json["contentType"],
        speechUrl: json["speechUrl"],
        alternateResponses: json["alternateResponses"] == null
            ? []
            : List<ChatData>.from(
                json["alternateResponses"]!.map((x) => ChatData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "speaker": speaker,
        "text": text,
        "contentType": contentType,
        "speechUrl": speechUrl,
        "alternateResponses": alternateResponses == null
            ? []
            : List<dynamic>.from(alternateResponses!.map((x) => x.toJson())),
      };
}
