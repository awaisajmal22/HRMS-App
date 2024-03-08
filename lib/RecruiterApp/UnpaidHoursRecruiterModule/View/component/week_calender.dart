import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hrmsapp/Constant/AppText/app_text.dart';
import 'package:intl/intl.dart';

import '../../../../Constant/AppColors/colors.dart';
import '../../ViewModel/unpaid_hours_recruiter_view_model.dart';

class UnpaidDatePicker extends StatelessWidget {
  UnpaidDatePicker({super.key});
  List<String> weekDays = [
    "M",
    "T",
    "W",
    "T",
    "F",
    "S",
    "S",
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetX<UnpaidHoursRecruiterViewModel>(
      init: UnpaidHoursRecruiterViewModel(),
      builder: (controller) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: appText(
                    textColor: Colors.white,
                    fontSize: 12,
                    title: controller.startYear.value ==
                            controller.endYear.value
                        ? "Year ${controller.startYear.value}"
                        : "Year ${controller.startYear.value} - Year ${controller.endYear.value}",
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.010,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (controller.selectedWeekIndex.value < 10) {
                      controller.selectedWeekIndex++;
                      controller.weekNumber.value = DateTime.parse(controller
                              .last12WeekList[
                                  controller.selectedWeekIndex.value]
                              .dates![0]
                              .toIso8601String())
                          .weekday;
                      print(controller.weekNumber.value);
                      // controller.weekNumber.value = controller
                      //     .last12WeekList[controller.selectedWeekIndex.value]
                      //     .weekNumber!;
                      controller.startDate.value = DateFormat.yMMMMd()
                          .format(controller
                              .last12WeekList[
                                  controller.selectedWeekIndex.value]
                              .dates![0])
                          .toString();
                      controller.endDate.value = DateFormat.yMMMMd()
                          .format(controller
                              .last12WeekList[
                                  controller.selectedWeekIndex.value]
                              .dates![6])
                          .toString();
                      controller.startweek.value = DateFormat.MMMMd()
                          .format(controller
                              .last12WeekList[
                                  controller.selectedWeekIndex.value]
                              .dates![0])
                          .toString();
                      controller.endWeek.value = DateFormat.MMMMd()
                          .format(controller
                              .last12WeekList[
                                  controller.selectedWeekIndex.value]
                              .dates![6])
                          .toString();
                      controller.startYear.value = DateFormat.y().format(
                          DateTime.parse(controller
                              .last12WeekList[
                                  controller.selectedWeekIndex.value]
                              .dates![0]
                              .toString()));
                      controller.endYear.value = DateFormat.y().format(
                          DateTime.parse(controller
                              .last12WeekList[
                                  controller.selectedWeekIndex.value]
                              .dates![6]
                              .toString()));
                    }
                  },
                  child: Icon(Icons.keyboard_arrow_left, size: 30.h),
                ),
                SizedBox(
                  width: size.width * 0.020,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.020,
                      vertical: size.height * 0.010),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5)),
                  child: appText(
                      textColor: Colors.white,
                      fontSize: 12,
                      title:
                          '${controller.startweek.value} to ${controller.endWeek.value}'),
                ),
                SizedBox(
                  width: size.width * 0.020,
                ),
                GestureDetector(
                  onTap: () {
                    if (controller.selectedWeekIndex.value > 0) {
                      controller.selectedWeekIndex.value--;
                      controller.weekNumber.value = DateTime.parse(controller
                              .last12WeekList[
                                  controller.selectedWeekIndex.value]
                              .dates![0]
                              .toIso8601String())
                          .weekday;
                      controller.startDate.value = DateFormat.yMMMMd()
                          .format(controller
                              .last12WeekList[
                                  controller.selectedWeekIndex.value]
                              .dates![0])
                          .toString();
                      controller.endDate.value = DateFormat.yMMMMd()
                          .format(controller
                              .last12WeekList[
                                  controller.selectedWeekIndex.value]
                              .dates![6])
                          .toString();
                      controller.startweek.value = DateFormat.MMMMd()
                          .format(controller
                              .last12WeekList[
                                  controller.selectedWeekIndex.value]
                              .dates![0])
                          .toString();
                      controller.endWeek.value = DateFormat.MMMMd()
                          .format(controller
                              .last12WeekList[
                                  controller.selectedWeekIndex.value]
                              .dates![6])
                          .toString();
                      controller.startYear.value = DateFormat.y().format(
                          DateTime.parse(controller
                              .last12WeekList[
                                  controller.selectedWeekIndex.value]
                              .dates![0]
                              .toString()));
                      controller.endYear.value = DateFormat.y().format(
                          DateTime.parse(controller
                              .last12WeekList[
                                  controller.selectedWeekIndex.value]
                              .dates![6]
                              .toString()));
                    }
                  },
                  child: Icon(Icons.keyboard_arrow_right, size: 30.h),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.010,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text('M'),
            //     Text('T'),
            //     Text('W'),
            //     Text('T'),
            //     Text('F'),
            //     Text('S'),
            //     Text('S'),
            //   ],
            // ),
            // SizedBox(
            //   height: size.height * 0.010,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  controller.last12WeekList[controller.selectedWeekIndex.value]
                      .dates!.length, (index) {
                return Column(
                  children: [
                    Text(weekDays[index]),
                    SizedBox(
                      height: size.height * 0.010,
                    ),
                    Text(controller
                        .last12WeekList[controller.selectedWeekIndex.value]
                        .dates![index]
                        .day
                        .toString()),
                  ],
                );
              }),
            ),
            SizedBox(
              height: size.height * 0.020,
            ),
            GestureDetector(
              onTap: () {
                controller.weekNumber.value = controller
                    .last12WeekList[controller.selectedWeekIndex.value]
                    .weekNumber!;
                Get.back();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: appText(
                    textColor: Colors.white, fontSize: 12, title: 'Confirm'),
              ),
            ),
          ],
        );
      },
    );
  }
}
