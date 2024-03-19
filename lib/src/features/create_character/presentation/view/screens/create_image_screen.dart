import 'package:flutter/material.dart';
import 'package:supercoder_test/src/utils/exports.dart';

class CreateImageScreen extends StatelessWidget {
  const CreateImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
            leadingWidth: 40.h,
            leading: AppbarLeadingImage(
                imagePath: ImageConstant.imgClose,
                margin: EdgeInsets.only(left: 16.h),
                onTap: () {
                  Constants.hideLoadingOrNavBack;
                }),
            centerTitle: true,
            title: const AppbarTitle(text: "Create Image")),
        body: SafeArea(
          child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 16.v),
              child: Column(children: [
                const ComponentSix(),
                SizedBox(height: 12.v),
                const ComponentSix1(),
                SizedBox(height: 5.v)
              ])),
        ),
        bottomNavigationBar: Container(
            margin: EdgeInsets.only(left: 12.h, right: 12.h, bottom: 57.v),
            decoration: AppDecoration.fillGray,
            child: CustomElevatedButton(
              text: "Generate",
              onPressed: () {
                Constants.navigateTo(const ImageResultScreen(),
                    fullscreenDialog: true);
              },
            )));
  }
}

class ComponentSix extends StatelessWidget {
  const ComponentSix({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final CreateCharacterCubit createCharacterCubit =
        BlocProvider.of<CreateCharacterCubit>(context);
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 15.v),
        decoration: AppDecoration.gray900
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
        child: BlocBuilder<CreateCharacterCubit, CreateCharacterState>(
          bloc: createCharacterCubit,
          builder: (context, state) {
            return createCharacterCubit.selectedImageURL != null
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(top: 1.v),
                                  child: Text("Face Image (Optional)",
                                      style: theme.textTheme.labelLarge)),
                              Text("Clear", style: theme.textTheme.bodyMedium)
                            ]),
                        SizedBox(height: 9.v),
                        CustomImageView(
                            imagePath: createCharacterCubit.selectedImageURL,
                            height: 188.adaptSize,
                            width: 188.adaptSize,
                            radius: BorderRadius.circular(16.h))
                      ])
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text("Face Image (Optional)",
                            style: theme.textTheme.labelLarge),
                        SizedBox(height: 9.v),
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 105.h, vertical: 42.v),
                            decoration: AppDecoration.fillPrimaryContainer1
                                .copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder16),
                            child: state is SelectAndUploadFile
                                ? const Center(
                                    child: CircularProgressIndicator.adaptive(),
                                  )
                                : Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                        SizedBox(height: 3.v),
                                        CustomImageView(
                                            imagePath: ImageConstant
                                                .imgIconFaceManShimmer,
                                            height: 44.adaptSize,
                                            width: 44.adaptSize),
                                        SizedBox(height: 14.v),
                                        SizedBox(
                                            width: 123.h,
                                            child: Text(
                                                "Upload a face image\nto imitate its features",
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: CustomTextStyles
                                                    .bodyMediumErrorContainer
                                                    .copyWith(height: 1.50)))
                                      ]))
                      ]);
          },
        ).makeWidgetGestureClickable(context, onTap: () {
          createCharacterCubit.selectAndUploadFile();
        }));
  }
}

class ComponentSix1 extends StatelessWidget {
  const ComponentSix1({super.key});

  @override
  Widget build(BuildContext context) {
    final CreateCharacterCubit createCharacterCubit =
        BlocProvider.of<CreateCharacterCubit>(context);
    final theme = Theme.of(context);
    return Container(
        padding: EdgeInsets.all(16.h),
        decoration: AppDecoration.gray900
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 3.v),
              Text("Image Prompt (Optional)",
                  style: theme.textTheme.labelLarge),
              SizedBox(height: 12.v),
              CustomTextFormField(
                  textStyle: CustomTextStyles.bodyMediumGray600
                      .copyWith(color: Colors.white),
                  controller: createCharacterCubit.imagePrompt,
                  hintText:
                      "e.g. soft moonlight, a girl in red velvet dress, silver hair, wide angle, anime style",
                  hintStyle: CustomTextStyles.bodyMediumErrorContainer,
                  textInputAction: TextInputAction.done,
                  maxLines: 7,
                  borderDecoration:
                      TextFormFieldStyleHelper.fillPrimaryContainerTL16,
                  fillColor:
                      theme.colorScheme.primaryContainer.withOpacity(0.33))
            ]));
  }
}
