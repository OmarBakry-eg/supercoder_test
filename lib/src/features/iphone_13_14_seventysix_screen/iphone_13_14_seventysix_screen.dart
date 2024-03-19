// import 'package:supercoder_test/src/features/create_character/presentation/view/screens/setup_character_page.dart';
// import 'package:supercoder_test/src/utils/UI/consts.dart';
// import 'package:supercoder_test/src/utils/widgets/app_bar/custom_app_bar.dart';
// import 'package:supercoder_test/src/utils/widgets/app_bar/appbar_leading_image.dart';
// import 'package:supercoder_test/src/utils/widgets/app_bar/appbar_title.dart';
// import 'package:supercoder_test/src/utils/widgets/custom_text_form_field.dart';
// import 'package:supercoder_test/src/utils/widgets/custom_elevated_button.dart';
// import 'package:flutter/material.dart';
// import 'package:supercoder_test/src/utils/exports.dart';

// class Iphone1314SeventysixScreen extends StatelessWidget {
//   const Iphone1314SeventysixScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         resizeToAvoidBottomInset: false,
//         appBar: _buildAppBar(context),
//         body: SafeArea(
//           child: Container(
//               width: double.maxFinite,
//               padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 16.v),
//               child: Column(
//                   crossAxisAlignment:CrossAxisAlignment.start,
//                   children: [
//                     Row(children: [
//                       CustomImageView(
//                           imagePath: ImageConstant.imgRectangle25760x60,
//                           height: 60.adaptSize,
//                           width: 60.adaptSize,
//                           radius: BorderRadius.circular(30.h)),
//                       Padding(
//                           padding: EdgeInsets.only(
//                               left: 12.h, top: 21.v, bottom: 18.v),
//                           child: Text("Set up character’s profile",
//                               style: CustomTextStyles.titleMediumWhiteA700_1))
//                     ]),
//                     SizedBox(height: 12.v),
//                     _buildComponentSeventeen(context),
//                     SizedBox(height: 12.v),
//                     _buildComponentTwentyNine(context),
//                     SizedBox(height: 12.v),
//                     _buildComponentTwentyNine1(context),
//                     SizedBox(height: 12.v),
//                     _buildComponentThirty(context),
//                     SizedBox(height: 5.v)
//                   ])),
//         ),
//         bottomNavigationBar: _buildFrame(context));
//   }

//   /// Section Widget
//   PreferredSizeWidget _buildAppBar(BuildContext context) {
//     return CustomAppBar(
//         leadingWidth: 40.h,
//         leading: AppbarLeadingImage(
//             imagePath: ImageConstant.imgClose,
//             margin: EdgeInsets.only(left: 16.h),
//             onTap: () {
//               onTapClose(context);
//             }),
//         centerTitle: true,
//         title: const AppbarTitle(text: "Create Character"));
//   }

//   /// Section Widget
//   Widget _buildComponentSeventeen(BuildContext context) {
//     return Container(
//         padding: EdgeInsets.symmetric(vertical: 13.v),
//         decoration: AppDecoration.gray900
//             .copyWith(borderRadius: BorderRadiusStyle.roundedBorder4),
//         child: Row(children: [
//           Text("Username *", style: theme.textTheme.labelLarge),
//           Padding(
//               padding: EdgeInsets.only(left: 32.h),
//               child: Text("Hosino Ai", style: theme.textTheme.bodyMedium))
//         ]));
//   }

//   /// Section Widget
//   Widget _buildComponentTwentyNine(BuildContext context) {
//     return Container(
//         padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 14.v),
//         decoration: AppDecoration.gray900
//             .copyWith(borderRadius: BorderRadiusStyle.roundedBorder4),
//         child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text("Intro *", style: theme.textTheme.labelLarge),
//               SizedBox(height: 10.v),
//               Container(
//                   padding: EdgeInsets.symmetric(horizontal: 12.h),
//                   decoration: AppDecoration.fillPrimaryContainer
//                       .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
//                   child: Column(mainAxisSize: MainAxisSize.min, children: [
//                     SizedBox(height: 14.v),
//                     SizedBox(
//                         width: 307.h,
//                         child: RichText(
//                             text: TextSpan(children: [
//                               TextSpan(
//                                   text:
//                                       "Describe your character's personality and physical features in a few sentences.",
//                                   style: CustomTextStyles.bodyMediumffffffff),
//                               TextSpan(
//                                   text:
//                                       "Describe your character's personality and physical features in a few sentences.Describe your character's personality and physical features in a few sentences.",
//                                   style: CustomTextStyles.bodyMediumffffffff)
//                             ]),
//                             textAlign: TextAlign.left))
//                   ]))
//             ]));
//   }

//   /// Section Widget
//   Widget _buildComponentTwentyNine1(BuildContext context) {
//     final TextEditingController descriptionController = TextEditingController();

//     return Container(
//         padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 14.v),
//         decoration: AppDecoration.gray900
//             .copyWith(borderRadius: BorderRadiusStyle.roundedBorder4),
//         child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text("Intro *", style: theme.textTheme.labelLarge),
//               SizedBox(height: 10.v),
//               CustomTextFormField(
//                   controller: descriptionController,
//                   hintText:
//                       "Describe your character's personality and physical features in a few sentences.Describe your character's personality and physical features in a few sentences.Describe your character's personality and physical features in a few sentences.",
//                   textInputAction: TextInputAction.done,
//                   maxLines: 5,
//                   contentPadding: EdgeInsets.symmetric(horizontal: 12.h))
//             ]));
//   }

//   /// Section Widget
//   Widget _buildComponentThirty(BuildContext context) {
//     return Container(
//         padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 6.v),
//         decoration: AppDecoration.gray900
//             .copyWith(borderRadius: BorderRadiusStyle.roundedBorder4),
//         child: 
// Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                 Text("Voice", style: theme.textTheme.labelLarge),
//                 Text("Edit", style: CustomTextStyles.labelLargePrimary_1)
//               ]),
//               SizedBox(height: 14.v),
//               CustomElevatedButton(
//                   height: 54.v,
//                   text: "Charming lady",
//                   leftIcon: Container(
//                       margin: EdgeInsets.only(right: 8.h),
//                       child: CustomImageView(
//                           imagePath: ImageConstant.imgIconsound,
//                           height: 24.adaptSize,
//                           width: 24.adaptSize)),
//                   buttonStyle: CustomButtonStyles.fillGray,
//                   buttonTextStyle: CustomTextStyles.titleMediumPrimary),
//               SizedBox(height: 1.v)
//             ]));
//   }

//   /// Section Widget
//   Widget _buildFrame(BuildContext context) {
//     return Container(
//         margin: EdgeInsets.only(left: 83.h, right: 12.h, bottom: 57.v),
//         decoration: AppDecoration.fillGray,
//         child: Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Padding(
//                   padding: EdgeInsets.only(top: 12.v, bottom: 11.v),
//                   child:
//                       Text("Back", style: CustomTextStyles.titleMediumPrimary)),
//               CustomElevatedButton(
//                 width: 179.h,
//                 text: "Next",
//                 onPressed: () {
//                   Constants.navigateTo(const SetupCharacterProfile());
//                   // Constants.navigateTo(const Iphone1314FiftyeightScreen());
//                 },
//                 margin: EdgeInsets.only(left: 79.h),
//               )
//             ]));
//   }

//   /// Navigates back to the previous screen.
//   onTapClose(BuildContext context) {
//     Constants.hideLoadingOrNavBack;
//   }
// }
