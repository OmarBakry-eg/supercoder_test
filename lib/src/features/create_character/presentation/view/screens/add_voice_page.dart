import 'package:flutter/material.dart';
import 'package:supercoder_test/src/utils/exports.dart';

class AddVoiceScreen extends StatefulWidget {
  const AddVoiceScreen({super.key});

  @override
  State<AddVoiceScreen> createState() => _AddVoiceScreenState();
}

class _AddVoiceScreenState extends State<AddVoiceScreen> {
  late CreateCharacterCubit createCharacterCubit;

  @override
  void initState() {
    super.initState();
    createCharacterCubit = BlocProvider.of<CreateCharacterCubit>(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    createCharacterCubit.getVoiceList();
  }

  @override
  Widget build(BuildContext context) {
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
            title: const AppbarTitle(text: "Create Voice")),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 16.v),
                child: Column(children: [
                  SizedBox(height: 16.v),
                  const BuildComponentTen(),
                  //SizedBox(height: 16.v),
                  //const Spacer()
                ])),
          ),
        ),
        bottomNavigationBar: Container(
            margin: EdgeInsets.only(
                left: 83.h, right: 12.h, bottom: 57.v, top: 11.v),
            decoration: AppDecoration.fillGray,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                          padding: EdgeInsets.only(top: 12.v, bottom: 11.v),
                          child: Text("Back",
                              style: CustomTextStyles.titleMediumPrimary))
                      .makeWidgetGestureClickable(context, onTap: () {
                    Constants.hideLoadingOrNavBack;
                  }),
                  CustomElevatedButton(
                      onPressed: () {
                        if (createCharacterCubit.curentSelectedVoice == null) {
                          Constants.showSnackBar(
                              content:
                                  "You can't move forward without selecting a voice");
                          return;
                        }
                        Constants.hideLoadingOrNavBack;
                      },
                      width: 170.h,
                      text: "Next",
                      margin: EdgeInsets.only(left: 79.h))
                ])));
  }
}

class BuildComponentTen extends StatelessWidget {
  const BuildComponentTen({super.key});

  @override
  Widget build(BuildContext context) {
    final CreateCharacterCubit createCharacterCubit =
        BlocProvider.of<CreateCharacterCubit>(context);
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 15.v),
        decoration: AppDecoration.gray900
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Voice Library",
                  style: CustomTextStyles.titleMediumWhiteA700_1),
              SizedBox(height: 16.v),
              BlocBuilder<CreateCharacterCubit, CreateCharacterState>(
                  bloc: createCharacterCubit,
                  builder: (context, state) {
                    return state is VoicesLoading
                        ? const Center(
                            child: CircularProgressIndicator.adaptive(),
                          )
                        : state is CreateCharacterError
                            ? Center(
                                child: Text(
                                  state.message,
                                  style: theme.textTheme.titleSmall,
                                ),
                              )
                            : Column(
                                children:
                                    createCharacterCubit.voicesModel!.data!
                                        .map(
                                          (e) => Frame(
                                              data: e,
                                              iconPlay: ImageConstant
                                                  .imgIconPlay27x27, //ImageConstant.imgPauseCircleFilled,
                                              checkRound: ImageConstant
                                                  .imgCheckRoundPrimary),
                                        )
                                        .toList());
                  }),
            ]));
  }
}

class Frame extends StatelessWidget {
  final String iconPlay, checkRound;
  final VoiceData? data;

  const Frame({
    super.key,
    required this.iconPlay,
    required this.data,
    required this.checkRound,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final CreateCharacterCubit createCharacterCubit =
        BlocProvider.of<CreateCharacterCubit>(context);
    return Container(
        padding: EdgeInsets.only(top: 11.v, bottom: 10.v),
        decoration: AppDecoration.outlineGray90002,
        child: Row(children: [
          BlocBuilder<CreateCharacterCubit, CreateCharacterState>(
            bloc: createCharacterCubit,
            builder: (context, state) {
              return CustomImageView(
                      imagePath: state is PlayVoice &&
                              state.url == data?.referenceVoiceUrl
                          ? ImageConstant.imgPauseCircleFilled
                          : ImageConstant.imgIconPlay27x27,
                      height: 27.adaptSize,
                      width: 27.adaptSize,
                      margin: EdgeInsets.only(bottom: 12.v))
                  .makeWidgetGestureClickable(context, onTap: () {
                createCharacterCubit.playOrPauseVoice(data!.referenceVoiceUrl!);
              });
            },
          ),
          Padding(
              padding: EdgeInsets.only(left: 12.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data?.name ?? "unknown",
                        style: theme.textTheme.labelLarge!
                            .copyWith(color: appTheme.whiteA700)),
                    SizedBox(height: 5.v),
                    SizedBox(
                        //   width: 157.h,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                          Container(
                              // width: 51.h,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6.h, vertical: 1.v),
                              decoration: AppDecoration.fillPrimary.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder4),
                              child: Text(
                                  "{${data?.gender?.name ?? "unknown"}}",
                                  style: theme.textTheme.bodySmall!
                                      .copyWith(color: appTheme.whiteA700))),
                          SizedBox(width: 5.h),
                          Container(
                              //  width: 36.h,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6.h, vertical: 1.v),
                              decoration: AppDecoration.fillPrimary.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder4),
                              child: Text("{${data?.age?.name ?? "unknown"}}",
                                  style: theme.textTheme.bodySmall!
                                      .copyWith(color: appTheme.whiteA700))),
                          SizedBox(width: 5.h),
                          Container(
                              // width: 62.h,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6.h, vertical: 1.v),
                              decoration: AppDecoration.fillPrimary.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder4),
                              child: Text("{${data?.style?.name ?? "unknown"}}",
                                  style: theme.textTheme.bodySmall!
                                      .copyWith(color: appTheme.whiteA700)))
                        ]))
                  ])),
          const Spacer(),
          BlocBuilder<CreateCharacterCubit, CreateCharacterState>(
            bloc: createCharacterCubit,
            builder: (context, state) {
              return CustomImageView(
                  imagePath: createCharacterCubit.curentSelectedVoice == data
                      ? ImageConstant.imgCheckRoundPrimary
                      : ImageConstant.imgCheckRound,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  margin: EdgeInsets.symmetric(vertical: 7.v));
            },
          ).makeWidgetGestureClickable(context, onTap: () {
            createCharacterCubit.selectVoice(data);
          })
        ]));
  }
}
