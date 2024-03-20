import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../Constant/AppBar/custom_app_bar.dart';
import '../../../Constant/AppButton/text_button.dart';
import '../../../Constant/AppColors/colors.dart';
import '../../../Constant/AppDialogs/calender.dart';
import '../../../Constant/AppDialogs/sucessfully_hours_submit_dialog.dart';
import '../../../Constant/AppText/app_text.dart';
import '../../../Constant/AppTextField/app_textfield.dart';
import '../../../Constant/AppTextField/comment_formfield.dart';
import '../../../Constant/DropDownFormField/drop_down_form_field.dart';
import '../../../Constant/Toast/fllutter_toast.dart';
import '../../../RoutesAndBindings/app_routes.dart';
import '../../../Utils/spint_kit_view_spinner.dart';
import '../../DailyWorkSummaryRecruiterModule/Model/daily_work_summary_recruiter_model.dart';
import '../../DailyWorkSummaryRecruiterModule/ViewModel/daily_work_summary_recruiter_view_model.dart';
import '../../HomeRecruiterModule/ViewModel/home_recruiter_view_model.dart';
import '../../UploadDocumentRecruiterModule/ViewModel/upload_document_recruiter_view_model.dart';
import '../ViewModel/daily_total_hours_recruiter_view_model.dart';
import 'component/recruiter_week_calender.dart';

class DailyTotalHoursRecruiterView extends StatelessWidget {
  int workerId = Get.arguments;
  DailyTotalHoursRecruiterView({super.key});
  final dailytotalVM = Get.find<DailyTotalHoursRecruiterViewModel>();
  final uploadImageVM = Get.find<UploadDocumentRecruiterViewModel>();
  final dailySummaryVM = Get.put(DailyWorkSummaryRecruiterViewModel());
  final homeVM = Get.put(HomeRecruiterViewModel());
  @override
  Widget build(BuildContext context) {
    homeVM.getSpecificWorkerData();
    return Scaffold(
      body: Column(
        children: [
          customAppBar(
            onTap: () {
              Get.back();
            },
            isBackButton: true,
            title: 'Submit Daily Detail Hours',
          ),
          SizedBox(
            height: 7.h,
          ),
          Obx(
            () => SizedBox(
                height: dailytotalVM.isKeyboard.value
                    ? MediaQuery.of(context).size.height * 0.60
                    : MediaQuery.of(context).size.height * 0.885,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Column(
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
                              height: 20.h,
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
                              height: 5.h,
                            ),
                            appText(
                              title: 'Select Date',
                              fontSize: 16,
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            GestureDetector(
                              onTap: () async {
                                // await showDatePicker(
                                //         context: context,
                                //         initialDate: DateTime.now(),
                                //         firstDate: DateTime(1950),
                                //         lastDate: DateTime.now())
                                //     .then((value) {
                                //   dailytotalVM.pickedDate.value =
                                //       "${DateFormat('yy-mm-dd').format(value!)}";
                                //   print(dailytotalVM.pickedDate.value);

                                // });
                                showGeneralDialog(
                                  context: context,
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return Dialog(
                                      backgroundColor: AppColor.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(0)),
                                      child: Container(
                                          padding: EdgeInsets.only(
                                              left: 15.w,
                                              right: 15.w,
                                              top: 5.h,
                                              bottom: 5.h),
                                          decoration: BoxDecoration(
                                            color:
                                                AppColor.blue.withOpacity(0.44),
                                          ),
                                          height: 70.h,
                                          child: Obx(
                                            () => DatePicker(
                                              endWeekDate:
                                                  homeVM.endWeekDate.value,
                                            ),
                                          )),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.w, vertical: 12.h),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColor.black.withOpacity(0.20),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Obx(
                                      () => appText(
                                        title: dailytotalVM.pickedDate.value !=
                                                ''
                                            ? "${DateFormat('yyyy-MMM-dd').format(DateTime.parse(dailytotalVM.pickedDate.value))}"
                                            : '',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        textColor:
                                            AppColor.black.withOpacity(0.55),
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      'assets/icons/calendar.svg',
                                      height: 18.h,
                                      width: 18.w,
                                      color: AppColor.blue,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
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
                                        homeVM.selectedJobsiteId.value =
                                            data.id;
                                      }
                                    }
                                  }),
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 148.w,
                                  child: appText(
                                    textAlign: TextAlign.left,
                                    title: 'Set Start Time',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  width: 40.w,
                                ),
                                SizedBox(
                                  width: 140.w,
                                  child: appText(
                                    textAlign: TextAlign.left,
                                    title: 'End Start Time',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: customTextField(
                                    readOnly: true,
                                    onTap: () {
                                      dailytotalVM.selectStartTime(context);
                                    },
                                    hintText: 'Select a time',
                                    controller:
                                        dailytotalVM.startTimeController,
                                    textInputType: TextInputType.text,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 6.w),
                                  height: 1.h,
                                  width: 8.w,
                                  color: Colors.black,
                                ),
                                Expanded(
                                  child: customTextField(
                                    readOnly: true,
                                    onTap: () {
                                      dailytotalVM.selectEndTime(context);
                                    },
                                    hintText: 'Select a time',
                                    controller: dailytotalVM.endTimeController,
                                    textInputType: TextInputType.text,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 11.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            appText(
                              textAlign: TextAlign.left,
                              title: 'Total Hours',
                              fontSize: 16,
                              // fontWeight: FontWeight.w400,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            customTextField(
                              verticalPadding: 0,
                              horizontalPadding: 10,
                              hintText: '',
                              controller: dailytotalVM.totalHoursController,
                              textInputType: TextInputType.number,
                            ),
                            SizedBox(height: 18.h),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                            text: 'Parking/Travel ',
                                            style:
                                                GoogleFonts.roboto().copyWith(
                                              color: AppColor.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: '(Optional)',
                                                style: GoogleFonts.roboto()
                                                    .copyWith(
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
                                        width: 154.w,
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
                                                  controller: dailytotalVM
                                                      .parkingTravelController,
                                                  borderColor:
                                                      Colors.transparent,
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
                                                'assets/icons/camera.svg',
                                              ),
                                            ),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                            text: 'General expenses ',
                                            style:
                                                GoogleFonts.roboto().copyWith(
                                              color: AppColor.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: '(Optional)',
                                                style: GoogleFonts.roboto()
                                                    .copyWith(
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
                                        // width: 154.w,
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
                                                  controller: dailytotalVM
                                                      .generalExpController,
                                                  borderColor:
                                                      Colors.transparent,
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
                                                'assets/icons/camera.svg',
                                              ),
                                            ),
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
                                title: 'Comments/Additional Notes',
                                fontSize: 14),
                            customCommentTextField(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              height: 66,
                              maxLines: 3,
                              hintText: 'Write here.....',
                              controller: dailytotalVM.commentController,
                              textInputType: TextInputType.text,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            customTextButton(
                                buttonColor: AppColor.blue,
                                title: 'Add',
                                onTap: () async {
                                  if (dailytotalVM.pickedDate.value == '') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Please select the date')));
                                  } else if (homeVM.selectedJobsiteId.value ==
                                          -1010 ||
                                      homeVM.selectedDropDownValue.value ==
                                          'Select job site' ||
                                      homeVM.selectedDropDownValue.value ==
                                          '') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Please Select job Site')));
                                  } else if (dailytotalVM
                                      .totalHoursController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Please fill the required fields')));
                                  } else if (dailytotalVM.endTime.value ==
                                      dailytotalVM.startTime.value) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'Picked Hours date time must be different')));
                                  } else if (dailytotalVM
                                          .totalHoursController.text ==
                                      '0') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'Total hours must be greater than 0')));
                                  } else if (dailytotalVM.totalHoursController.text
                                          .isNotEmpty &&
                                      dailytotalVM.totalHoursController.text !=
                                          '0' &&
                                      dailytotalVM.endTime.value !=
                                          dailytotalVM.startTime.value) {
                                    showLoadingIndicator(context: context);
                                    bool isSuccess = await dailytotalVM
                                        .submitDailyRecruiterHours(
                                      workerId: workerId,
                                      startTime: dailytotalVM.endTime.value !=
                                              dailytotalVM.startTime.value
                                          ? dailytotalVM.formatDuration(
                                              Duration(
                                                  hours: dailytotalVM
                                                      .startTime.value.hour))
                                          : '',
                                      endTime: dailytotalVM.endTime.value !=
                                              dailytotalVM.startTime.value
                                          ? dailytotalVM.formatDuration(
                                              Duration(
                                                  hours: dailytotalVM
                                                      .endTime.value.hour))
                                          : '',
                                      totalHours: double.parse(dailytotalVM
                                          .totalHoursController.text),
                                      date: dailytotalVM.pickedDate.value,
                                      generalExpValue: dailytotalVM
                                              .generalExpController
                                              .text
                                              .isNotEmpty
                                          ? double.parse(dailytotalVM
                                              .generalExpController.text)
                                          : 0.0,
                                      parkingTravelValue: dailytotalVM
                                              .parkingTravelController
                                              .text
                                              .isNotEmpty
                                          ? double.parse(dailytotalVM
                                              .parkingTravelController.text)
                                          : 0.0,
                                      generalExpImage:
                                          uploadImageVM.parkingimage.value,
                                      parkingTravelImage:
                                          uploadImageVM.generalExpImage.value,
                                      feedBack:
                                          dailytotalVM.commentController.text,
                                      jobSiteID: homeVM.selectedJobsiteId.value,
                                    );
                                    print(isSuccess);
                                    hideOpenDialog(context: context);
                                    if (isSuccess == true) {
                                      sucessfullyHoursAddedRecruiterDialog(
                                        backButtonCallback: () {
                                          Get.back();
                                          dailytotalVM.pickedDate.value = '';
                                          homeVM.selectedDropDownValue.value =
                                              homeVM.jobSites[0].value;
                                          homeVM.selectedJobsiteId.value =
                                              homeVM.jobSites[0].id;
                                          dailytotalVM.commentController
                                              .clear();
                                          dailytotalVM.endTimeController
                                              .clear();
                                          dailytotalVM.generalExpController
                                              .clear();
                                          dailytotalVM.jobSiteController
                                              .clear();
                                          dailytotalVM.parkingTravelController
                                              .clear();
                                          dailytotalVM.startTimeController
                                              .clear();
                                          dailytotalVM.totalHoursController
                                              .clear();
                                        },
                                        checkTitle: 'Check List',
                                        context: context,
                                        title:
                                            'Your Daily Hours Successfully Added To List',
                                        onTap: () async {
                                          showLoadingIndicator(
                                              context: context);
                                          List<DailyWorkSummaryRecruiterModel>
                                              result = await dailySummaryVM
                                                  .getRecruiterDailyWorkSummary(
                                            workerId: workerId,
                                          );
                                          hideOpenDialog(context: context);
                                          if (result.isNotEmpty) {
                                            Get.offAndToNamed(
                                                AppRoutes
                                                    .dailySummaryRecruiterView,
                                                arguments: workerId);
                                          }
                                        },
                                      );
                                    }
                                  } else {
                                    toast(msg: "please fill your all fields");
                                  }
                                }),
                            SizedBox(
                              height: 5.h,
                            ),
                            customTextButton(
                                buttonColor: AppColor.lightblue,
                                title: 'Check Summary',
                                onTap: () async {
                                  showLoadingIndicator(context: context);
                                  List<DailyWorkSummaryRecruiterModel> result =
                                      await dailySummaryVM
                                          .getRecruiterDailyWorkSummary(
                                    workerId: workerId,
                                  );
                                  hideOpenDialog(context: context);
                                  if (result.isNotEmpty) {
                                    Get.toNamed(
                                        AppRoutes.dailySummaryRecruiterView,
                                        arguments: workerId);
                                  }
                                }),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
