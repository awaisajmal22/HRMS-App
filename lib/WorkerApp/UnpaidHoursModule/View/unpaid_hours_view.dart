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
import '../../DailyTotalHoursModule/View/component/week_calender.dart';
import '../../HomeModule/ViewModel/home_view_model.dart';
import '../../UploadDocumentModule/ViewModel/upload_document_view_model.dart';
import '../../WeeklyWorkSummaryModule/ViewModel/weekly_work_summary_view_model.dart';
import '../ViewModel/unpaid_hours_view_model.dart';
import 'component/week_calender.dart';

class UnpaidHoursView extends StatelessWidget {
  UnpaidHoursView({super.key});
  final unpaidHoursVM = Get.find<UnpaidHoursViewModel>();
  final uploadDocVM = Get.find<UploadDocumentViewModel>();
  final homeVM = Get.find<HomeViewModel>();
  final weeklySummaryVM = Get.put(WeeklyWorkSummaryViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          customAppBar(
            isBackButton: true,
            title: 'Report Unpaid Hours',
          ),
          Expanded(
              child: ListView(
            padding: EdgeInsets.only(top: 9.h, left: 16.w, right: 16.w),
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
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return Dialog(
                          backgroundColor: AppColor.white,
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              color: AppColor.blue.withOpacity(0.44),
                              height: 65.h,
                              child: UnpaidDatePicker()),
                        );
                      },
                    );
                  },
                  hintText: unpaidHoursVM.pickedDate.value != ''
                      ? DateFormat("yyyy-MMM-dd").format(
                          DateTime.parse(unpaidHoursVM.pickedDate.value))
                      : '(show only days before current pay period)',
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
                child: appText(title: 'Enter Unpaid Hours', fontSize: 18),
              ),
              SizedBox(
                height: 5.h,
              ),
              customTextField(
                  hintText: '10:00 hrs',
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
                          controller: unpaidHoursVM.parkingTravelController,
                          borderColor: Colors.transparent,
                          opacity: 0),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.uploadDocumentView, arguments: 0);
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
                          controller: unpaidHoursVM.generalExpController,
                          borderColor: Colors.transparent,
                          opacity: 0),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.uploadDocumentView, arguments: 1);
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
                      title: 'Please write comment or additional notes below:',
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
                    if (unpaidHoursVM.generalExpController.text != '' &&
                        unpaidHoursVM.unpaidHoursController.text != '' &&
                        unpaidHoursVM.parkingTravelController.text != '') {
                      showLoadingIndicator(context: context);

                      bool isSuccess = await unpaidHoursVM.submitUnpaidHours(
                          generalExpValue: double.parse(
                              unpaidHoursVM.generalExpController.text),
                          parkingTravelValue: double.parse(
                              unpaidHoursVM.parkingTravelController.text),
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
                        sucessfullyHoursAddedDialog(
                            context: context,
                            title:
                                'Your Unpaid Hours Have Been Successfully Submitted',
                            checkTitle: 'Check Summary',
                            onTap: () {
                              showLoadingIndicator(context: context);
                              final result =
                                  weeklySummaryVM.getweeklyWorkSummary();
                              hideOpenDialog(context: context);
                              if (result != null) {
                                Get.toNamed(AppRoutes.weeklySummaryView);
                              }
                            });
                      }
                    } else {
                      toast(msg: "Please fill your all fields");
                    }
                  },
                  title: 'Submit'),
            ],
          ))
        ],
      ),
    );
  }
}