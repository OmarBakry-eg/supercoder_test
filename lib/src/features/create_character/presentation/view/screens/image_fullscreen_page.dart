import 'package:flutter/material.dart';
import 'package:supercoder_test/src/utils/exports.dart';

class ImageFullScreenPage extends StatelessWidget {
  final String image;
  const ImageFullScreenPage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              CustomImageView(
                imagePath: image, //ImageConstant.imgGroup80,
                height: 650.v,
                width: 390.h,
              ),
              SizedBox(height: 53.v),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 83.h,
                    right: 12.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 12.v,
                          bottom: 11.v,
                        ),
                        child: Text(
                          "Back",
                          style: CustomTextStyles.titleMediumPrimary,
                        ),
                      ),
                      CustomElevatedButton(
                        width: 170.h,
                        text: "Select",
                        onPressed: () {
                          Constants.navigateTo(const CreateCharacterScreen());
                        },
                        margin: EdgeInsets.only(left: 79.h),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }
}
