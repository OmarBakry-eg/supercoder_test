import 'package:flutter/material.dart';
import 'package:supercoder_test/src/utils/exports.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRemoteSource source;
  ChatCubit(this.source) : super(ChatInitial());

  List<ChatData>? messageList = [];
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  void getChatData({bool removeLast = false}) async {
    String errorMessage = '';
    try {
      emit(ChatLoading());
      ChatModel chatModel = await source.getChat();
      if (removeLast && messageList != null && messageList!.isNotEmpty) {
        messageList!.removeLast();
      }
      messageList = chatModel.data;
      emit(ChatLoaded(messageList));
      return;
    } on ServerException catch (e) {
      Constants.showSnackBar(content: "${e.message}, ${e.statusCode}");
      errorMessage = e.message;
    } on OfflineException catch (e) {
      Constants.showSnackBar(content: "${e.message}, ${e.statusCode}");
      errorMessage = e.message;
    } on EmptyCacheException catch (e) {
      Constants.showSnackBar(content: e.message);
      errorMessage = e.message;
    }
    emit(ChatError(errorMessage));
  }

  void sendMessage() async {
    if (messageController.text.isEmpty) {
      return;
    }
    _scrollDown();
    ChatData chatData = ChatData(speaker: "user", text: messageController.text);
    messageController.clear();
    messageList!.add(chatData);
    emit(AddingNewMessage());
    _scrollDown();
    return _sendMessageToServer(chatData);
  }

  void _scrollDown() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      curve: Curves.easeIn,
      duration: const Duration(milliseconds: 200),
    );
  }

  void _sendMessageToServer(ChatData chatData) async {
    String errorMessage = '';
    try {
      ChatModel chatModel = await source.startChat(chatData.text!);
      messageList!.add(chatModel.data!.last);
      emit(ChatLoaded(messageList));
      _scrollDown();
      _scrollDown();
      return;
    } on ServerException catch (e) {
      Constants.showSnackBar(content: "${e.message}, ${e.statusCode}");
      errorMessage = e.message;
    } on OfflineException catch (e) {
      Constants.showSnackBar(content: "${e.message}, ${e.statusCode}");
      errorMessage = e.message;
    } on EmptyCacheException catch (e) {
      Constants.showSnackBar(content: e.message);
      errorMessage = e.message;
    }
    emit(ChatError(errorMessage));
  }
}
