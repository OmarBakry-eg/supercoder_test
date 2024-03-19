import 'package:dio/dio.dart';

import 'package:supercoder_test/src/utils/exports.dart';

final class CreateCharacterRemoteSource {
  final DioClient _dioClient;
  final LocalSource _localSource;
  const CreateCharacterRemoteSource(this._dioClient, this._localSource);

  Future<bool> deviceLogin() async {
    (String deviceId, String devicePlatform) deviceInfo =
        await DevicePlatform.getDevicePlatform();
    Result result = await _dioClient.post(
        'api/auth/login',
        isLoading: false,
        {"deviceId": deviceInfo.$1, "devicePlatform": deviceInfo.$2});
    if (result is SuccessState) {
      TokenModel tokenModel = TokenModel.fromJson(result.value);
      logWarning("Token: ${tokenModel.accessToken}");
      return _localSource.setToken(tokenModel.accessToken ?? "No token");
    } else if (result is ErrorState) {
      throw ServerException(
          message: result.msg.toString(), errorModel: result.errorModel);
    } else if (result is NetworkErrorState) {
      throw OfflineException(message: result.msg.toString());
    } else {
      throw ServerException();
    }
  }

  Future<String> uploadImageToTheServer({required File file}) async {
    if (_localSource.token == null) {
      throw const EmptyCacheException(message: 'Missing token');
    }
    Result result = await _dioClient.post(
        'api/images/upload',
        FormData.fromMap({
          'file': await MultipartFile.fromFile(file.path,
              filename: Constants.getFileName(file)),
        }),
        token: _localSource.token,
        isLoading: false,
        isHeaderJsonType: false);
    if (result is SuccessState) {
      return result.value;
    } else if (result is ErrorState) {
      throw ServerException(message: result.msg.toString());
    } else if (result is NetworkErrorState) {
      throw OfflineException(message: result.msg.toString());
    } else {
      throw ServerException();
    }
  }

  Future<List<String>?> createCharacterProfile(
      GenerateCharacterProfileImageModel
          generateCharacterProfileImageModel) async {
    if (_localSource.token == null) {
      throw const EmptyCacheException(message: 'Missing token');
    }
    Result result = await _dioClient.post(
        'api/characters/profile-images',
        isLoading: false,
        token: _localSource.token,
        generateCharacterProfileImageModel.toJson());
    if (result is SuccessState) {
      CharacterProfileImageModel createCharacterProfile =
          CharacterProfileImageModel.fromJson(result.value);
      logWarning(
          "createCharacterProfile img length: ${createCharacterProfile.result?.length}");
      return createCharacterProfile.result;
    } else if (result is ErrorState) {
      throw ServerException(
          message: result.msg.toString(), errorModel: result.errorModel);
    } else if (result is NetworkErrorState) {
      throw OfflineException(message: result.msg.toString());
    } else {
      throw ServerException();
    }
  }

  Future<VoicesModel> getVoicesList() async {
    if (_localSource.token == null) {
      throw const EmptyCacheException(message: 'Missing token');
    }
    Result result = await _dioClient.get(
      'api/voice?page=1&limit=52',
      _localSource.token,
      isLoading: false,
    );
    if (result is SuccessState) {
      VoicesModel getVoicesList = VoicesModel.fromJson(result.value);
      logWarning("getVoicesList : ${getVoicesList.data?.length}");
      return getVoicesList;
    } else if (result is ErrorState) {
      throw ServerException(
          message: result.msg.toString(), errorModel: result.errorModel);
    } else if (result is NetworkErrorState) {
      throw OfflineException(message: result.msg.toString());
    } else {
      throw ServerException();
    }
  }

  Future<CharacterModel> postNewCharacter(
      CharacterDtoModel characterDtoModel) async {
    if (_localSource.token == null) {
      throw const EmptyCacheException(message: 'Missing token');
    }
    Result result = await _dioClient.post(
      'api/characters',
      characterDtoModel.toJson(),
      token: _localSource.token,
      isLoading: true,
      
    );
    if (result is SuccessState) {
      CharacterModel characterModel = CharacterModel.fromJson(result.value);
      if (characterModel.id?.toString() != null) {
        _localSource.setCharacterID(characterModel.id.toString());
      }
      logWarning("characterModel.name : ${characterModel.name}");
      return characterModel;
    } else if (result is ErrorState) {
      throw ServerException(
          message: result.msg.toString(), errorModel: result.errorModel);
    } else if (result is NetworkErrorState) {
      throw OfflineException(message: result.msg.toString());
    } else {
      throw ServerException();
    }
  }

  Future<CharacterModel> getCharacterByID(String id) async {
    if (_localSource.token == null) {
      throw const EmptyCacheException(message: 'Missing token');
    }
    Result result = await _dioClient.get(
      'api/characters/$id',
      _localSource.token,
      isLoading: false,
    );
    if (result is SuccessState) {
      CharacterModel characterModel = CharacterModel.fromJson(result.value);
      if (characterModel.id?.toString() != null) {
        _localSource.setCharacterID(characterModel.id.toString());
      }
      logWarning("characterModel.name : ${characterModel.name}");
      return characterModel;
    } else if (result is ErrorState) {
      throw ServerException(
          message: result.msg.toString(), errorModel: result.errorModel);
    } else if (result is NetworkErrorState) {
      throw OfflineException(message: result.msg.toString());
    } else {
      throw ServerException();
    }
  }
}

//"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiIzNWFjZGM5Yy02OTQyLTQxY2MtYjU2Mi1lN2UyMDA1MGUyZjYiLCJkZXZpY2VJZCI6ImlQaG9uZTE2LDIiLCJpYXQiOjE3MTA4NTk3NjEsImV4cCI6MTcxNjA0Mzc2MX0.7tlHy1wTPlvj4SAMFr84mUCgv7bbPBAIC-VlIg2ImAM",
