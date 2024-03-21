import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hrmsapp/WorkerApp/WeeklyWorkSummaryModule/Model/weekly_work_summary_worker_id.dart';
import 'package:intl/intl.dart';

import '../../../Constant/AppBar/custom_app_bar.dart';
import '../../../Constant/AppButton/text_button.dart';
import '../../../Constant/AppColors/colors.dart';
import '../../../Constant/AppDialogs/sucessfully_hours_submit_dialog.dart';
import '../../../Constant/AppText/app_text.dart';
import '../../../RoutesAndBindings/app_routes.dart';
import '../../../Utils/spint_kit_view_spinner.dart';
import '../../HomeModule/ViewModel/home_view_model.dart';
import '../ViewModel/weekly_work_summary_view_model.dart';

class WeeklyWorkSummaryView extends StatelessWidget {
  WeeklyWorkSummaryView({super.key});
  final weeklySummaryVM = Get.find<WeeklyWorkSummaryViewModel>();
  final homeVM = Get.find<HomeViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvoked: (val) {
          val == false ? Get.offAllNamed(AppRoutes.navBarView) : null;
        },
        child: Column(
          children: [
            customAppBar(
              onTap: () {
                Get.offAllNamed(AppRoutes.navBarView);
                // Get.back();
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
                        return Column(
                          children: [
                            GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                    // color: weeklySummaryVM
                                    //             .selectedCurrentSummaryIndex
                                    //             .value ==
                                    //         index
                                    //     ? Colors.blue
                                    //     : Colors.transparent,
                                    borderRadius: BorderRadius.circular(10)),
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        appText(
                                            title: weeklySummaryVM
                                                        .weeklyWorkList !=
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
                                        //     appText(
                                        //         title: weeklySummaryVM
                                        //                     .weeklyWorkList[index]
                                        //                     .date !=
                                        //                 null
                                        //             ? DateFormat('yyyy-MMM-dd').format(
                                        //                 DateTime.parse(weeklySummaryVM
                                        //                     .weeklyWorkList[index]
                                        //                     .date))
                                        //             : '',
                                        //         fontSize: 16,
                                        //         fontWeight: FontWeight.w400),
                                        //     SizedBox(
                                        //       width: 5.w,
                                        //     ),
                                        //     GestureDetector(
                                        //       onTap: () {
                                        //         Get.toNamed(
                                        //           AppRoutes.editWeeklyTotalHoursView,
                                        //           arguments: weeklySummaryVM
                                        //               .weeklyWorkList[index],
                                        //         );
                                        //       },
                                        //       child: Image.asset(
                                        //         'assets/icons/create.png',
                                        //         height: 22.h,
                                        //         width: 22.w,
                                        //       ),
                                        //     ),
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
                            GestureDetector(
                              onTap: () async{
                                 showLoadingIndicator(context: context);
                                WeeklyWorkSummaryWorkerByIdModel model =
                                    await weeklySummaryVM
                                        .getWorkerSummaryByID(
                                            id: weeklySummaryVM
                                                .weeklyWorkList[index].id);
                                // weeklySummaryVM
                                //     .selectedCurrentSummaryIndex.value = index;
                                if(model != null){
                                  hideOpenDialog(context: context);
                                }
                                Get.toNamed(
                                  AppRoutes.editWeeklyTotalHoursView,
                                  arguments:model
                                      // weeklySummaryVM.weeklyWorkList[index],
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 15,
                                ),
                                decoration: BoxDecoration(
                                  border: Border(
                                      top: BorderSide(
                                    color: Colors.black.withOpacity(0.1),
                                    width: 1,
                                  )),
                                  color: Colors.blue.withOpacity(0.35),
                                ),
                                child: const Icon(Icons.edit),
                              ),
                            ),
                          ],
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
            //         //     await dailyworkSummaryVM.submitDailyHours();
            //         hideOpenDialog(context: context);
            //         // if (isSuccess == true) {
            //         sucessfullyHoursAddedDialog(
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
                onTap: () {
                  Get.offAllNamed(AppRoutes.navBarView);
                  // Get.back();
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
