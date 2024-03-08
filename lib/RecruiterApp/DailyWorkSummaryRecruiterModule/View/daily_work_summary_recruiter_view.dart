import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hrmsapp/RecruiterApp/DailyWorkSummaryRecruiterModule/View/component/recruiter_delete_daily_summary_dialog.dart';
import 'package:intl/intl.dart';

import '../../../Constant/AppBar/custom_app_bar.dart';
import '../../../Constant/AppButton/text_button.dart';
import '../../../Constant/AppColors/colors.dart';
import '../../../Constant/AppDialogs/sucessfully_hours_submit_dialog.dart';
import '../../../Constant/AppText/app_text.dart';
import '../../../RoutesAndBindings/app_routes.dart';
import '../../../Utils/spint_kit_view_spinner.dart';
import '../../EditDailyTotalHoursRecruiterModule/ViewModel/edit_daily_total_hours_recruiter_view_model.dart';
import '../../HomeRecruiterModule/ViewModel/home_recruiter_view_model.dart';
import '../Model/daily_work_summary_recruiter_model.dart';
import '../ViewModel/daily_work_summary_recruiter_view_model.dart';

class DailyWorkSummaryRecruiterView extends StatelessWidget {
  DailyWorkSummaryRecruiterView({super.key});
  int workerId = Get.arguments;
  final dailyworkSummaryVM = Get.find<DailyWorkSummaryRecruiterViewModel>();
  final homeVM = Get.put(HomeRecruiterViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvoked: (val) {
          val == false
              ? homeVM.getSpecificWorkerData().then((val) =>
                  Get.offAllNamed(AppRoutes.workerView, arguments: val))
              : null;
        },
        child: Column(
          children: [
            customAppBar(
              onTap: () {
                homeVM.getSpecificWorkerData().then((val) =>
                    Get.offAllNamed(AppRoutes.workerView, arguments: val));
              },
              title: 'Daily Summary',
              isBackButton: true,
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  appText(title: 'Daily Work Summary', fontSize: 20),
                  // Row(
                  //   children: [
                  appText(
                    title:
                        "${homeVM.startDate.value} to ${homeVM.endDate.value}",
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                  // GestureDetector(
                  //     onTap: () {
                  //       dailyworkSummaryVM.pageController.animateToPage(
                  //           --dailyworkSummaryVM.pageChanged.value,
                  //           duration: Duration(milliseconds: 250),
                  //           curve: Curves.bounceInOut);
                  //     },
                  //     child: SvgPicture.asset(
                  //       'assets/icons/left.svg',
                  //       height: 10.h,
                  //       width: 5.w,
                  //     )),
                  //   SizedBox(
                  //     width: 9.w,
                  //   ),
                  //   Obx(() => appText(
                  //         title: dailyworkSummaryVM.week.value,
                  //         fontSize: 12,
                  //         fontWeight: FontWeight.w400,
                  //       )),
                  //   SizedBox(
                  //     width: 9.w,
                  //   ),
                  //   GestureDetector(
                  //     onTap: () {
                  //       dailyworkSummaryVM.pageController.animateToPage(
                  //           ++dailyworkSummaryVM.pageChanged.value,
                  //           duration: const Duration(milliseconds: 250),
                  //           curve: Curves.bounceInOut);
                  //     },
                  //     child: SvgPicture.asset(
                  //       'assets/icons/right.svg',
                  //       height: 10.h,
                  //       width: 5.w,
                  //     ),
                  //   ),
                  // ],
                  // )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: PageView.builder(
                controller: dailyworkSummaryVM.pageController,
                itemCount: dailyworkSummaryVM.weekList.length,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (value) {
                  dailyworkSummaryVM.week.value =
                      dailyworkSummaryVM.weekList[value];
                  dailyworkSummaryVM.pageChanged.value = value;
                },
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Obx(
                    () => ListView.builder(
                      itemCount: dailyworkSummaryVM.dailyWorkList.length,
                      padding: EdgeInsets.only(top: 0, left: 17.w, right: 17.w),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              // margin: EdgeInsets.only(bottom: 10.h),
                              padding: EdgeInsets.only(
                                  top: 8.h,
                                  left: 12.w,
                                  right: 9.w,
                                  bottom: 4.h),
                              decoration: BoxDecoration(
                                color: Color(0xffA3CFF1).withOpacity(0.35),
                              ),
                              child: Obx(
                                () => Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        appText(
                                            textAlign: TextAlign.left,
                                            title:
                                                'Site: ${dailyworkSummaryVM.dailyWorkList[index].jobSiteName}',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                        // GestureDetector(
                                        //   onTap: () async {
                                        //     final editDailyVM =
                                        //         showLoadingIndicator(
                                        //             context: context);
                                        //     DailyWorkSummaryRecruiterByIdModel
                                        //         model = await dailyworkSummaryVM
                                        //             .getRecruiterSummaryByID(
                                        //                 id: dailyworkSummaryVM
                                        //                     .dailyWorkList[index]
                                        //                     .id!);

                                        //     print(model.toJson());

                                        //     hideOpenDialog(context: context);
                                        //     if (model != null) {
                                        //       Get.toNamed(
                                        //           AppRoutes
                                        //               .editDailyTotalHoursRecruiterView,
                                        //           arguments: [model, workerId]);
                                        //     }
                                        //   },
                                        //   child: Image.asset(
                                        //     'assets/icons/create.png',
                                        //     width: 14.w,
                                        //     height: 14.h,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                    SizedBox(height: 2.h),
                                    Obx(
                                      () => Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          appText(
                                            textAlign: TextAlign.left,
                                            title:
                                                'Start Time: ${DateFormat.jm().format(DateFormat("HH:mm:ss").parse(dailyworkSummaryVM.dailyWorkList[index].startTime!))}',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          appText(
                                            textAlign: TextAlign.right,
                                            title:
                                                '${DateFormat.d().format(dailyworkSummaryVM.dailyWorkList[index].date!)}-${DateFormat.MMMM().format(dailyworkSummaryVM.dailyWorkList[index].date!)}-${DateFormat.y().format(dailyworkSummaryVM.dailyWorkList[index].date!)}',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 2.h),
                                    Obx(
                                      () => Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          appText(
                                            textAlign: TextAlign.left,
                                            title:
                                                'Total hrs worked: ${dailyworkSummaryVM.dailyWorkList[index].hours} hrs',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          appText(
                                            textAlign: TextAlign.right,
                                            title:
                                                'End Time: ${DateFormat.jm().format(DateFormat("HH:mm:ss").parse(dailyworkSummaryVM.dailyWorkList[index].endTime!))}',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () async {
                                      dailyworkSummaryVM
                                          .selectedDailySummaryIndex
                                          .value = index;
                                      final editDailyVM = showLoadingIndicator(
                                          context: context);
                                      DailyWorkSummaryRecruiterByIdModel model =
                                          await dailyworkSummaryVM
                                              .getRecruiterSummaryByID(
                                                  id: dailyworkSummaryVM
                                                      .dailyWorkList[index]
                                                      .id!);

                                      print(model.toJson());

                                      hideOpenDialog(context: context);
                                      if (model != null) {
                                        Get.toNamed(
                                            AppRoutes
                                                .editDailyTotalHoursRecruiterView,
                                            arguments: [model, workerId]);
                                      }
                                    },
                                    child: Container(
                                      // width: double.infinity,

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
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      showRecruiterDeleteDialog(
                                          workerID: workerId,
                                          context: context,
                                          viewModel: dailyworkSummaryVM,
                                          id: dailyworkSummaryVM
                                              .dailyWorkList[index].id!);
                                      // dailyworkSummaryVM
                                      //     .deleteSpecificData(
                                      //         id: dailyworkSummaryVM
                                      //             .dailyWorkList[index].id)
                                      //     .whenComplete(() =>
                                      //         dailyworkSummaryVM.getDailyWorkSummary());
                                    },
                                    child: Container(
                                      // width: double.infinity,
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
                                        color: Colors.red.withOpacity(0.35),
                                      ),
                                      child: const Icon(Icons.delete),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            )
                          ],
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                children: [
                  customTextButton(
                      buttonColor: AppColor.blue,
                      onTap: () async {
                        showLoadingIndicator(context: context);
                        bool isSuccess = await dailyworkSummaryVM
                            .submitDailyRecruiterHours(workerId: workerId);
                        hideOpenDialog(context: context);
                        if (isSuccess == true) {
                          sucessfullyHoursAddedRecruiterDialog(
                            backButtonCallback: () {
                              Get.back();
                            },
                            isCheckButton: false,
                            checkTitle: 'Check List',
                            context: context,
                            title: 'Summary Successfully Submitted',
                            onTap: () {
                              Get.toNamed(AppRoutes.dailySummaryRecruiterView);
                            },
                          );
                        }
                      },
                      title: 'Submit'),
                  SizedBox(
                    height: 10.h,
                  ),
                  customTextButton(
                    onTap: () {
                      homeVM.getSpecificWorkerData().then((val) =>
                          Get.offAllNamed(AppRoutes.workerView,
                              arguments: val));
                    },
                    title: 'Close',
                    buttonColor: AppColor.blue.withOpacity(0.37),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            )
          ],
        ),
      ),
    );
  }
}
