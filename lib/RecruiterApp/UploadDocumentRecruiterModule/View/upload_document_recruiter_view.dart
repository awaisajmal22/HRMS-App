import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Constant/AppBar/custom_app_bar.dart';
import '../../../Constant/AppButton/text_button.dart';
import '../../../Constant/AppColors/colors.dart';
import '../../../Constant/AppText/app_text.dart';
import '../ViewModel/upload_document_recruiter_view_model.dart';

class UploadDocumentRecruiterView extends StatelessWidget {
  UploadDocumentRecruiterView({super.key});
  int check = Get.arguments;
  final uploadDocumentVM = Get.find<UploadDocumentRecruiterViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          customAppBar(
            onTap: (){
              Get.back();
            },
            title: 'Upload Document',
            isBackButton: true,
          ),
          SizedBox(height: 28.h),
          Expanded(
            child: CameraTabBar(uploadDocVM: uploadDocumentVM),
          ),
        ],
      ),
    );
  }

  Widget CameraTabBar({required UploadDocumentRecruiterViewModel uploadDocVM}) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 46.w),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: appText(
                fontSize: 18,
                title: 'Select Document',
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Obx(
              () => Container(
                height: 360.h,
                decoration: BoxDecoration(
                    image: uploadDocVM.parkingimage.value != '' ||
                            uploadDocVM.parkingimage.value != null ||
                            uploadDocVM.generalExpImage.value != '' ||
                            uploadDocVM.generalExpImage.value != null
                        ? DecorationImage(
                            image: FileImage(check == 0
                                ? File(uploadDocVM.parkingimage.value)
                                : File(uploadDocVM.generalExpImage.value)))
                        : null,
                    color: AppColor.black.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(6)),
                child: uploadDocVM.parkingimage.value != '' ||
                        uploadDocVM.parkingimage.value != null ||
                        uploadDocVM.generalExpImage.value != '' ||
                        uploadDocVM.generalExpImage.value != null
                    ? null
                    : Center(
                        child: appText(title: 'Document Image', fontSize: 16)),
              ),
            ),
            SizedBox(
              height: 38.h,
            ),
            customTextButton(
                onTap: () {
                  if (check == 0) {
                    uploadDocVM.parkingTravelPickImage(ImageSource.gallery);
                  }
                  if (check == 1) {
                    uploadDocVM.generalExpPickImage(ImageSource.gallery);
                  }
                },
                title: 'Choose from Gallery',
                borderColor: AppColor.black,
                buttonColor: AppColor.white,
                textColor: AppColor.black),
            SizedBox(
              height: 8.h,
            ),
            customTextButton(
              title: 'Take Photo',
              onTap: () {
                if (check == 0) {
                  uploadDocVM.parkingTravelPickImage(ImageSource.camera);
                }
                if (check == 1) {
                  uploadDocVM.generalExpPickImage(ImageSource.camera);
                }
              },
              buttonColor: AppColor.blue,
            ),
            SizedBox(
              height: 12.h,
            ),
          ],
        ));
  }
}
