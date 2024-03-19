import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supercoder_test/src/features/create_character/presentation/cubit/create_character_cubit.dart';
import 'package:supercoder_test/src/utils/enum.dart';
import 'package:supercoder_test/src/utils/exports.dart' as ex;
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
      backgroundColor: ex.appTheme.gray90001,
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
              ex.CustomElevatedButton(
                height: 48.v,
                text: "Start",
                onPressed: () {
                  ex.Constants.navigateTo(const ex.CreateImageScreen(),
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
            image: ex.ImageConstant.imgRectangle253,
            name: CharacterGender.boy.nameUpper),
        const SizedBox(width: 12),
        BuildCardImageGeneration(
            image: ex.ImageConstant.imgRectangle25369x70,
            name: CharacterGender.girl.nameUpper),
        const SizedBox(width: 12),
        BuildCardImageGeneration(
            image: ex.ImageConstant.imgRectangle2531,
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
            decoration: ex.AppDecoration.outlinePrimary.copyWith(
                borderRadius: ex.BorderRadiusStyle.roundedBorder16,
                border: createCharacterCubit.selectedGender ==
                        CharacterGender.getChar(name)
                    ? null
                    : Border.all(width: 1.h, color: ex.appTheme.gray900)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 2),
                ex.CustomImageView(
                  imagePath: image,
                  height: 69.v,
                  width: 70.h,
                ),
                const SizedBox(height: 10),
                Text(
                  name,
                  style: ex.CustomTextStyles.titleMediumGray600.copyWith(
                    color: createCharacterCubit.selectedGender ==
                            CharacterGender.getChar(name)
                        ? ex.theme.colorScheme.primary
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
