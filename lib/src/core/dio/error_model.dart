// To parse this JSON data, do
//
//     final errorModel = errorModelFromJson(jsonString);

import 'dart:convert';

import 'package:dio/dio.dart';

ErrorModel errorModelFromJson(String str) =>
    ErrorModel.fromJson(json.decode(str));

String errorModelToJson(ErrorModel data) => json.encode(data.toJson());

class ErrorModel {
  final num? statusCode;
  final String? exception;
  final String? path;
  final ErrMsg? errMsg;
  final ErrObject? errObject;
  RequestOptions? requestOptions;
  dynamic data;
  StackTrace? stackTrace;

  ErrorModel({
    this.statusCode,
    this.exception,
    this.path,
    this.errMsg,
    this.errObject,
    this.requestOptions,
    this.data,
    this.stackTrace,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        data: json,
        statusCode: json["statusCode"],
        exception: json["exception"],
        path: json["path"],
        errMsg: json["errMSG"] == null ? null : ErrMsg.fromJson(json["errMSG"]),
        errObject: json["errObject"] == null
            ? null
            : ErrObject.fromJson(json["errObject"]),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "exception": exception,
        "path": path,
        "errMSG": errMsg?.toJson(),
        "errObject": errObject?.toJson(),
        "data": data,
        "requestOptions": {
          "data": requestOptions?.data,
          "path": requestOptions?.path,
          "baseUrl": requestOptions?.baseUrl,
          "extra": requestOptions?.extra,
          "method": requestOptions?.method,
          "queryParameters": requestOptions?.queryParameters,
          "responseType": requestOptions?.responseType.name,
          "contentType": requestOptions?.contentType,
        }..removeWhere((key, value) => value == null)
      }..removeWhere((key, value) => value == null);
}

class ErrMsg {
  final String? en;
  final String? ar;

  ErrMsg({
    this.en,
    this.ar,
  });

  factory ErrMsg.fromJson(Map<String, dynamic> json) => ErrMsg(
        en: json["en"],
        ar: json["ar"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "ar": ar,
      };
}

class ErrObject {
  final Response? response;
  final num? status;
  final Options? options;
  final String? message;
  final String? name;

  ErrObject({
    this.response,
    this.status,
    this.options,
    this.message,
    this.name,
  });

  factory ErrObject.fromJson(Map<String, dynamic> json) => ErrObject(
        response: json["response"] == null
            ? null
            : Response.fromJson(json["response"]),
        status: json["status"],
        options:
            json["options"] == null ? null : Options.fromJson(json["options"]),
        message: json["message"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "response": response?.toJson(),
        "status": status,
        "options": options?.toJson(),
        "message": message,
        "name": name,
      };
}

class Options {
  Options();

  factory Options.fromJson(Map<String, dynamic> json) => Options();

  Map<String, dynamic> toJson() => {};
}

class Response {
  final String? accessToken;
  final ErrMsg? message;

  Response({
    this.accessToken,
    this.message,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        accessToken: json["access_token"],
        message:
            json["message"] == null ? null : ErrMsg.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "message": message?.toJson(),
      };
}
