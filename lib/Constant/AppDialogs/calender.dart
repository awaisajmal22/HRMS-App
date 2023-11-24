import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../AppColors/colors.dart';

// getWeeklyVerticalCalendar(
//     {required BuildContext context, required dynamic weeklyTotalHoursVM}) {
//   return showGeneralDialog(
//     context: context,
//     pageBuilder: (context, animation, secondaryAnimation) {
//       return Center(
//         child: Container(
//           decoration: BoxDecoration(
//               color: Colors.white, borderRadius: BorderRadius.circular(10)),
//           height: MediaQuery.of(context).size.height -
//               MediaQuery.of(context).size.height * 0.3,
//           width: MediaQuery.of(context).size.width - 60,
//           child: SfDateRangePicker(
//             showActionButtons: true,
//             onCancel: () {
//               Get.back();
//             },
//             onSubmit: (val) {
//               Get.back();
//             },
//             cancelText: 'CANCEL',
//             confirmText: 'OK',
//             controller: weeklyTotalHoursVM.dateController,
//             onSelectionChanged: weeklyTotalHoursVM.selectionChanged,
//             enableMultiView: false,
//             headerStyle: DateRangePickerHeaderStyle(
//                 backgroundColor: AppColor.blue,
//                 textStyle:
//                     GoogleFonts.roboto(fontSize: 20, color: AppColor.white)),
//             selectionMode: DateRangePickerSelectionMode.range,
//             navigationDirection: DateRangePickerNavigationDirection.vertical,
//             monthViewSettings: const DateRangePickerMonthViewSettings(
//                 enableSwipeSelection: false),
//             headerHeight: 80,
//           ),
//         ),
//       );
//     },
//   );
// }

// getDailyVerticalCalendar(
//     {required BuildContext context, required DailyTotalHoursViewModel dailyTotalHoursVM}) {
//   return showGeneralDialog(
//     context: context,
//     pageBuilder: (context, animation, secondaryAnimation) {
//       DateTime maxDate = DateTime.now().add(Duration(days: -7));
//       return Center(
//         child: Container(
//           decoration: BoxDecoration(
//               color: Colors.white, borderRadius: BorderRadius.circular(10)),
//           height: MediaQuery.of(context).size.height -
//               MediaQuery.of(context).size.height * 0.3,
//           width: MediaQuery.of(context).size.width - 60,
//           child: SfDateRangePicker(
//             maxDate: DateTime.now().add(Duration(days: -7)),
//             minDate: maxDate.add(Duration(days: -7)),
//             showActionButtons: true,
//             onCancel: () {
//               Get.back();
//             },
//             onSubmit: (val) {
//               Get.back();
//             },
//             cancelText: 'CANCEL',
//             confirmText: 'OK',
//             controller: dailyTotalHoursVM.dateController,
//             onSelectionChanged: dailyTotalHoursVM.selectionChanged,
//             enableMultiView: false,
//             headerStyle: DateRangePickerHeaderStyle(
//                 backgroundColor: AppColor.blue,
//                 textStyle:
//                     GoogleFonts.roboto(fontSize: 20, color: AppColor.white)),
//             selectionMode: DateRangePickerSelectionMode.single,
//             navigationDirection: DateRangePickerNavigationDirection.vertical,
//             monthViewSettings: const DateRangePickerMonthViewSettings(
//                 enableSwipeSelection: false),
//             headerHeight: 80,
//           ),
//         ),
//       );
//     },
//   );
// }
// getEditDailyVerticalCalendar(
//     {required BuildContext context, required EditDailyTotalHoursViewModel dailyTotalHoursVM}) {
//   return showGeneralDialog(
//     context: context,
//     pageBuilder: (context, animation, secondaryAnimation) {
//       DateTime maxDate = DateTime.now().add(Duration(days: -7));
//       return Center(
//         child: Container(
//           decoration: BoxDecoration(
//               color: Colors.white, borderRadius: BorderRadius.circular(10)),
//           height: MediaQuery.of(context).size.height -
//               MediaQuery.of(context).size.height * 0.3,
//           width: MediaQuery.of(context).size.width - 60,
//           child: SfDateRangePicker(
//             maxDate: DateTime.now().add(Duration(days: -7)),
//             minDate: maxDate.add(Duration(days: -7)),
//             showActionButtons: true,
//             onCancel: () {
//               Get.back();
//             },
//             onSubmit: (val) {
//               Get.back();
//             },
//             cancelText: 'CANCEL',
//             confirmText: 'OK',
//             controller: dailyTotalHoursVM.dateController,
//             onSelectionChanged: dailyTotalHoursVM.selectionChanged,
//             enableMultiView: false,
//             headerStyle: DateRangePickerHeaderStyle(
//                 backgroundColor: AppColor.blue,
//                 textStyle:
//                     GoogleFonts.roboto(fontSize: 20, color: AppColor.white)),
//             selectionMode: DateRangePickerSelectionMode.single,
//             navigationDirection: DateRangePickerNavigationDirection.vertical,
//             monthViewSettings: const DateRangePickerMonthViewSettings(
//                 enableSwipeSelection: false),
//             headerHeight: 80,
//           ),
//         ),
//       );
//     },
//   );
// }
