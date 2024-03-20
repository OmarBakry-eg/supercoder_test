// ignore_for_file: constant_identifier_names
class VoicesModel {
  final List<VoiceData>? data;
  final Meta? meta;

  const VoicesModel({
    this.data,
    this.meta,
  });

  VoicesModel copyWith({
    List<VoiceData>? data,
    Meta? meta,
  }) =>
      VoicesModel(
        data: data ?? this.data,
        meta: meta ?? this.meta,
      );

  factory VoicesModel.fromJson(Map<String, dynamic> json) => VoicesModel(
        data: json["data"] == null
            ? []
            : List<VoiceData>.from(
                json["data"]!.map((x) => VoiceData.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
      };
}

class VoiceData {
  final int? id;
  final String? name;
  final Gender? gender;
  final String? referenceVoiceUrl;
  final Age? age;
  final VoiceStyle? style;
  final String? sampleVoiceUrl;

  const VoiceData({
    this.id,
    this.name,
    this.gender,
    this.referenceVoiceUrl,
    this.age,
    this.style,
    this.sampleVoiceUrl,
  });

  VoiceData copyWith({
    int? id,
    String? name,
    Gender? gender,
    String? referenceVoiceUrl,
    Age? age,
    VoiceStyle? style,
    String? sampleVoiceUrl,
  }) =>
      VoiceData(
        id: id ?? this.id,
        name: name ?? this.name,
        gender: gender ?? this.gender,
        referenceVoiceUrl: referenceVoiceUrl ?? this.referenceVoiceUrl,
        age: age ?? this.age,
        style: style ?? this.style,
        sampleVoiceUrl: sampleVoiceUrl ?? this.sampleVoiceUrl,
      );

  factory VoiceData.fromJson(Map<String, dynamic> json) => VoiceData(
        id: json["id"],
        name: json["name"],
        gender: genderValues.map[json["gender"]]!,
        referenceVoiceUrl: json["referenceVoiceUrl"],
        age: ageValues.map[json["age"]]!,
        style: styleValues.map[json["style"]]!,
        sampleVoiceUrl: json["sampleVoiceUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "gender": genderValues.reverse[gender],
        "referenceVoiceUrl": referenceVoiceUrl,
        "age": ageValues.reverse[age],
        "style": styleValues.reverse[style],
        "sampleVoiceUrl": sampleVoiceUrl,
      };
}

enum Age { ADULT, YOUNG_ADULT }

final ageValues =
    EnumValues({"Adult": Age.ADULT, "YoungAdult": Age.YOUNG_ADULT});

enum Gender { FEMALE, MALE, OTHER }

final genderValues = EnumValues(
    {"Female": Gender.FEMALE, "Male": Gender.MALE, "Other": Gender.OTHER});

enum VoiceStyle { ANNOYING, CALM, CONFIDENT, ENERGETIC, SHY, SMART }

final styleValues = EnumValues({
  "Annoying": VoiceStyle.ANNOYING,
  "Calm": VoiceStyle.CALM,
  "Confident": VoiceStyle.CONFIDENT,
  "Energetic": VoiceStyle.ENERGETIC,
  "Shy": VoiceStyle.SHY,
  "Smart": VoiceStyle.SMART
});

class Meta {
  final bool? isFirstPage;
  final bool? isLastPage;
  final int? currentPage;
  final dynamic previousPage;
  final dynamic nextPage;
  final int? pageCount;
  final int? totalCount;

  Meta({
    this.isFirstPage,
    this.isLastPage,
    this.currentPage,
    this.previousPage,
    this.nextPage,
    this.pageCount,
    this.totalCount,
  });

  Meta copyWith({
    bool? isFirstPage,
    bool? isLastPage,
    int? currentPage,
    dynamic previousPage,
    dynamic nextPage,
    int? pageCount,
    int? totalCount,
  }) =>
      Meta(
        isFirstPage: isFirstPage ?? this.isFirstPage,
        isLastPage: isLastPage ?? this.isLastPage,
        currentPage: currentPage ?? this.currentPage,
        previousPage: previousPage ?? this.previousPage,
        nextPage: nextPage ?? this.nextPage,
        pageCount: pageCount ?? this.pageCount,
        totalCount: totalCount ?? this.totalCount,
      );

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        isFirstPage: json["isFirstPage"],
        isLastPage: json["isLastPage"],
        currentPage: json["currentPage"],
        previousPage: json["previousPage"],
        nextPage: json["nextPage"],
        pageCount: json["pageCount"],
        totalCount: json["totalCount"],
      );

  Map<String, dynamic> toJson() => {
        "isFirstPage": isFirstPage,
        "isLastPage": isLastPage,
        "currentPage": currentPage,
        "previousPage": previousPage,
        "nextPage": nextPage,
        "pageCount": pageCount,
        "totalCount": totalCount,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
