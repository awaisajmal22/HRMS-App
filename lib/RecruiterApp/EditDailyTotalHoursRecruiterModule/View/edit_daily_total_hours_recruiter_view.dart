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
import '../../../RoutesAndBindings/app_routes.dart';
import '../../../Utils/spint_kit_view_spinner.dart';
import '../../DailyWorkSummaryRecruiterModule/Model/daily_work_summary_recruiter_model.dart';
import '../../DailyWorkSummaryRecruiterModule/ViewModel/daily_work_summary_recruiter_view_model.dart';
import '../../HomeRecruiterModule/ViewModel/home_recruiter_view_model.dart';
import '../../UploadDocumentRecruiterModule/ViewModel/upload_document_recruiter_view_model.dart';
import '../ViewModel/edit_daily_total_hours_recruiter_view_model.dart';
import 'component/edit_recruiter_week_calender.dart';

class EditDailyTotalHoursRecruiterView extends StatelessWidget {
  EditDailyTotalHoursRecruiterView({super.key});
  final editDailyTotalVM = Get.find<EditDailyTotalHoursRecruiterViewModel>();
  final uploadImageVM = Get.find<UploadDocumentRecruiterViewModel>();
  final homeVM = Get.find<HomeRecruiterViewModel>();
  final dailySummaryVM = Get.put(DailyWorkSummaryRecruiterViewModel());
  DailyWorkSummaryRecruiterByIdModel model = Get.arguments[0];
  int workerId = Get.arguments[1];
  @override
  Widget build(BuildContext context) {
    List<String> startHours = model.startTime.split(':');
    List<String> endHours = model.endTime.split(':');
    editDailyTotalVM.totalHoursController.text = model.hours.toString();
    editDailyTotalVM.parkingTravelController.text = model.parking.toString();
    editDailyTotalVM.generalExpController.text = model.genexpence.toString();
    editDailyTotalVM.pickedDate.value = model.date.toString();
    homeVM.selectedDropDownValue.value = model.jobSiteName;
    homeVM.selectedJobsiteId.value = model.jobsiteId!;
    editDailyTotalVM.endTime.value =
        TimeOfDay(hour: int.parse(endHours[0]), minute: int.parse(endHours[1]));
    editDailyTotalVM.startTime.value = TimeOfDay(
        hour: int.parse(startHours[0]), minute: int.parse(startHours[1]));
    ;
    editDailyTotalVM.startTimeController.text =
        '${DateFormat.jm().format(DateFormat("HH:mm:ss").parse(model.startTime!))}';
    editDailyTotalVM.endTimeController.text =
        '${DateFormat.jm().format(DateFormat("HH:mm:ss").parse(model.endTime!))}';

    return Scaffold(
      body: Column(
        children: [
          customAppBar(
            onTap: () {
              Get.back();
            },
            isBackButton: true,
            title: 'Edit Daily Detail Hours',
          ),
          SizedBox(
            height: 7.h,
          ),
          Obx(
            () => SizedBox(
              height: editDailyTotalVM.isKeyboard.value
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
                            //   editDailyTotalVM.pickedDate.value =
                            //       "${DateFormat('yy-mm-dd').format(value!)}";
                            //   print(editDailyTotalVM.pickedDate.value);
                            // });
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
                                      child: Obx(() => EditDatePicker(
                                            endWeekDate:
                                                homeVM.endWeekDate.value,
                                          ))),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Obx(
                                  () => appText(
                                    title:
                                        // editDailyTotalVM.pickedDate.value !=
                                        //         ''

                                        "${DateFormat('yyyy-MMM-dd').format(DateTime.parse(editDailyTotalVM.pickedDate.value))}",
                                    // : '${DateFormat('yyyy-MMM-dd').format(model.date!)}',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    textColor: AppColor.black.withOpacity(0.55),
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
                        AppDropdownInput(
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
                                  editDailyTotalVM.selectStartTime(context);
                                },
                                hintText: '',
                                // '${DateFormat.jm().format(DateFormat("HH:mm:ss").parse(model.startTime!))}',
                                controller:
                                    editDailyTotalVM.startTimeController,
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
                                  editDailyTotalVM.selectEndTime(context);
                                },
                                hintText: '',
                                // '${DateFormat.jm().format(DateFormat("HH:mm:ss").parse(model.endTime!))}',
                                controller: editDailyTotalVM.endTimeController,
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
                          // model.hours.toString(),
                          // editDailyTotalVM.endTime.value ==
                          //             TimeOfDay.now()
                          //         ? ''
                          //         : editDailyTotalVM.endTime.value ==
                          //                 editDailyTotalVM.startTime.value
                          //             ? ''
                          //             :  editDailyTotalVM.startTime.value ==
                          //             editDailyTotalVM.endTime.value
                          //         ? "${editDailyTotalVM.getTime(TimeOfDay(hour: int.parse('${DateFormat.H().format(DateFormat("HH:mm:ss").parse(model.startTime!))}'), minute: 00), TimeOfDay(hour: int.parse('${DateFormat.H().format(DateFormat("HH:mm:ss").parse(model.endTime!))}'), minute: 00))}"
                          //         : "${editDailyTotalVM.getTime(editDailyTotalVM.startTime.value, editDailyTotalVM.endTime.value)}",
                          controller: editDailyTotalVM.totalHoursController,
                          textInputType: TextInputType.number,
                        ),
                        SizedBox(height: 18.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                          color:
                                              AppColor.black.withOpacity(0.10),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(6)),
                                    alignment: Alignment.centerRight,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 8.h,
                                      horizontal: 12.w,
                                    ),
                                    width: 154.w,
                                    height: 40.h,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: customTextField(
                                              verticalPadding: 0,
                                              horizontalPadding: 0,
                                              textInputType:
                                                  TextInputType.number,
                                              hintText: '',
                                              // model.parking.toString(),
                                              controller: editDailyTotalVM
                                                  .parkingTravelController,
                                              borderColor: Colors.transparent,
                                              opacity: 0),
                                        ),
                                        Container(
                                          width: 1.w,
                                          color:
                                              AppColor.black.withOpacity(0.30),
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
                                          color:
                                              AppColor.black.withOpacity(0.10),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(6)),
                                    alignment: Alignment.centerRight,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 8.h,
                                      horizontal: 12.w,
                                    ),
                                    // width: 154.w,
                                    height: 40.h,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: customTextField(
                                              verticalPadding: 0,
                                              horizontalPadding: 0,
                                              textInputType:
                                                  TextInputType.number,
                                              hintText: '',
                                              // model.genexpence.toString(),
                                              controller: editDailyTotalVM
                                                  .generalExpController,
                                              borderColor: Colors.transparent,
                                              opacity: 0),
                                        ),
                                        Container(
                                          width: 1.w,
                                          color:
                                              AppColor.black.withOpacity(0.30),
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
                            title: 'Comments/Additional Notes', fontSize: 14),
                        customCommentTextField(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          height: 66,
                          maxLines: 3,
                          hintText: 'Write here.....',
                          controller: editDailyTotalVM.commentController,
                          textInputType: TextInputType.text,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        customTextButton(
                            buttonColor: AppColor.blue,
                            title: 'Add',
                            onTap: () async {
                              print(
                                  'PickedDate is : ${editDailyTotalVM.pickedDate.value}');
                              if (editDailyTotalVM
                                  .totalHoursController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Please fill the required fields')));
                              } else if (editDailyTotalVM.totalHoursController.text ==
                                  '0') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Total Hours must be greater than 0')));
                              } else if (editDailyTotalVM.endTime ==
                                  editDailyTotalVM.startTime) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Picked Hours date time must be different')));
                              } else if (editDailyTotalVM
                                      .totalHoursController.text.isNotEmpty &&
                                  editDailyTotalVM.totalHoursController.text !=
                                      '0' &&
                                  editDailyTotalVM.endTime !=
                                      editDailyTotalVM.startTime) {
                                showLoadingIndicator(context: context);
                                bool isSuccess = await editDailyTotalVM
                                    .EditsubmitDailyRecruiterHours(
                                  id: model.id!,
                                  startTime: editDailyTotalVM.formatDuration(
                                      Duration(
                                          hours: int.parse(
                                              '${DateFormat.H().format(DateFormat.jm().parse(editDailyTotalVM.startTimeController.text))}'))),
                                  endTime: editDailyTotalVM.formatDuration(Duration(
                                      hours: int.parse(
                                          '${DateFormat.H().format(DateFormat.jm().parse(editDailyTotalVM.endTimeController.text))}'))),
                                  totalHours: double.parse(editDailyTotalVM
                                      .totalHoursController.text),
                                  date: editDailyTotalVM.pickedDate.value == ''
                                      ? model.date!.toString()
                                      : editDailyTotalVM.pickedDate.value,
                                  generalExpValue: editDailyTotalVM
                                          .generalExpController.text.isNotEmpty
                                      ? double.parse(editDailyTotalVM
                                          .generalExpController.text)
                                      : 0.0,
                                  parkingTravelValue: editDailyTotalVM
                                          .parkingTravelController
                                          .text
                                          .isNotEmpty
                                      ? double.parse(editDailyTotalVM
                                          .parkingTravelController.text)
                                      : 0.0,
                                  generalExpImage:
                                      uploadImageVM.parkingimage.value,
                                  parkingTravelImage:
                                      uploadImageVM.generalExpImage.value,
                                  feedBack:
                                      editDailyTotalVM.commentController.text,
                                  jobSiteID: homeVM.selectedJobsiteId.value == 0
                                      ? model.jobsiteId!
                                      : homeVM.selectedJobsiteId.value,
                                );
                                print(isSuccess);
                                hideOpenDialog(context: context);
                                if (isSuccess == true) {
                                  sucessfullyHoursAddedRecruiterDialog(
                                    backButtonCallback: (){
                                      Get.back();
                                    },
                                    checkTitle: 'Check List',
                                    context: context,
                                    title:
                                        'Your Daily Hours Successfully Added To List',
                                    onTap: () async {
                                      Get.back();
                                      showLoadingIndicator(context: context);
                                      List<DailyWorkSummaryRecruiterModel>
                                          result = await dailySummaryVM
                                              .getRecruiterDailyWorkSummary(
                                                  workerId: workerId);
                                      hideOpenDialog(context: context);
                                      if (result.isNotEmpty) {
                                        Get.offAndToNamed(
                                            AppRoutes.dailySummaryRecruiterView,
                                            arguments: workerId);
                                      }
                                    },
                                  );
                                }
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
                                          workerId: workerId);
                              hideOpenDialog(context: context);
                              if (result.isNotEmpty) {
                                Get.offNamed(
                                    AppRoutes.dailySummaryRecruiterView,
                                    arguments: workerId);
                              }
                            })
                      ],
                    ),
                  )
                ],
              )),
            ),
          )
        ],
      ),
    );
  }
}
