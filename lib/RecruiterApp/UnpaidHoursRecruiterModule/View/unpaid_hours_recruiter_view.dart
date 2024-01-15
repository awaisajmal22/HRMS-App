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
import '../../../Constant/AppDialogs/sucessfully_hours_submit_dialog.dart';
import '../../../Constant/AppText/app_text.dart';
import '../../../Constant/AppText/span_text.dart';
import '../../../Constant/AppTextField/app_textfield.dart';
import '../../../Constant/AppTextField/comment_formfield.dart';
import '../../../Constant/DropDownFormField/drop_down_form_field.dart';
import '../../../Constant/Toast/fllutter_toast.dart';
import '../../../RoutesAndBindings/app_routes.dart';
import '../../../Utils/spint_kit_view_spinner.dart';
import '../../DailyTotalHoursRecruiterModule/View/component/recruiter_week_calender.dart';
import '../../HomeRecruiterModule/ViewModel/home_recruiter_view_model.dart';
import '../../UploadDocumentRecruiterModule/ViewModel/upload_document_recruiter_view_model.dart';
import '../../WeeklyWorkSummaryRecruiterModule/ViewModel/weekly_work_summary_recruiter_view_model.dart';
import '../ViewModel/unpaid_hours_recruiter_view_model.dart';
import 'component/week_calender.dart';

class UnpaidHoursRecruiterView extends StatelessWidget {
  UnpaidHoursRecruiterView({super.key});
  final unpaidHoursVM = Get.find<UnpaidHoursRecruiterViewModel>();
  final uploadDocVM = Get.find<UploadDocumentRecruiterViewModel>();
  int workerId = Get.arguments;
  final homeVM = Get.find<HomeRecruiterViewModel>();
  final weeklySummaryVM = Get.put(WeeklyWorkSummaryRecruiterViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          customAppBar(
            onTap: () {
              Get.back();
            },
            isBackButton: true,
            title: 'Report Unpaid Hours',
          ),
          Obx(
            () => SizedBox(
                height: unpaidHoursVM.isKeyboard.value
                    ? MediaQuery.of(context).size.height * 0.68
                    : MediaQuery.of(context).size.height * 0.885,
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(top: 9.h, left: 16.w, right: 16.w),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: appText(title: 'Select Date', fontSize: 18),
                      ),
                      Obx(
                        () => customTextField(
                          readOnly: true,
                          onTap: () {
                            showGeneralDialog(
                              context: context,
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return Dialog(
                                  backgroundColor: AppColor.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0)),
                                  child: Container(
                                      padding: EdgeInsets.only(
                                          left: 15.w,
                                          right: 15.w,
                                          top: 5.h,
                                          bottom: 5.h),
                                      decoration: BoxDecoration(
                                        color: AppColor.blue.withOpacity(0.44),
                                      ),
                                      height: 70.h,
                                      child: Obx(() => UnpaidDatePicker(
                                            endWeekDate:
                                                homeVM.endWeekDate.value,
                                          ))),
                                );
                              },
                            );
                          },
                          hintText: unpaidHoursVM.pickedDate.value != ''
                              ? DateFormat("yyyy-MMM-dd").format(DateTime.parse(
                                  unpaidHoursVM.pickedDate.value))
                              : '',
                          controller: unpaidHoursVM.dateController,
                        ),
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: appText(title: 'Select Job Site', fontSize: 16),
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
                      SizedBox(
                        height: 19.h,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child:
                            appText(title: 'Enter Unpaid Hours', fontSize: 18),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      customTextField(
                          hintText: '',
                          controller: unpaidHoursVM.unpaidHoursController,
                          fontSize: 14),
                      SizedBox(
                        height: 19.h,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: spanText(title: 'Parking/Travel ')),
                      SizedBox(
                        height: 4.h,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: AppColor.black.withOpacity(0.10),
                              width: 1,
                            )),
                        child: Row(
                          children: [
                            Expanded(
                              child: customTextField(
                                  verticalPadding: 0,
                                  horizontalPadding: 0,
                                  textInputType: TextInputType.number,
                                  hintText: '',
                                  controller:
                                      unpaidHoursVM.parkingTravelController,
                                  borderColor: Colors.transparent,
                                  opacity: 0),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(
                                    AppRoutes.uploadDocumentRecruiterView,
                                    arguments: 0);
                              },
                              child: SvgPicture.asset(
                                'assets/icons/camera.svg',
                                height: 24.h,
                                width: 24.w,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: spanText(title: 'General expenses '),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: AppColor.black.withOpacity(0.10),
                              width: 1,
                            )),
                        child: Row(
                          children: [
                            Expanded(
                              child: customTextField(
                                  verticalPadding: 0,
                                  horizontalPadding: 0,
                                  textInputType: TextInputType.number,
                                  hintText: '',
                                  controller:
                                      unpaidHoursVM.generalExpController,
                                  borderColor: Colors.transparent,
                                  opacity: 0),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(
                                    AppRoutes.uploadDocumentRecruiterView,
                                    arguments: 1);
                              },
                              child: SvgPicture.asset(
                                'assets/icons/camera.svg',
                                height: 24.h,
                                width: 24.w,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: appText(
                              title:
                                  'Please write comment or additional notes below:',
                              fontSize: 14,
                              textColor: AppColor.black.withOpacity(0.65))),
                      SizedBox(
                        height: 5.h,
                      ),
                      customCommentTextField(
                        controller: unpaidHoursVM.commentController,
                        hintText: 'Write here.....',
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      customTextButton(
                          buttonColor: AppColor.blue,
                          onTap: () async {
                            if (unpaidHoursVM.unpaidHoursController.text !=
                                '') {
                              showLoadingIndicator(context: context);

                              bool isSuccess = await unpaidHoursVM.submitUnpaidRecruiterHours(
                                  workerId: workerId,
                                  generalExpValue:
                                      unpaidHoursVM.generalExpController.text != ''
                                          ? double.parse(unpaidHoursVM
                                              .generalExpController.text)
                                          : 0.0,
                                  parkingTravelValue: unpaidHoursVM
                                              .parkingTravelController.text !=
                                          ''
                                      ? double.parse(unpaidHoursVM
                                          .parkingTravelController.text)
                                      : 0.0,
                                  unpaidHours: int.parse(
                                      unpaidHoursVM.unpaidHoursController.text),
                                  jobSite: homeVM.selectedDropDownValue.value,
                                  feedBack: unpaidHoursVM.commentController.text,
                                  date: unpaidHoursVM.pickedDate.value,
                                  jobSiteID: homeVM.selectedJobsiteId.value,
                                  generalExpImage: uploadDocVM.generalExpImage.value,
                                  parkingTravelImage: uploadDocVM.parkingimage.value);

                              hideOpenDialog(context: context);
                              if (isSuccess == true) {
                                sucessfullyHoursAddedRecruiterDialog(
                                    context: context,
                                    title:
                                        'Your Unpaid Hours Have Been Successfully Submitted',
                                    checkTitle: 'Check Summary',
                                    onTap: () {
                                      showLoadingIndicator(context: context);
                                      final result = weeklySummaryVM
                                          .getRecruiterweeklyWorkSummary(
                                              workerId: workerId);
                                      hideOpenDialog(context: context);
                                      if (result != null) {
                                        Get.toNamed(
                                            AppRoutes
                                                .weeklySummaryRecruiterView,
                                            arguments: workerId);
                                      }
                                    });
                              }
                            } else {
                              toast(msg: "Please fill your all fields");
                            }
                          },
                          title: 'Submit'),
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
