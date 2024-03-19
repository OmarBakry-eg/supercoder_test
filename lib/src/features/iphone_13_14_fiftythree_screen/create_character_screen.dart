// import 'package:flutter/material.dart';
// import 'package:supercoder_test/src/utils/exports.dart';

// class CreateCharacterScreen extends StatelessWidget {
//   const CreateCharacterScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         resizeToAvoidBottomInset: false,
//         appBar: _buildAppBar(context),
//         body: SafeArea(
//           child: Container(
//               width: double.maxFinite,
//               padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 16.v),
//               child: Column(children: [
//                 _buildComponentSeventeen(context),
//                 SizedBox(height: 12.v),
//                 _buildComponentTwentyTwo(context,
//                     label: "Intro *",
//                     description:
//                         "Describe your character's personality and physical features in a few sentences.Describe your character's personality and physical features in a few sentences.Describe your character's personality and physical features in a few sentences."),
//                 SizedBox(height: 12.v),
//                 _buildComponentTwentyFour(context),
//                 SizedBox(height: 12.v),
//                 _buildComponentTwentyTwo(context,
//                     label: "First Message *",
//                     description:
//                         "Describe your character's personality and physical features in a few sentences.Describe your character's personality and physical features in a few sentences.Describe your character's personality and physical features in a few sentences."),
//                 SizedBox(height: 12.v),
//                 _buildComponentFifteen(context),
//                 SizedBox(height: 5.v)
//               ])),
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
//         padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 13.v),
//         decoration: AppDecoration.gray900
//             .copyWith(borderRadius: BorderRadiusStyle.roundedBorder4),
//         child: Row(children: [
//           Text("Name *", style: theme.textTheme.labelLarge),
//           Padding(
//               padding: EdgeInsets.only(left: 32.h),
//               child: Text("Hosino Ai", style: theme.textTheme.bodyMedium))
//         ]));
//   }

//   /// Section Widget
//   Widget _buildComponentTwentyFour(BuildContext context) {
//     final TextEditingController descriptionController = TextEditingController();

//     return Container(
//         padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 15.v),
//         decoration: AppDecoration.gray900
//             .copyWith(borderRadius: BorderRadiusStyle.roundedBorder4),
//         child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("Description *", style: theme.textTheme.labelLarge),
//               SizedBox(height: 9.v),
//               CustomTextFormField(
//                   controller: descriptionController,
//                   hintText:
//                       "Describe your character's personality and physical features in a few sentences.Describe your character's personality and physical features in a few sentences.Describe your character's personality and physical features in a few sentences.",
//                   textInputAction: TextInputAction.done,
//                   maxLines: 4,
//                   contentPadding: EdgeInsets.symmetric(horizontal: 12.h))
//             ]));
//   }

//   /// Section Widget
//   Widget _buildComponentFifteen(BuildContext context) {
//     return Container(
//         width: 366.h,
//         padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 15.v),
//         decoration: AppDecoration.gray900
//             .copyWith(borderRadius: BorderRadiusStyle.roundedBorder4),
//         child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("Voice *", style: theme.textTheme.labelLarge),
//               SizedBox(height: 16.v),
//               CustomOutlinedButton(
//                   width: 95.h,
//                   text: "Add Voice",
//                   onPressed: () {
//                     Constants.navigateTo(const AddVoiceScreen());
//                   })
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
//                   width: 179.h,
//                   text: "Next",
//                   margin: EdgeInsets.only(left: 79.h),
//                   buttonStyle: CustomButtonStyles.outlineOnError,
//                   buttonTextStyle: CustomTextStyles.titleMediumGray600)
//             ]));
//   }

//   /// Common widget
//   Widget _buildComponentTwentyTwo(
//     BuildContext context, {
//     required String label,
//     required String description,
//   }) {
//     return Container(
//         padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 15.v),
//         decoration: AppDecoration.gray900
//             .copyWith(borderRadius: BorderRadiusStyle.roundedBorder4),
//         child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(label,
//                   style: theme.textTheme.labelLarge!
//                       .copyWith(color: appTheme.whiteA700)),
//               SizedBox(height: 9.v),
//               Container(
//                   padding: EdgeInsets.symmetric(horizontal: 12.h),
//                   decoration: AppDecoration.fillPrimaryContainer
//                       .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
//                   child: Column(mainAxisSize: MainAxisSize.min, children: [
//                     SizedBox(height: 14.v),
//                     SizedBox(
//                         width: 307.h,
//                         child: Text(description,
//                             maxLines: 4,
//                             overflow: TextOverflow.ellipsis,
//                             style: theme.textTheme.bodyMedium!.copyWith(
//                                 color: appTheme.whiteA700, height: 1.50)))
//                   ]))
//             ]));
//   }

//   /// Navigates back to the previous screen.
//   onTapClose(BuildContext context) {
//     Constants.hideLoadingOrNavBack;
//   }
// }
