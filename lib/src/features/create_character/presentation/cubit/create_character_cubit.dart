import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:supercoder_test/src/utils/exports.dart';

part 'create_character_state.dart';

class CreateCharacterCubit extends Cubit<CreateCharacterState> {
  final CreateCharacterRemoteSource source;
  CreateCharacterCubit(this.source) : super(CreateCharacterInitial());

  CharacterGender? selectedGender;
  String? selectedImageURL;
  List<String>? generatedImages;
  String? selectedGeneratedImageURL;
  VoicesModel? voicesModel;
  VoiceData? curentSelectedVoice;
  String? currentPlayedURL;

  final TextEditingController imagePrompt = TextEditingController();
  final TextEditingController intro = TextEditingController();
  final TextEditingController charName = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController firstMessage = TextEditingController();
  final AudioPlayer _player = AudioPlayer(); // Create a player

  void initCubit() async {
    try {
      await source.deviceLogin();
    } on ServerException catch (e) {
      Constants.showSnackBar(content: "${e.message}, ${e.statusCode}");
    } on OfflineException catch (e) {
      Constants.showSnackBar(content: "${e.message}, ${e.statusCode}");
    }
  }

  void selectVoice(VoiceData? data) {
    emit(CreateCharacterInitial());
    curentSelectedVoice == data
        ? curentSelectedVoice = null
        : curentSelectedVoice = data;
    emit(VoiceSelected());
  }

  void playOrPauseVoice(String url) async {
    emit(PreparedVoicePlaying());
    if (currentPlayedURL == url) {
      if (_player.playing) {
        _player.pause();
        emit(PauesVoice(url: url));
      } else {
        _player.play();
        emit(PlayVoice(url: url));
      }
    } else {
      currentPlayedURL = url;
      if (_player.playing) {
        _player.pause();
        emit(PauesVoice(url: url));
      } else {
        await _player.setUrl(url);
        _player.play();
        emit(PlayVoice(url: url));
      }
    }
  }

  void getVoiceList() async {
    if (voicesModel != null) {
      return;
    }
    try {
      emit(VoicesLoading());
      VoicesModel model = await source.getVoicesList();
      voicesModel = model;
      emit(VoicesLoaded());
      return;
    } on ServerException catch (e) {
      Constants.showSnackBar(content: "${e.message}, ${e.statusCode}");
    } on OfflineException catch (e) {
      Constants.showSnackBar(content: "${e.message}, ${e.statusCode}");
    } on EmptyCacheException catch (e) {
      Constants.showSnackBar(content: e.message);
    }
    emit(CreateCharacterInitial());
  }

  void selectGender(String char) {
    emit(CreateCharacterInitial());
    selectedGender == CharacterGender.getChar(char)
        ? selectedGender = null
        : selectedGender = CharacterGender.getChar(char);
    emit(SelectGender());
  }

  void selectAndUploadFile() async {
    List<File>? files = await FilePickerClass.pickImages();
    if (files?.first != null) {
      emit(SelectAndUploadFile());
      await _uploadImageToTheServer(files);
    }
  }

  void selectGeneratedImage(String img) {
    emit(CreateCharacterInitial());
    selectedGeneratedImageURL == img
        ? selectedGeneratedImageURL = null
        : selectedGeneratedImageURL = img;
    emit(SelectGeneratedImage());
  }

  Future<void> getGeneratedImage() async {
    try {
      emit(GeneratedImagesUploading());
      List<String>? images = await source.createCharacterProfile(
          HelpersMethods.generateCharacterProfileImageModel(this));
      generatedImages = images;
      emit(GeneratedImagesUploaded());
      return;
    } on ServerException catch (e) {
      Constants.showSnackBar(content: "${e.message}, ${e.statusCode}");
    } on OfflineException catch (e) {
      Constants.showSnackBar(content: "${e.message}, ${e.statusCode}");
    } on EmptyCacheException catch (e) {
      Constants.showSnackBar(content: e.message);
    }
    emit(CreateCharacterInitial());
  }

  Future<void> _uploadImageToTheServer(List<File>? files) async {
    try {
      selectedImageURL =
          await source.uploadImageToTheServer(file: files!.first);
      if (selectedImageURL == null) {
        emit(CreateCharacterInitial());
        return;
      }
      emit(FileUploaded());
      return;
    } on ServerException catch (e) {
      Constants.showSnackBar(content: "${e.message}, ${e.statusCode}");
    } on OfflineException catch (e) {
      Constants.showSnackBar(content: "${e.message}, ${e.statusCode}");
    } on EmptyCacheException catch (e) {
      Constants.showSnackBar(content: e.message);
    }
    emit(CreateCharacterInitial());
  }
}
