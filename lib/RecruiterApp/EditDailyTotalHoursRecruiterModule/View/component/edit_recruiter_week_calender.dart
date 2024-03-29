import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../Constant/AppColors/colors.dart';
import '../../ViewModel/edit_daily_total_hours_recruiter_view_model.dart';

extension DateTimeExt on DateTime {
  DateTime get monthStart => DateTime(year, month);
  DateTime get dayStart => DateTime(year, month, day);

  DateTime addMonth(int count) {
    return DateTime(year, month + count, day);
  }

  bool isSameDate(DateTime date) {
    return year == date.year && month == date.month && day == date.day;
  }

  bool get isToday {
    return isSameDate(DateTime.now());
  }
}

class EditDatePicker extends StatefulWidget {
  final DateTime endWeekDate;
  EditDatePicker({super.key, required this.endWeekDate});

  @override
  State<EditDatePicker> createState() => _EditDatePickerState();
}

class _EditDatePickerState extends State<EditDatePicker> {
  late DateTime selectedMonth;

  DateTime? selectedDate;

  @override
  void initState() {
    selectedMonth = widget.endWeekDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     _Header(
        //       selectedMonth: selectedMonth,
        //       selectedDate: selectedDate,
        //       onChange: (value) => setState(() => selectedMonth = value),
        //     ),
        //     Expanded(
        //       child:
        _Body(
      startingDate: widget.endWeekDate,
      selectedDate: selectedDate,
      selectedMonth: selectedMonth,
      selectDate: (DateTime value) => setState(() {
        selectedDate = value;
      }),
    );
    //     _Bottom(
    //       selectedDate: selectedDate,
    //     )
    //   ],
    // ),
  }
}

class _Body extends StatelessWidget {
  _Body({
    required this.selectedMonth,
    required this.selectedDate,
    required this.selectDate,
    required this.startingDate,
  });

  final DateTime selectedMonth;
  final DateTime? selectedDate;
  final dailyTotalVM = Get.put(EditDailyTotalHoursRecruiterViewModel());
  final ValueChanged<DateTime> selectDate;
  final DateTime startingDate;

  @override
  Widget build(BuildContext context) {
    var data = CalendarMonthData(
      year: selectedMonth.year,
      month: selectedMonth.month,
    );

    // Calculate the start and end of the current week
    final DateTime now = startingDate.dayStart;
    final DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final DateTime endOfWeek = now.add(Duration(days: 7 - now.weekday));

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text('M'),
            Text('T'),
            Text('W'),
            Text('T'),
            Text('F'),
            Text('S'),
            Text('S'),
          ],
        ),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 1,
            ),
            for (var week in data.weeks)
              Row(
                children: week.map((d) {
                  // Filter out days that are not in the current week
                  if (d.date.isBefore(startOfWeek) ||
                      d.date.isAfter(endOfWeek)) {
                    return const SizedBox(
                        width: 35); // Empty space for days outside the week
                  }

                  return Expanded(
                    child: _RowItem(
                      hasRightBorder: false,
                      date: d.date,
                      isActiveMonth: d.isActiveMonth,
                      onTap: () {
                        selectDate(d.date);

                        dailyTotalVM.pickedDate.value =
                            d.date.toIso8601String();
                        // "${DateFormat('yy-MM-dd').format(d.date)}";
                        print(dailyTotalVM.pickedDate.value);
                        Get.back();
                      },
                      isSelected: selectedDate != null &&
                          selectedDate!.isSameDate(d.date),
                    ),
                  );
                }).toList(),
              ),
          ],
        ),
      ],
    );
  }
}

class _RowItem extends StatelessWidget {
  const _RowItem({
    required this.hasRightBorder,
    required this.isActiveMonth,
    required this.isSelected,
    required this.date,
    required this.onTap,
  });

  final bool hasRightBorder;
  final bool isActiveMonth;
  final VoidCallback onTap;
  final bool isSelected;

  final DateTime date;
  @override
  Widget build(BuildContext context) {
    final int number = date.day;
    final isToday = date.isToday;
    final bool isPassed = date.isBefore(DateTime.now());
    Color textColor;

    if (isSelected) {
      textColor = Colors.red;
    } else if (isPassed) {
      textColor = isActiveMonth ? Colors.black : Colors.black;
    } else {
      textColor = isActiveMonth ? Colors.black : Colors.black;
    }
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        alignment: Alignment.center,
        height: 35,
        child: Text(
          number.toString(),
          style: TextStyle(fontSize: 14, color: textColor),
        ),
      ),
    );
  }
}

// class _Header extends StatelessWidget {
//   const _Header({
//     required this.selectedMonth,
//     required this.selectedDate,
//     required this.onChange,
//   });

//   final DateTime selectedMonth;
//   final DateTime? selectedDate;

//   final ValueChanged<DateTime> onChange;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           Text(
//               'Selected date: ${selectedDate == null ? 'non' : "${selectedDate!.day}.${selectedDate!.month}.${selectedDate!.year}"}'),
//           Row(
//             children: [
//               Expanded(
//                 child: Text(
//                   'Month: ${selectedMonth.month + 1}/${selectedMonth.year}',
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               IconButton(
//                 onPressed: () {
//                   onChange(selectedMonth.addMonth(-1));
//                 },
//                 icon: const Icon(Icons.arrow_left_sharp),
//               ),
//               IconButton(
//                 onPressed: () {
//                   onChange(selectedMonth.addMonth(1));
//                 },
//                 icon: const Icon(Icons.arrow_right_sharp),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _Bottom extends StatelessWidget {
//   const _Bottom({
//     required this.selectedDate,
//   });

//   final DateTime? selectedDate;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ElevatedButton(
//           onPressed: () {
//             print(selectedDate);
//           },
//           child: const Text('save'),
//         ),
//         ElevatedButton(
//           onPressed: () {},
//           child: const Text('cancel'),
//         ),
//       ],
//     );
//   }
// }

class CalendarMonthData {
  final int year;
  final int month;

  int get daysInMonth => DateUtils.getDaysInMonth(year, month);
  int get firstDayOfWeekIndex => 0;

  int get weeksCount => ((daysInMonth + firstDayOffset) / 7).ceil();

  const CalendarMonthData({
    required this.year,
    required this.month,
  });

  int get firstDayOffset {
    // final int weekdayFromMonday =
    //     DateTime(year, month).weekday - DateTime.sunday;
    final int weekdayFromMonday = DateTime(year, month).weekday - 1;
    return (weekdayFromMonday - ((firstDayOfWeekIndex - 1) % 7)) % 7 - 1;
  }

  List<List<CalendarDayData>> get weeks {
    final res = <List<CalendarDayData>>[];
    var firstDayMonth = DateTime(year, month, 1);
    var firstDayOfWeek = firstDayMonth.subtract(Duration(days: firstDayOffset));

    for (var w = 0; w < weeksCount; w++) {
      final week = List<CalendarDayData>.generate(
        7,
        (index) {
          final date = firstDayOfWeek.add(Duration(days: index));

          final isActiveMonth = date.year == year && date.month == month;

          return CalendarDayData(
            date: date,
            isActiveMonth: isActiveMonth,
            isActiveDate: date.isToday,
          );
        },
      );
      res.add(week);
      firstDayOfWeek = firstDayOfWeek.add(const Duration(days: 7));
    }
    return res;
  }
}

class CalendarDayData {
  final DateTime date;
  final bool isActiveMonth;
  final bool isActiveDate;

  const CalendarDayData({
    required this.date,
    required this.isActiveMonth,
    required this.isActiveDate,
  });
// }
// showWeekDayPicker(
//     {required BuildContext context, required Rx<DateTime> selectedDate}) {
//   DateTime? selected;
//   return showGeneralDialog(
//     context: context,
//     pageBuilder: (context, animation, secondaryAnimation) {
//       return Dialog(
//         backgroundColor: AppColor.white,
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//           color: AppColor.blue.withOpacity(0.44),
//           height: 65.h,
//           child: _CurrentWeek(
//               selectedDate: selected,
//               selectDate: (DateTime value) {
//                 selectedDate.value = value;
//               }),
//         ),

//         // _Bottom(selectedDate: selectedDate),
//         //   ],
//         // )
//       );
//     },
//   );
// }

// class _CurrentWeek extends StatelessWidget {
//   const _CurrentWeek({
//     required this.selectedDate,
//     required this.selectDate,
//   });

//   final DateTime? selectedDate;
//   final ValueChanged<DateTime> selectDate;

//   @override
//   Widget build(BuildContext context) {
//     final today = DateTime.now().dayStart;
//     final weekStartDate = today.subtract(Duration(days: today.weekday - 1));
//     final weekEndDate = today.add(Duration(days: 7 - today.weekday));

//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: const [
//             Text('M'),
//             Text('T'),
//             Text('W'),
//             Text('T'),
//             Text('F'),
//             Text('S'),
//             Text('S'),
//           ],
//         ),
//         const SizedBox(height: 10),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(
//               height: 1,
//             ),
//             Row(
//               children: List.generate(7, (index) {
//                 final date = weekStartDate.add(Duration(days: index));
//                 return Expanded(
//                   child: _RowItem(
//                     hasRightBorder: false,
//                     date: date,
//                     isActiveMonth:
//                         true, // All dates in the current week are from the current month
//                     onTap: () {
//                       selectDate(date);
//                       Get.back();
//                       print(selectedDate);
//                     },
//                     isSelected:
//                         selectedDate != null && selectedDate!.isSameDate(date),
//                   ),
//                 );
//               }),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
}
