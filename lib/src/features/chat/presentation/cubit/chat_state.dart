part of 'chat_cubit.dart';

sealed class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

final class ChatInitial extends ChatState {}

final class ChatLoading extends ChatState {}

final class ChatLoaded extends ChatState {
  final List<ChatData>? messages;

  const ChatLoaded(this.messages);

  @override
  List<Object> get props => [
        if (messages != null) {messages}
      ];
}

final class ChatError extends ChatState {
  final String message;

  const ChatError(this.message);

  @override
  List<Object> get props => [message];
}


final class AddingNewMessage extends ChatState {}
