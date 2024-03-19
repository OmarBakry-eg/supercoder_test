part of 'create_character_cubit.dart';

sealed class CreateCharacterState extends Equatable {
  const CreateCharacterState();

  @override
  List<Object> get props => [];
}

final class CreateCharacterInitial extends CreateCharacterState {}

final class SelectGender extends CreateCharacterState {}

final class SelectAndUploadFile extends CreateCharacterState {}

final class FileUploaded extends CreateCharacterState {}

final class GeneratedImagesUploading extends CreateCharacterState {}

final class GeneratedImagesUploaded extends CreateCharacterState {}

final class SelectGeneratedImage extends CreateCharacterState {}

final class VoicesLoading extends CreateCharacterState {}

final class VoicesLoaded extends CreateCharacterState {}

final class PreparedVoicePlaying extends CreateCharacterState {}

final class PlayVoice extends CreateCharacterState {
  final String url;

  const PlayVoice({required this.url});

  @override
  List<Object> get props => [url];
}

final class PauesVoice extends CreateCharacterState {
  final String url;

  const PauesVoice({required this.url});

  @override
  List<Object> get props => [url];
}

final class VoiceSelected extends CreateCharacterState {}

