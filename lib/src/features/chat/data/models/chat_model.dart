class ChatModel {
  final List<ChatData>? data;
  final String? cursor;
  final bool? hasNextPage;

  const ChatModel({
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
            : List<ChatData>.from(
                json["data"]!.map((x) => ChatData.fromJson(x))),
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
  final String? contentType;
  final List<String>? alternateResponses;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? speaker;
  final String? text;
  final String? speechUrl;

  const ChatData({
    this.contentType,
    this.alternateResponses,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.speaker,
    this.text,
    this.speechUrl,
  });

  ChatData copyWith({
    String? contentType,
    List<String>? alternateResponses,
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? speaker,
    String? text,
    String? speechUrl,
  }) =>
      ChatData(
        contentType: contentType ?? this.contentType,
        alternateResponses: alternateResponses ?? this.alternateResponses,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        speaker: speaker ?? this.speaker,
        text: text ?? this.text,
        speechUrl: speechUrl ?? this.speechUrl,
      );

  factory ChatData.fromJson(Map<String, dynamic> json) => ChatData(
        contentType: json["contentType"],
        alternateResponses: json["alternateResponses"] == null
            ? []
            : List<String>.from(json["alternateResponses"]!.map((x) => x)),
        id: json["id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        speaker: json["speaker"],
        text: json["text"],
        speechUrl: json["speechUrl"],
      );

  Map<String, dynamic> toJson() => {
        "contentType": contentType,
        "alternateResponses": alternateResponses == null
            ? []
            : List<dynamic>.from(alternateResponses!.map((x) => x)),
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "speaker": speaker,
        "text": text,
        "speechUrl": speechUrl,
      };
}
