// import 'package:supercoder_test/src/features/create_character/presentation/view/screens/image_result_screen.dart';
// import 'package:supercoder_test/src/utils/UI/consts.dart';
// import 'package:supercoder_test/src/utils/widgets/app_bar/custom_app_bar.dart';
// import 'package:supercoder_test/src/utils/widgets/app_bar/appbar_leading_image.dart';
// import 'package:supercoder_test/src/utils/widgets/app_bar/appbar_title.dart';
// import 'package:supercoder_test/src/utils/widgets/custom_elevated_button.dart';
// import 'package:flutter/material.dart';
// import 'package:supercoder_test/src/utils/exports.dart';
// import 'package:supercoder_test/src/utils/widgets/custom_text_form_field.dart';

// class Iphone1314SeventyoneScreen extends StatelessWidget {
//   const Iphone1314SeventyoneScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: CustomAppBar(
//             leadingWidth: 40.h,
//             leading: AppbarLeadingImage(
//                 imagePath: ImageConstant.imgClose,
//                 margin: EdgeInsets.only(left: 16.h),
//                 onTap: () {
//                   Constants.hideLoadingOrNavBack;
//                 }),
//             centerTitle: true,
//             title: const AppbarTitle(text: "Create Image")),
//         body: SafeArea(
//           child: Container(
//               width: double.maxFinite,
//               padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 16.v),
//               child: Column(children: [
//                 const ComponentSix(),
//                 SizedBox(height: 12.v),
//                 const ComponentSix1(),
//                 SizedBox(height: 5.v)
//               ])),
//         ),
//         bottomNavigationBar: Container(
//             margin: EdgeInsets.only(left: 12.h, right: 12.h, bottom: 57.v),
//             decoration: AppDecoration.fillGray,
//             child: CustomElevatedButton(
//               text: "Generate",
//               onPressed: () {
//                 Constants.hideLoadingOrNavBack;
//                 Constants.navigateTo(const ImageResultScreen(),
//                     fullscreenDialog: true);
//               },
//             )));
//   }
// }

// class ComponentSix1 extends StatelessWidget {
//   const ComponentSix1({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final TextEditingController nameController = TextEditingController(
//         text:
//             "e.g. soft moonlight, a girl in red velvet dress, silver hair, wide angle, anime style");
//     return Container(
//         padding: EdgeInsets.all(16.h),
//         decoration: AppDecoration.gray900
//             .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
//         child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(height: 3.v),
//               Text("Image Prompt (Optional)",
//                   style: theme.textTheme.labelLarge),
//               SizedBox(height: 12.v),
//               CustomTextFormField(
//                   textStyle: CustomTextStyles.bodyMediumGray600
//                       .copyWith(color: Colors.white),
//                   controller: nameController,
//                   hintText:
//                       "e.g. soft moonlight, a girl in red velvet dress, silver hair, wide angle, anime style",
//                   hintStyle: CustomTextStyles.bodyMediumErrorContainer,
//                   textInputAction: TextInputAction.done,
//                   maxLines: 7,
//                   borderDecoration:
//                       TextFormFieldStyleHelper.fillPrimaryContainerTL16,
//                   fillColor:
//                       theme.colorScheme.primaryContainer.withOpacity(0.33))
//             ]));
//   }
// }

// class ComponentSix extends StatelessWidget {
//   const ComponentSix({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 14.v),
//         decoration: AppDecoration.gray900
//             .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
//         child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                 Padding(
//                     padding: EdgeInsets.only(top: 1.v),
//                     child: Text("Face Image (Optional)",
//                         style: theme.textTheme.labelLarge)),
//                 Text("Clear", style: theme.textTheme.bodyMedium)
//               ]),
//               SizedBox(height: 9.v),
//               CustomImageView(
//                   imagePath: ImageConstant.imgRectangle256,
//                   height: 188.adaptSize,
//                   width: 188.adaptSize,
//                   radius: BorderRadius.circular(16.h))
//             ]));
//   }
// }
