class TokenModel {
  final String? accessToken;

  const TokenModel({
    this.accessToken,
  });

  TokenModel copyWith({
    String? accessToken,
  }) =>
      TokenModel(
        accessToken: accessToken ?? this.accessToken,
      );

  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
        accessToken: json["accessToken"],
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
      };
}
