import 'package:flutter/material.dart';
import 'package:supercoder_test/src/utils/exports.dart';

class ImageWidget extends StatelessWidget {
  final String? image;
  const ImageWidget({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    final CreateCharacterCubit createCharacterCubit =
        BlocProvider.of<CreateCharacterCubit>(context);
    return BlocBuilder<CreateCharacterCubit, CreateCharacterState>(
        bloc: createCharacterCubit,
        builder: (context, state) {
          return Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              margin: const EdgeInsets.all(0),
              color: appTheme.gray90001,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: image == createCharacterCubit.selectedGeneratedImageURL
                      ? theme.colorScheme.primary
                      : theme.colorScheme.errorContainer,
                  width: 2.h,
                ),
                borderRadius: BorderRadiusStyle.roundedBorder8,
              ),
              child: Container(
                  height: 210.v,
                  width: 120.h,
                  decoration: AppDecoration.outlinePrimary1.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder8,
                  ),
                  child: state is GeneratedImagesUploading
                      ? const Center(
                          child: CircularProgressIndicator.adaptive(),
                        )
                      : Stack(
                          fit: StackFit.expand,
                          // alignment: Alignment.bottomRight,
                          children: [
                            FittedBox(
                              fit: BoxFit.cover,
                              child: CustomImageView(
                                imagePath: image ??
                                    ImageConstant.imgRectangle253205x116,
                                // height: 207.v,
                                // width: 116.h,
                                radius: BorderRadius.circular(
                                  16.h,
                                ),
                                alignment: Alignment.center,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                  height: 20.adaptSize,
                                  width: 20.adaptSize,
                                  margin: EdgeInsets.only(
                                    right: 9.h,
                                    bottom: 10.v,
                                  ),
                                  decoration:
                                      AppDecoration.fillOnError.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder8,
                                  ),
                                  child: image ==
                                          createCharacterCubit
                                              .selectedGeneratedImageURL
                                      ? CustomImageView(
                                          imagePath: ImageConstant.imgCheckmark,
                                          height: 20.adaptSize,
                                          width: 20.adaptSize,
                                          radius: BorderRadius.circular(
                                            10.h,
                                          ),
                                          alignment: Alignment.center,
                                        )
                                      : CustomImageView(
                                          imagePath:
                                              ImageConstant.imgCheckRound,
                                          height: 20.adaptSize,
                                          width: 20.adaptSize,
                                          radius: BorderRadius.circular(
                                            10.h,
                                          ),
                                          alignment: Alignment.center,
                                        )),
                            ),
                          ],
                        )));
        }).makeWidgetGestureClickable(context, onTap: () {
      if (image == null) {
        return;
      }
      createCharacterCubit.selectGeneratedImage(image!);
    });
  }
}
