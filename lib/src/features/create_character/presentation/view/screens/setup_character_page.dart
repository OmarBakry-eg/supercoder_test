import 'package:flutter/material.dart';
import 'package:supercoder_test/src/utils/exports.dart';

class SetupCharacterProfile extends StatelessWidget {
  const SetupCharacterProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final CreateCharacterCubit createCharacterCubit =
        BlocProvider.of<CreateCharacterCubit>(context);
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
            width: SizeUtils.width,
            height: SizeUtils.height,
            decoration: BoxDecoration(
                color: appTheme.gray900,
                image: DecorationImage(
                    image: (createCharacterCubit.currentCharacter == null
                        ? AssetImage(ImageConstant.imgGroup80)
                        : NetworkImage(createCharacterCubit.currentCharacter!
                            .backgroundImageUrl!)) as ImageProvider,
                    fit: BoxFit.cover)),
            child: SafeArea(
              child: Container(
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 40,
                      spreadRadius: 15,
                    )
                  ]),
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 12.h),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppbarLeadingImage(
                                  imagePath: ImageConstant.imgArrowLeft,
                                  margin: EdgeInsets.only(
                                      left: 16.h, top: 16.v, bottom: 118.v),
                                  onTap: () {
                                    Constants.hideLoadingOrNavBack;
                                  }),
                              const Spacer(),
                              Center(
                                child: AppbarTitle(
                                  text: "Preview",
                                  margin:
                                      EdgeInsets.only(top: 18.v, bottom: 119.v),
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                          Container(
                              height: 88.v,
                              width: 72.h,
                              decoration: AppDecoration.outlineOnError,
                              child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    CustomImageView(
                                        imagePath: createCharacterCubit
                                                    .currentCharacter
                                                    ?.profileImageUrl ==
                                                'string'
                                            ? ImageConstant.imgRectangle257
                                            : createCharacterCubit
                                                    .currentCharacter
                                                    ?.profileImageUrl ??
                                                ImageConstant.imgRectangle257,
                                        height: 72.adaptSize,
                                        width: 72.adaptSize,
                                        radius: BorderRadius.circular(36.h),
                                        alignment: Alignment.topCenter),
                                  ])),
                          SizedBox(height: 8.v),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.h, vertical: 12.v),
                              decoration: AppDecoration.fillOnPrimaryContainer
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder16),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(left: 4.h),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 1.v, bottom: 2.v),
                                                  child: Text(
                                                      createCharacterCubit
                                                              .currentCharacter
                                                              ?.name ??
                                                          "Hosino Ai",
                                                      style: theme.textTheme
                                                          .titleLarge)),
                                              // CustomOutlinedButton(
                                              //     width: 56.h, text: "Edit")
                                            ])),
                                    SizedBox(height: 8.v),
                                    const BuildBubbleWidget(),
                                    SizedBox(height: 8.v),
                                    const BuildBubbleOne()
                                  ])),
                          SizedBox(height: 5.v)
                        ]),
                  )),
            )),
        bottomNavigationBar: Container(
            margin: EdgeInsets.only(
                left: 12.h, right: 12.h, bottom: 57.v, top: 15.v),
            //decoration: AppDecoration.gradientOnErrorToOnError,
            child: CustomElevatedButton(
                height: 52.v,
                onPressed: () {
                  Constants.navigateTo(const ChatScreen());
                },
                text: "Confirm",
                buttonStyle: CustomButtonStyles.outlineOnErrorTL26)));
  }
}

class BuildBubbleOne extends StatelessWidget {
  const BuildBubbleOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CreateCharacterCubit createCharacterCubit =
        BlocProvider.of<CreateCharacterCubit>(context);
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 4.h),
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 11.v),
        decoration: AppDecoration.fillGrayF
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          // SizedBox(
          //     height: 73.v,
          //     width: 310.h,
          //     child: Stack(alignment: Alignment.topLeft, children: [
          //       Align(
          //           alignment: Alignment.center,
          //           child: Container(
          //               height: 73.v,
          //               width: 310.h,
          //               decoration: AppDecoration.outlineWhiteA,
          //               child: CustomImageView(
          //                   imagePath: ImageConstant.imgIconMenuUp,
          //                   height: 24.adaptSize,
          //                   width: 24.adaptSize,
          //                   alignment: Alignment.topRight))),
          //       Align(
          //           alignment: Alignment.topLeft,
          //           child: Padding(
          //               padding: EdgeInsets.only(right: 27.h),
          //               child: Column(
          //                   mainAxisSize: MainAxisSize.min,
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     Text("Prologue",
          //                         style: theme.textTheme.labelLarge),
          //                     SizedBox(height: 7.v),
          //                     SizedBox(
          //                         width: 282.h,
          //                         child: Text(
          //                             "(Looking out the window, sighing) Why do peope fear me so much? I just want to live...",
          //                             maxLines: 2,
          //                             overflow: TextOverflow.ellipsis,
          //                             style: CustomTextStyles
          //                                 .bodyMediumBluegray100
          //                                 .copyWith(height: 1.50)))
          //                   ])))
          //     ])),
          // SizedBox(height: 12.v),

          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            CustomImageView(
                imagePath: ImageConstant.imgIconPlay,
                height: 27.adaptSize,
                width: 27.adaptSize),
            SizedBox(width: 5.h),
            Text(
                createCharacterCubit.curentSelectedVoice != null &&
                        createCharacterCubit.curentSelectedVoice?.id ==
                            createCharacterCubit.currentCharacter?.voiceId
                    ? "${createCharacterCubit.curentSelectedVoice?.name}"
                    : "Voice Name",
                style: theme.textTheme.labelLarge),
            //   const Spacer(),
            //CustomOutlinedButton(width: 94.h, text: "Edit Voice")
          ])
        ])).makeWidgetGestureClickable(context, useInkWell: true, onTap: () {
      if (createCharacterCubit.curentSelectedVoice?.referenceVoiceUrl == null) {
        Constants.showSnackBar(content: "Voice not recognized");
        return;
      }
      createCharacterCubit.playOrPauseVoice(
          createCharacterCubit.curentSelectedVoice!.referenceVoiceUrl!);
    });
  }
}

class BuildBubbleWidget extends StatelessWidget {
  const BuildBubbleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CreateCharacterCubit createCharacterCubit =
        BlocProvider.of<CreateCharacterCubit>(context);
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 4.h),
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 11.v),
        decoration: AppDecoration.fillGrayF
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text("Description", style: theme.textTheme.labelLarge),
                    SizedBox(height: 7.v),
                    SizedBox(
                        width: 272.h,
                        child: Text(
                            createCharacterCubit
                                    .currentCharacter?.description ??
                                "Describe your character's personality and physical features in a few sentences.Describe your...Describe your character's personality and physical features in a few sentences.Describe your...Describe your character's personality and physical features in a few sentences.Describe your...Describe your character's personality and physical features in a few sentences.Describe your...",
                            maxLines: 10,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyles.bodyMediumBluegray100
                                .copyWith(height: 1.50)))
                  ])),
              CustomImageView(
                  imagePath: ImageConstant.imgIconMenuUp,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  margin: EdgeInsets.only(left: 13.h, bottom: 177.v))
            ]));
  }
}
