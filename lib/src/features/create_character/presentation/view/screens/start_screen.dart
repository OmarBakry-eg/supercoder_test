import 'package:supercoder_test/src/utils/exports.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  late CreateCharacterCubit createCharacterCubit;

  @override
  void initState() {
    super.initState();
    createCharacterCubit = BlocProvider.of<CreateCharacterCubit>(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    createCharacterCubit.initCubit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray90001,
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 12.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 12.v),
              const BuildFrame(),
              SizedBox(height: 28.v),
              CustomElevatedButton(
                height: 48.v,
                text: "Start",
                onPressed: () {
                  if (createCharacterCubit.selectedGender == null) {
                    Constants.showSnackBar(
                        content:
                            "You can't start without selecting a character");
                    return;
                  }
                  Constants.navigateTo(const CreateImageScreen(),
                      fullscreenDialog: true);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildFrame extends StatelessWidget {
  const BuildFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BuildCardImageGeneration(
            image: ImageConstant.imgRectangle253,
            name: CharacterGender.boy.nameUpper),
        const SizedBox(width: 12),
        BuildCardImageGeneration(
            image: ImageConstant.imgRectangle25369x70,
            name: CharacterGender.girl.nameUpper),
        const SizedBox(width: 12),
        BuildCardImageGeneration(
            image: ImageConstant.imgRectangle2531,
            name: CharacterGender.nonBinary.nameUpper),
      ],
    );
  }
}

class BuildCardImageGeneration extends StatelessWidget {
  final String image;
  final String name;

  const BuildCardImageGeneration({
    super.key,
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final CreateCharacterCubit createCharacterCubit =
        BlocProvider.of<CreateCharacterCubit>(context);
    return SizedBox(
      width: 110.h,
      height: 200.v,
      child: BlocBuilder<CreateCharacterCubit, CreateCharacterState>(
        bloc: createCharacterCubit,
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.h,
              vertical: 27.v,
            ),
            decoration: createCharacterCubit.selectedGender !=
                    CharacterGender.getChar(name)
                ? AppDecoration.outlineGray.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder16,
                  )
                : AppDecoration.outlinePrimary.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder16,
                  ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 2),
                CustomImageView(
                  imagePath: image,
                  height: 69.v,
                  width: 70.h,
                ),
                const SizedBox(height: 10),
                Text(
                  name,
                  style: CustomTextStyles.titleMediumGray600.copyWith(
                    color: createCharacterCubit.selectedGender ==
                            CharacterGender.getChar(name)
                        ? theme.colorScheme.primary
                        : null,
                  ),
                ),
              ],
            ),
          ).makeWidgetGestureClickable(context, onTap: () {
            createCharacterCubit.selectGender(name);
          });
        },
      ),
    );
  }
}
