import 'package:flutter/material.dart';
import 'package:supercoder_test/src/utils/exports.dart';

class HelpersMethods {
  static GenerateCharacterProfileImageModel generateCharacterProfileImageModel(
      CreateCharacterCubit characterCubit) {
    return GenerateCharacterProfileImageModel(
        prompt: characterCubit.imagePrompt.text,
        gender: characterCubit.selectedGender?.nameUpper,
        imageUrl: characterCubit.selectedImageURL);
  }

  static CharacterDtoModel generateCharacterDTO(
      CreateCharacterCubit characterCubit) {
    return CharacterDtoModel(
        profileImageUrl: characterCubit.selectedGeneratedImageURL,
        backgroundImageUrl:characterCubit.selectedGeneratedImageURL,
        name: characterCubit.charName.text,
        gender: characterCubit.selectedGender?.nameUpper,
        firstMessage: characterCubit.firstMessage.text,
        description: characterCubit.descriptionController.text,
        introduce: characterCubit.intro.text,
        voiceId: characterCubit.curentSelectedVoice?.id);
  }

  static void showDateTimePickerWithTextControllerParm(
      TextEditingController textEditingController,
      TextEditingController presentingTextEditingController) async {
    final DateTime? picked = await showDatePicker(
        context: Constants.navigatorKey.currentContext!,
        initialDate: DateTime.now(),
        firstDate: DateTime(1945),
        lastDate: DateTime(DateTime.now().year + 1, 2, 30));

    if (picked != null) {
      presentingTextEditingController.text = DateFormat.yMd().format(picked);
      textEditingController.text = picked.toString();
    }
  }
}
