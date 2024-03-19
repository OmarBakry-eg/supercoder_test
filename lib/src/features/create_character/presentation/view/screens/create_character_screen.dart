import 'package:flutter/material.dart';
import 'package:supercoder_test/src/utils/exports.dart';

class CreateCharacterScreen extends StatelessWidget {
  const CreateCharacterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CreateCharacterCubit createCharacterCubit =
        BlocProvider.of<CreateCharacterCubit>(context);
    return Scaffold(
        appBar: CustomAppBar(
            leadingWidth: 40.h,
            leading: AppbarLeadingImage(
                imagePath: ImageConstant.imgClose,
                margin: EdgeInsets.only(left: 16.h),
                onTap: () {
                  Constants.hideLoadingOrNavBack;
                }),
            centerTitle: true,
            title: const AppbarTitle(text: "Create Character")),
        body: Form(
          key: createCharacterCubit.createCharacterScreenFormKey,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.h, vertical: 16.v),
                  child: Column(children: [
                    Row(children: [
                      CustomImageView(
                          imagePath:
                              createCharacterCubit.selectedGeneratedImageURL,
                          height: 60.adaptSize,
                          width: 60.adaptSize,
                          radius: BorderRadius.circular(30.h)),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 12.h, top: 21.v, bottom: 18.v),
                          child: Text("Set up character’s profile",
                              style: CustomTextStyles.titleMediumWhiteA700_1))
                    ]),
                    SizedBox(height: 12.v),
                    const ComponentSeventeen(),
                    SizedBox(height: 12.v),
                    ComponentTwentyTwo(
                        textEditingController: createCharacterCubit.intro,
                        label: "Intro *",
                        description:
                            "Describe your character's personality and physical features in a few sentences.Describe your character's personality and physical features in a few sentences.Describe your character's personality and physical features in a few sentences."),
                    SizedBox(height: 12.v),
                    const ComponentTwentyFour(),
                    SizedBox(height: 12.v),
                    ComponentTwentyTwo(
                        textEditingController:
                            createCharacterCubit.firstMessage,
                        label: "First Message *",
                        description:
                            "Describe your character's personality and physical features in a few sentences.Describe your character's personality and physical features in a few sentences.Describe your character's personality and physical features in a few sentences."),
                    SizedBox(height: 12.v),
                    const ComponentFifteen(),
                    SizedBox(height: 5.v)
                  ])),
            ),
          ),
        ),
        bottomNavigationBar: Container(
            margin: EdgeInsets.only(
                left: 83.h, right: 12.h, bottom: 57.v, top: 15.v),
            decoration: AppDecoration.fillGray,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 12.v, bottom: 11.v),
                      child: Text("Back",
                          style: CustomTextStyles.titleMediumPrimary)),
                  CustomElevatedButton(
                      width: 179.h,
                      onPressed: () {
                        createCharacterCubit.creatCharacterLogic();
                      },
                      text: "Next",
                      margin: EdgeInsets.only(left: 79.h),
                      buttonStyle: CustomButtonStyles.outlineOnError,
                      buttonTextStyle: CustomTextStyles.titleMediumGray600)
                ])));
  }
}

class ComponentSeventeen extends StatelessWidget {
  const ComponentSeventeen({super.key});

  @override
  Widget build(BuildContext context) {
    final CreateCharacterCubit createCharacterCubit =
        BlocProvider.of<CreateCharacterCubit>(context);
    final theme = Theme.of(context);
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 13.v),
        decoration: AppDecoration.gray900
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder4),
        child: Row(children: [
          Text("Name *", style: theme.textTheme.labelLarge),
          SizedBox(
            width: 4.h,
          ),
          Flexible(
            child: CustomTextFormField(
                validator: (String? v) {
                  if (v == null) {
                    return "This field is required";
                  }
                  return null;
                },
                controller: createCharacterCubit.charName,
                hintText: "Character AI",
                textInputAction: TextInputAction.done,
                contentPadding: EdgeInsets.symmetric(horizontal: 12.h)),
          )
        ]));
  }
}

class ComponentTwentyFour extends StatelessWidget {
  const ComponentTwentyFour({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final CreateCharacterCubit createCharacterCubit =
        BlocProvider.of<CreateCharacterCubit>(context);
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 15.v),
        decoration: AppDecoration.gray900
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder4),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Description *", style: theme.textTheme.labelLarge),
              SizedBox(height: 9.v),
              CustomTextFormField(
                  validator: (String? v) {
                    if (v == null) {
                      return "This field is required";
                    }
                    return null;
                  },
                  controller: createCharacterCubit.descriptionController,
                  hintText:
                      "Describe your character's personality and physical features in a few sentences.Describe your character's personality and physical features in a few sentences.Describe your character's personality and physical features in a few sentences.",
                  textInputAction: TextInputAction.done,
                  maxLines: 4,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.h))
            ]));
  }
}

class ComponentTwentyTwo extends StatelessWidget {
  final String label;
  final String description;
  final TextEditingController textEditingController;

  const ComponentTwentyTwo({
    super.key,
    required this.label,
    required this.description,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 15.v),
        decoration: AppDecoration.gray900
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder4),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: theme.textTheme.labelLarge!
                      .copyWith(color: appTheme.whiteA700)),
              SizedBox(height: 9.v),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.h),
                  decoration: AppDecoration.fillPrimaryContainer
                      .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    SizedBox(height: 14.v),
                    CustomTextFormField(
                        validator: (String? v) {
                          if (v == null) {
                            return "This field is required";
                          }
                          return null;
                        },
                        controller: textEditingController,
                        hintText: description,
                        textInputAction: TextInputAction.done,
                        maxLines: 4,
                        contentPadding: EdgeInsets.symmetric(horizontal: 12.h))
                  ]))
            ]));
  }
}

class ComponentFifteen extends StatelessWidget {
  const ComponentFifteen({super.key});

  @override
  Widget build(BuildContext context) {
    final CreateCharacterCubit createCharacterCubit =
        BlocProvider.of<CreateCharacterCubit>(context);
    return Container(
        width: 366.h,
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 15.v),
        decoration: AppDecoration.gray900
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder4),
        child: BlocBuilder<CreateCharacterCubit, CreateCharacterState>(
          bloc: createCharacterCubit,
          builder: (context, state) {
            return createCharacterCubit.curentSelectedVoice != null
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Voice", style: theme.textTheme.labelLarge),
                              Text("Edit",
                                  style: CustomTextStyles.labelLargePrimary_1)
                            ]),
                        SizedBox(height: 14.v),
                        CustomElevatedButton(
                            onPressed: () {
                              createCharacterCubit.playOrPauseVoice(
                                  createCharacterCubit
                                      .curentSelectedVoice!.referenceVoiceUrl!);
                            },
                            height: 54.v,
                            text: createCharacterCubit
                                    .curentSelectedVoice?.name ??
                                "No name",
                            leftIcon: Container(
                                margin: EdgeInsets.only(right: 8.h),
                                child: CustomImageView(
                                    imagePath: ImageConstant.imgIconsound,
                                    height: 24.adaptSize,
                                    width: 24.adaptSize)),
                            buttonStyle: CustomButtonStyles.fillGray,
                            buttonTextStyle:
                                CustomTextStyles.titleMediumPrimary),
                        SizedBox(height: 1.v)
                      ])
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text("Voice *",
                            style: Theme.of(context).textTheme.labelLarge),
                        SizedBox(height: 16.v),
                        CustomOutlinedButton(
                            width: 95.h,
                            text: "Add Voice",
                            onPressed: () {
                              Constants.navigateTo(const AddVoiceScreen());
                            })
                      ]);
          },
        ).makeWidgetGestureClickable(context, onTap: () {
          Constants.navigateTo(const AddVoiceScreen());
        }));
  }
}
