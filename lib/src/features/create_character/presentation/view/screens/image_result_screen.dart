import 'package:flutter/material.dart';
import 'package:supercoder_test/src/utils/exports.dart';

class ImageResultScreen extends StatefulWidget {
  const ImageResultScreen({super.key});

  @override
  State<ImageResultScreen> createState() => _ImageResultScreenState();
}

class _ImageResultScreenState extends State<ImageResultScreen> {
  late CreateCharacterCubit createCharacterCubit;

  @override
  void initState() {
    super.initState();
    createCharacterCubit = BlocProvider.of<CreateCharacterCubit>(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    createCharacterCubit.getGeneratedImage();
  }

  @override
  Widget build(BuildContext context) {
    final CreateCharacterCubit createCharacterCubit =
        BlocProvider.of<CreateCharacterCubit>(context);
    return Scaffold(
        backgroundColor: appTheme.gray90001,
        appBar: CustomAppBar(
            leadingWidth: 40.h,
            leading: AppbarLeadingImage(
                imagePath: ImageConstant.imgClose,
                margin: EdgeInsets.only(left: 16.h),
                onTap: () {
                  Constants.hideLoadingOrNavBack;
                }),
            centerTitle: true,
            title: const AppbarTitle(text: "Result")),
        body: SafeArea(
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 16.h,
              vertical: 22.v,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Generated Result",
                    style: CustomTextStyles.titleMediumSecondaryContainer,
                  ),
                  SizedBox(height: 13.v),
                  BlocBuilder<CreateCharacterCubit, CreateCharacterState>(
                    bloc: createCharacterCubit,
                    builder: (context, state) {
                      return GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 208.v,
                          crossAxisCount: 3,
                          mainAxisSpacing: 4.h,
                          crossAxisSpacing: 4.h,
                        ),
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state is GeneratedImagesUploading
                            ? 6
                            : createCharacterCubit.generatedImages?.length,
                        itemBuilder: (context, index) {
                          return ImageWidget(
                            image: createCharacterCubit.generatedImages?[index],
                          );
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: CustomElevatedButton(
          text: "Pick",
          onPressed: () {
            //    Constants.hideLoadingOrNavBack;
            if (createCharacterCubit.selectedGeneratedImageURL == null) {
              Constants.showSnackBar(content: "Please select an image");
              return;
            }
            Constants.navigateTo(ImageFullScreenPage(
                image: createCharacterCubit.selectedGeneratedImageURL!));
          },
          margin: EdgeInsets.only(
            left: 12.h,
            right: 12.h,
            bottom: 57.v,
          ),
        ));
  }
}
