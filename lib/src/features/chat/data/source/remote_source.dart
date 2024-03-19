import 'package:supercoder_test/src/features/chat/data/models/chat_model.dart';
import 'package:supercoder_test/src/utils/exports.dart';

final class ChatRemoteSource {
  final DioClient _dioClient;
  final LocalSource _localSource;
  const ChatRemoteSource(this._dioClient, this._localSource);

  Future<ChatModel> startChat(String firstMessage) async {
    if (_localSource.token == null) {
      throw const EmptyCacheException(message: 'Missing token');
    }
    if (_localSource.getStoredCharacterID == null) {
      throw const EmptyCacheException(message: 'Missing CharacterID');
    }

    Result result = await _dioClient.post(
      'api/chats',
      {
        "characterId": _localSource.getStoredCharacterID,
        "text": firstMessage,
        "lastChatId": DateTime.now().millisecond
      },
      isLoading: false,
      token: _localSource.token,
    );
    if (result is SuccessState) {
      ChatModel chatModel = ChatModel.fromJson(result.value);
      logWarning("chatModel.data?.length : ${chatModel.data?.length}");
      return chatModel;
    } else if (result is ErrorState) {
      throw ServerException(
          message: result.msg.toString(), errorModel: result.errorModel);
    } else if (result is NetworkErrorState) {
      throw OfflineException(message: result.msg.toString());
    } else {
      throw ServerException();
    }
  }

  Future<ChatModel> getChat() async {
    if (_localSource.token == null) {
      throw const EmptyCacheException(message: 'Missing token');
    }
    if (_localSource.getStoredCharacterID == null) {
      throw const EmptyCacheException(message: 'Missing CharacterID');
    }

    Result result = await _dioClient.get(
      'api/chats',
      _localSource.token,
      queryParameters: {
        "characterId" : _localSource.getStoredCharacterID,
        "limit": "9999"
      },
      isLoading: false,
    );
    if (result is SuccessState) {
      ChatModel chatModel = ChatModel.fromJson(result.value);
      logWarning("chatModel.data?.length : ${chatModel.data?.length}");
      return chatModel;
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
