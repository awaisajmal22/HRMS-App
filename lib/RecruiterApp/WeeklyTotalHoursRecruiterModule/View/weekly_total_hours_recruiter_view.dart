import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrmsapp/RecruiterApp/WeeklyWorkSummaryRecruiterModule/Model/weekly_work_summary_recruiter_model.dart';

import '../../../Constant/AppBar/custom_app_bar.dart';
import '../../../Constant/AppButton/text_button.dart';
import '../../../Constant/AppColors/colors.dart';
import '../../../Constant/AppDialogs/calender.dart';
import '../../../Constant/AppDialogs/sucessfully_hours_submit_dialog.dart';
import '../../../Constant/AppText/app_text.dart';
import '../../../Constant/AppTextField/app_textfield.dart';
import '../../../Constant/AppTextField/comment_formfield.dart';
import '../../../Constant/DropDownFormField/drop_down_form_field.dart';
import '../../../RoutesAndBindings/app_routes.dart';
import '../../../Utils/spint_kit_view_spinner.dart';
import '../../HomeRecruiterModule/ViewModel/home_recruiter_view_model.dart';
import '../../UploadDocumentRecruiterModule/ViewModel/upload_document_recruiter_view_model.dart';
import '../../WeeklyWorkSummaryRecruiterModule/ViewModel/weekly_work_summary_recruiter_view_model.dart';
import '../ViewModel/weeklytotal_recruiter_view_model.dart';

class WeeklyTotalHoursRecruiterView extends StatelessWidget {
  // WeeklyTotalHoursRecruiterView({super.key});
  final weeklytotalVM = Get.find<WeeklyTotalHoursRecruiterViewModel>();
  final uploadImageVM = Get.find<UploadDocumentRecruiterViewModel>();
  final homeVM = Get.put(HomeRecruiterViewModel());
  int workerId = Get.arguments;
  final weeklySummaryVM = Get.put(WeeklyWorkSummaryRecruiterViewModel());
  @override
  Widget build(BuildContext context) {
    homeVM.getSpecificWorkerData().then((val) =>
        homeVM.getRecruiterJobSite(reload: true, workerId: int.parse(val.id)));
    return Scaffold(
      body: Column(
        children: [
          customAppBar(
            onTap: () {
              Get.back();
            },
            isBackButton: true,
            title: 'Submit Weekly Total Hours',
          ),
          SizedBox(
            height: 7.h,
          ),
          Obx(
            () => SizedBox(
              height: weeklytotalVM.isKeyboard.value
                  ? MediaQuery.of(context).size.height * 0.60
                  : MediaQuery.of(context).size.height * 0.885,
              child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.blue.withOpacity(0.2)),
                            child: Obx(
                              () => appText(
                                title:
                                    "${homeVM.worker.value.firstName} ${homeVM.worker.value.lastName}",
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          appText(
                            title: 'Please add hours worked',
                            fontSize: 20,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          appText(
                            title: 'Pay Period',
                            fontSize: 16,
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: AppColor.black.withOpacity(0.16),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: AppColor.black.withOpacity(0.3)),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 18.h),
                            child: Obx(
                              () => appText(
                                title:
                                    '${homeVM.startDate.value} to ${homeVM.endDate.value}',
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                textColor: AppColor.black.withOpacity(0.55),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          appText(
                            title: 'Select Job Site',
                            fontSize: 16,
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Obx(
                            () => AppDropdownInput(
                                options: homeVM.jobSiteValue,
                                value: homeVM.selectedDropDownValue.value,
                                onChanged: (value) {
                                  homeVM.selectedDropDownValue.value = value;
                                  for (var data in homeVM.jobSites) {
                                    if (data.value == value) {
                                      homeVM.selectedJobsiteId.value = data.id;
                                    }
                                  }
                                }),
                          ),
                        ],
                      ),
                      SizedBox(height: 11.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: appText(
                                  textAlign: TextAlign.left,
                                  title: 'Total Hours',
                                  fontSize: 16,
                                  // fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              customTextField(
                                hintText: '',
                                controller: weeklytotalVM.totalHoursController,
                                textInputType: TextInputType.number,
                              ),
                              SizedBox(height: 18.h),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                          text: 'Parking/Travel ',
                                          style: GoogleFonts.roboto().copyWith(
                                            color: AppColor.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: '(Optional)',
                                              style:
                                                  GoogleFonts.roboto().copyWith(
                                                color: AppColor.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ]),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppColor.black
                                                .withOpacity(0.10),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      alignment: Alignment.centerRight,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 8.h,
                                        horizontal: 12.w,
                                      ),
                                      height: 40.h,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: customTextField(
                                                verticalPadding: 0,
                                                horizontalPadding: 0,
                                                textInputType:
                                                    TextInputType.number,
                                                hintText: '',
                                                controller: weeklytotalVM
                                                    .parkingTravelController,
                                                borderColor: Colors.transparent,
                                                opacity: 0),
                                          ),
                                          Container(
                                            width: 1.w,
                                            color: AppColor.black
                                                .withOpacity(0.30),
                                          ),
                                          SizedBox(
                                            width: 13.w,
                                          ),
                                          GestureDetector(
                                              onTap: () {
                                                Get.toNamed(
                                                    AppRoutes
                                                        .uploadDocumentRecruiterView,
                                                    arguments: 0);
                                              },
                                              child: SvgPicture.asset(
                                                  'assets/icons/camera.svg')),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 6.w,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 12.h),
                                height: 1.h,
                                width: 8.w,
                                color: AppColor.black,
                              ),
                              SizedBox(
                                width: 6.w,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                          text: 'General expenses ',
                                          style: GoogleFonts.roboto().copyWith(
                                            color: AppColor.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: '(Optional)',
                                              style:
                                                  GoogleFonts.roboto().copyWith(
                                                color: AppColor.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ]),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppColor.black
                                                .withOpacity(0.10),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      alignment: Alignment.centerRight,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 8.h,
                                        horizontal: 12.w,
                                      ),
                                      height: 40.h,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Expanded(
                                            child: customTextField(
                                                verticalPadding: 0,
                                                horizontalPadding: 0,
                                                textInputType:
                                                    TextInputType.number,
                                                hintText: '',
                                                controller: weeklytotalVM
                                                    .generalExpController,
                                                borderColor: Colors.transparent,
                                                opacity: 0),
                                          ),
                                          Container(
                                            width: 1.w,
                                            color: AppColor.black
                                                .withOpacity(0.30),
                                          ),
                                          SizedBox(
                                            width: 13.w,
                                          ),
                                          GestureDetector(
                                              onTap: () {
                                                Get.toNamed(
                                                    AppRoutes
                                                        .uploadDocumentRecruiterView,
                                                    arguments: 1);
                                              },
                                              child: SvgPicture.asset(
                                                  'assets/icons/camera.svg')),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 11.h,
                          ),
                          appText(
                              title: 'Comments/Additional Notes', fontSize: 14),
                          customCommentTextField(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            height: 100,
                            maxLines: 6,
                            hintText: 'Write here.....',
                            controller: weeklytotalVM.commentController,
                            textInputType: TextInputType.text,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        // padding: EdgeInsets.only(
                        //     left: 18.w, right: 18.w, bottom: 32.h),
                        child: Column(
                          children: [
                            customTextButton(
                              buttonColor: AppColor.blue,
                              title: 'Add',
                              onTap: () async {
                                if (weeklytotalVM
                                    .totalHoursController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'Please fill the required fields')));
                                } else if (homeVM.selectedJobsiteId.value ==
                                        -1010 ||
                                    homeVM.selectedDropDownValue.value ==
                                        'Select job site' ||
                                    homeVM.selectedDropDownValue.value == '') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text('Please Select job Site')));
                                } else if (weeklytotalVM
                                        .totalHoursController.text ==
                                    '0') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'Total hours must be greater than 0')));
                                } else {
                                  showLoadingIndicator(context: context);
                                  bool isSuccess = await weeklytotalVM
                                      .submitWeeklyRecruiterHour(
                                    workerId: workerId,
                                    generalExpValue: weeklytotalVM
                                                .generalExpController.text !=
                                            ''
                                        ? double.parse(weeklytotalVM
                                            .generalExpController.text)
                                        : 0.0,
                                    parkingTravelValue: weeklytotalVM
                                            .parkingTravelController
                                            .text
                                            .isNotEmpty
                                        ? double.parse(weeklytotalVM
                                            .parkingTravelController.text)
                                        : 0.0,
                                    jobSiteID: homeVM.selectedJobsiteId.value,
                                    startDate: weeklytotalVM.startDate.value,
                                    endDate: weeklytotalVM.endDate.value,
                                    totalHours: weeklytotalVM
                                            .totalHoursController
                                            .text
                                            .isNotEmpty
                                        ? double.parse(weeklytotalVM
                                            .totalHoursController.text)
                                        : 0.0,
                                    jobSite: homeVM.selectedDropDownValue.value,
                                    feedBack:
                                        weeklytotalVM.commentController.text,
                                    generalExpImage:
                                        uploadImageVM.parkingimage.value,
                                    parkingTravelImage:
                                        uploadImageVM.generalExpImage.value,
                                  );
                                  print(isSuccess);
                                  hideOpenDialog(context: context);
                                  if (isSuccess == true) {
                                    sucessfullyHoursAddedRecruiterDialog(
                                      backButtonCallback: () {
                                        homeVM.selectedDropDownValue.value =
                                            homeVM.jobSites[0].value;
                                        homeVM.selectedJobsiteId.value =
                                            homeVM.jobSites[0].id;
                                        weeklytotalVM.commentController.clear();
                                        weeklytotalVM.endTimeController.clear();
                                        weeklytotalVM.startTimeController
                                            .clear();
                                        weeklytotalVM.generalExpController
                                            .clear();
                                        weeklytotalVM.jobSiteController.clear();
                                        weeklytotalVM.payPeriodController
                                            .clear();
                                        weeklytotalVM.parkingTravelController
                                            .clear();
                                        weeklytotalVM.totalHoursController
                                            .clear();
                                        Get.back();
                                      },
                                      checkTitle: 'Check Summary',
                                      context: context,
                                      title:
                                          'Your Hours Have Been Successfully Added',
                                      onTap: () async {
                                        showLoadingIndicator(context: context);
                                        List<WeeklyWorkSummaryRecruiterModel>
                                            result = await weeklySummaryVM
                                                .getRecruiterweeklyWorkSummary(
                                                    workerId: workerId);
                                        hideOpenDialog(context: context);
                                        if (result.isNotEmpty) {
                                          homeVM.selectedDropDownValue.value =
                                              homeVM.jobSites[0].value;
                                          homeVM.selectedJobsiteId.value =
                                              homeVM.jobSites[0].id;
                                          Get.offAndToNamed(
                                              AppRoutes
                                                  .weeklySummaryRecruiterView,
                                              arguments: workerId);
                                        }
                                      },
                                    );
                                  }
                                }
                              },
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            customTextButton(
                                buttonColor: AppColor.lightblue,
                                title: 'Check Summary',
                                onTap: () async {
                                  // if (weeklytotalVM.parkingTravelController.text
                                  //         .isEmpty ||
                                  //     weeklytotalVM
                                  //         .payPeriodController.text.isEmpty ||
                                  //     weeklytotalVM
                                  //         .generalExpController.text.isEmpty ||
                                  //     weeklytotalVM
                                  //         .startTimeController.text.isEmpty ||
                                  //     weeklytotalVM
                                  //         .endTimeController.text.isEmpty) {
                                  //   ScaffoldMessenger.of(context).showSnackBar(
                                  //       SnackBar(
                                  //           content: Text(
                                  //               'Please fill the required fields')));
                                  // }
                                  showLoadingIndicator(context: context);
                                  List<WeeklyWorkSummaryRecruiterModel> result =
                                      await weeklySummaryVM
                                          .getRecruiterweeklyWorkSummary(
                                              workerId: workerId);
                                  hideOpenDialog(context: context);
                                  if (result.isNotEmpty) {
                                    homeVM.selectedDropDownValue.value =
                                        homeVM.jobSites[0].value;
                                    homeVM.selectedJobsiteId.value =
                                        homeVM.jobSites[0].id;
                                    Get.toNamed(
                                        AppRoutes.weeklySummaryRecruiterView,
                                        arguments: workerId);
                                  }
                                })
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
