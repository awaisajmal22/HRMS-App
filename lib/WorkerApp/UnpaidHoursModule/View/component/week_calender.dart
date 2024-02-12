import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hrmsapp/Constant/AppText/app_text.dart';
import 'package:intl/intl.dart';

import '../../../../Constant/AppColors/colors.dart';
import '../../ViewModel/unpaid_hours_view_model.dart';

class UnpaidDatePicker extends StatelessWidget {
  UnpaidDatePicker({super.key});
  List weekDays = [
    'M',
    'T',
    'W',
    'T',
    'F',
    'S',
    'S',
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetX<UnpaidHoursViewModel>(
      init: UnpaidHoursViewModel(),
      builder: (controller) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (controller.selectedWeekIndex.value > 0) {
                      controller.selectedWeekIndex.value--;
                      controller.weekNumber.value = controller
                          .last12WeekList[controller.selectedWeekIndex.value]
                          .weekNumber!;
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
                       controller.startweek.value = DateFormat.MMMMd().format(
                          DateTime.parse(controller
                              .last12WeekList[
                                  controller.selectedWeekIndex.value]
                              .dates![0]
                              .toString()));
                              controller.endWeek.value = DateFormat.MMMMd().format(
                          DateTime.parse(controller
                              .last12WeekList[
                                  controller.selectedWeekIndex.value]
                              .dates![6]
                              .toString()));
                    }
                  },
                  child: Icon(Icons.keyboard_arrow_left),
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
                  child: Obx(
                    () => appText(
                        textColor: Colors.white,
                        fontSize: 12,
                        title:
                            '${controller.startweek.value} to ${controller.endWeek.value}'),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.020,
                ),
                GestureDetector(
                  onTap: () {
                    print(controller.selectedWeekIndex.value);
                    if (controller.selectedWeekIndex.value < 11) {
                      controller.selectedWeekIndex++;
                      controller.weekNumber.value = controller
                          .last12WeekList[controller.selectedWeekIndex.value]
                          .weekNumber!;
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
                      controller.startweek.value = DateFormat.MMMMd().format(
                          DateTime.parse(controller
                              .last12WeekList[
                                  controller.selectedWeekIndex.value]
                              .dates![0]
                              .toString()));
                              controller.endWeek.value = DateFormat.MMMMd().format(
                          DateTime.parse(controller
                              .last12WeekList[
                                  controller.selectedWeekIndex.value]
                              .dates![6]
                              .toString()));
                    }
                  },
                  child: Icon(Icons.keyboard_arrow_right),
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
            GestureDetector(
              onTap: () {
                controller.weekNumber.value = controller
                    .last12WeekList[controller.selectedWeekIndex.value]
                    .weekNumber!;
                Get.back();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    controller
                        .last12WeekList[controller.selectedWeekIndex.value]
                        .dates!
                        .length, (index) {
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
            )
          ],
        );
      },
    );
  }
}
