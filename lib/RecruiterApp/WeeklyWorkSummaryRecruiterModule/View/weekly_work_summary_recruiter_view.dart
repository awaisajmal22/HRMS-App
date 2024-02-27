import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../Constant/AppBar/custom_app_bar.dart';
import '../../../Constant/AppButton/text_button.dart';
import '../../../Constant/AppColors/colors.dart';
import '../../../Constant/AppDialogs/sucessfully_hours_submit_dialog.dart';
import '../../../Constant/AppText/app_text.dart';
import '../../../RoutesAndBindings/app_routes.dart';
import '../../../Utils/spint_kit_view_spinner.dart';
import '../../HomeRecruiterModule/ViewModel/home_recruiter_view_model.dart';
import '../ViewModel/weekly_work_summary_recruiter_view_model.dart';

class WeeklyWorkSummaryRecruiterView extends StatelessWidget {
  WeeklyWorkSummaryRecruiterView({super.key});
  final weeklySummaryVM = Get.find<WeeklyWorkSummaryRecruiterViewModel>();
  int workerId = Get.arguments;
  final homeVM = Get.find<HomeRecruiterViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvoked: (val){
          val == false ? homeVM.getSpecificWorkerData().then(
                          (val) => Get.offAllNamed(AppRoutes.workerView,arguments: val)): null;
        },
        child: Column(
          children: [
            customAppBar(
              onTap: () {
               homeVM.getSpecificWorkerData().then(
                          (val) => Get.offAllNamed(AppRoutes.workerView,arguments: val));
              },
              isBackButton: true,
              title: 'Weekly Summary',
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: appText(title: 'Weekly Work Summary', fontSize: 20),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(7, 126, 216, 0.06)),
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                child: ListView(
                  padding: EdgeInsets.only(
                      top: 38.h, bottom: 26.h, left: 30.w, right: 30.w),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText(title: 'Week', fontSize: 16),
                        Obx(
                          () => appText(
                              title: '${homeVM.startOfWeek.value}',
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        Obx(
                          () => appText(
                              title: '${homeVM.endOfWeek.value}',
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: AppColor.black.withOpacity(0.50),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Column(
                      children: List.generate(
                          weeklySummaryVM.weeklyWorkList.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              AppRoutes.editWeeklyTotalHoursRecruiterView,
                              arguments: [
                                weeklySummaryVM.weeklyWorkList[index],
                                workerId
                              ],
                            );
        
                            weeklySummaryVM.selectCurrentSummaryIndex.value =
                                index;
                          },
                          child: Obx(
                            () => Container(
                              decoration: BoxDecoration(
                                  color: weeklySummaryVM
                                              .selectCurrentSummaryIndex.value ==
                                          index
                                      ? Colors.blue
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      appText(
                                          title: weeklySummaryVM.weeklyWorkList !=
                                                  null
                                              ? weeklySummaryVM
                                                  .weeklyWorkList[index]
                                                  .jobSiteName
                                              : 'Job Site',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                      // Row(
                                      //   mainAxisSize: MainAxisSize.min,
                                      //   children: [
                                      // appText(
                                      //     title: weeklySummaryVM
                                      //                 .weeklyWorkList[index]
                                      //                 .date !=
                                      //             null
                                      //         ? DateFormat('yyyy-MMM-dd').format(
                                      //             DateTime.parse(weeklySummaryVM
                                      //                 .weeklyWorkList[index]
                                      //                 .date))
                                      //         : '',
                                      //     fontSize: 16,
                                      //     fontWeight: FontWeight.w400),
                                      // SizedBox(
                                      //   width: 5.w,
                                      // ),
                                      // GestureDetector(
                                      //   onTap: () {
                                      //     Get.toNamed(
                                      //       AppRoutes
                                      //           .editWeeklyTotalHoursRecruiterView,
                                      //       arguments: [
                                      //         weeklySummaryVM
                                      //             .weeklyWorkList[index],
                                      //         workerId
                                      //       ],
                                      //     );
                                      //   },
                                      //   child: Image.asset(
                                      //     'assets/icons/create.png',
                                      //     height: 22.h,
                                      //     width: 22.w,
                                      //   ),
                                      // ),
                                      // ],
                                      // )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Container(
                                    height: 1,
                                    width: double.infinity,
                                    color: AppColor.black.withOpacity(0.50),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 11.w, vertical: 20.h),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            appText(
                                                title: 'Hours Worked',
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                            appText(
                                                title:
                                                    '${weeklySummaryVM.weeklyWorkList[index].hours} hrs',
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            appText(
                                                title: 'Parking Travel',
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                            appText(
                                                title:
                                                    '\$${weeklySummaryVM.weeklyWorkList[index].parking}',
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            appText(
                                                title: 'General Expenses',
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                            appText(
                                                title:
                                                    '\$${weeklySummaryVM.weeklyWorkList[index].generalexpence}',
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }, growable: true),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 6.h,
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20.w),
            //   child: customTextButton(
            //       onTap: () {
            //         showLoadingIndicator(context: context);
            //         // bool isSuccess =
            //         //     await dailyworkSummaryVM.submitDailyRecruiterHours();
            //         hideOpenDialog(context: context);
            //         // if (isSuccess == true) {
            //         sucessfullyHoursAddedRecruiterDialog(
            //           isCheckButton: false,
            //           checkTitle: 'Check List',
            //           context: context,
            //           title: 'Summary Successfully Submitted',
            //           onTap: () {
            //             Get.toNamed(AppRoutes.dailySummaryView);
            //           },
            //         );
            //         // }
            //       },
            //       title: 'Submit',
            //       buttonColor: AppColor.blue),
            // ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: customTextButton(
                onTap: () async {
                  showLoadingIndicator(context: context);
                  bool isSuccess = await weeklySummaryVM
                      .submitWeeklyRecruiterHours(workerId: workerId);
                  hideOpenDialog(context: context);
                  if (isSuccess == true) {
                    sucessfullyHoursAddedRecruiterDialog(
                      isCheckButton: false,
                      checkTitle: 'Check List',
                      context: context,
                      title: 'Summary Successfully Submitted',
                      onTap: () {
                        Get.toNamed(AppRoutes.weeklySummaryRecruiterView);
                      },
                    );
                  }
                },
                title: 'Submit',
                buttonColor: AppColor.blue,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: customTextButton(
                onTap: () {
                 homeVM.getSpecificWorkerData().then(
                          (val) => Get.offAllNamed(AppRoutes.workerView,arguments: val));
                },
                title: 'Close',
                buttonColor: AppColor.blue.withOpacity(0.37),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
          ],
        ),
      ),
    );
  }
}
