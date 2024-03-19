import 'package:flutter/material.dart';
import 'package:supercoder_test/src/utils/exports.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: _buildTwo(context),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTwo(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: IntrinsicWidth(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 800.v,
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgRectangle247,
                    height: 800.v,
                    width: 390.h,
                    alignment: Alignment.center,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 150.v),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 223.v,
                            width: 286.h,
                            margin: EdgeInsets.only(left: 12.h),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    elevation: 0,
                                    margin: const EdgeInsets.all(0),
                                    color: theme.colorScheme.onError
                                        .withOpacity(0.8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder16,
                                    ),
                                    child: Container(
                                      height: 95.v,
                                      width: 286.h,
                                      padding: EdgeInsets.all(8.h),
                                      decoration:
                                          AppDecoration.fillOnError1.copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder16,
                                      ),
                                      child: Stack(
                                        alignment: Alignment.bottomRight,
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: SizedBox(
                                              width: 246.h,
                                              child: RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: "Intro. ",
                                                      style: theme
                                                          .textTheme.titleSmall,
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          "Taking a deep breath, Yuzu gently knocks on the door and whispers.on the door...",
                                                      style: CustomTextStyles
                                                          .titleSmallffa2a09c,
                                                    ),
                                                  ],
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                            ),
                                          ),
                                          CustomImageView(
                                            imagePath:
                                                ImageConstant.imgIconMenuUp,
                                            height: 24.adaptSize,
                                            width: 24.adaptSize,
                                            alignment: Alignment.bottomRight,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: SizedBox(
                                    height: 132.v,
                                    width: 286.h,
                                    child: Stack(
                                      alignment: Alignment.topLeft,
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 16.h,
                                              vertical: 14.v,
                                            ),
                                            decoration: AppDecoration
                                                .fillGray60001
                                                .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder16,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(height: 3.v),
                                                Container(
                                                  width: 243.h,
                                                  margin: EdgeInsets.only(
                                                      right: 10.h),
                                                  child: RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                              "Taking a deep breath, Yuzu gently knocks on the door and whispers.\n",
                                                          style: CustomTextStyles
                                                              .bodyMediumNotoSans66ffffff,
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              "Good morning, master. It's time to wake up. nyang",
                                                          style: CustomTextStyles
                                                              .titleSmallMedium,
                                                        ),
                                                      ],
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        CustomElevatedButton(
                                          height: 28.v,
                                          width: 50.h,
                                          text: "2’’",
                                          leftIcon: Container(
                                            margin: EdgeInsets.only(right: 4.h),
                                            child: CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgIconPlay,
                                              height: 20.adaptSize,
                                              width: 20.adaptSize,
                                            ),
                                          ),
                                          buttonStyle:
                                              CustomButtonStyles.fillGrayTL14,
                                          buttonTextStyle: CustomTextStyles
                                              .labelLargeWhiteA700,
                                          alignment: Alignment.topLeft,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 12.v),
                          CustomElevatedButton(
                            height: 53.v,
                            width: 116.h,
                            text: "Yes I’m ready ",
                            margin: EdgeInsets.only(right: 12.h),
                            buttonStyle: CustomButtonStyles.fillGrayTL16,
                            buttonTextStyle:
                                CustomTextStyles.titleSmallWhiteA700,
                            alignment: Alignment.centerRight,
                          ),
                          Container(
                            height: 34.v,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: const Alignment(0.5, 0),
                                end: const Alignment(0.5, 1),
                                colors: [
                                  theme.colorScheme.onErrorContainer
                                      .withOpacity(0),
                                  theme.colorScheme.onErrorContainer,
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 96.v,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: const Alignment(0.5, 0),
                          end: const Alignment(0.5, 1),
                          colors: [
                            theme.colorScheme.onError.withOpacity(0.7),
                            theme.colorScheme.onError.withOpacity(0.47),
                            theme.colorScheme.onError,
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgRectangle248,
              height: 800.v,
              width: 390.h,
            ),
          ],
        ),
      ),
    );
  }
}
