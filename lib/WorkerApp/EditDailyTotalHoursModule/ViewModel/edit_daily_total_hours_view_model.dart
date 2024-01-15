import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../WeeklyTotalHoursModule/Model/jobSite_model.dart';
import '../../WeeklyTotalHoursModule/Services/jobsite_services.dart';
import '../Services/edit_daily_total_hours_services.dart';

class EditDailyTotalHoursViewModel extends GetxController {
  TextEditingController jobSiteController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  TextEditingController generalExpController = TextEditingController();
  TextEditingController parkingTravelController = TextEditingController();
  TextEditingController totalHoursController = TextEditingController();
  // final DateRangePickerController dateController = DateRangePickerController();
  RxString pickedDate = ''.obs;
  RxString selectedPayPeriod = 'Monday+Date to Sunday+Date'.obs;
  Rx<TimeOfDay> startTime = TimeOfDay.now().obs;
  Rx<TimeOfDay> endTime = TimeOfDay.now().obs;

  // selectionChanged(DateRangePickerSelectionChangedArgs args) {
  //   selectedPayPeriod.value =
  //       DateFormat('dd, MMMM yyyy').format(args.value).toString() ?? "";
  //   ;
  // }

  TimeOfDay selectedTime = TimeOfDay.now();
  String getTime(TimeOfDay? start, TimeOfDay? end) {
    if (start == null || end == null) return '';

    // DateTime(year, month, day, hour, minute)
    final startDT = DateTime(9, 9, 9, start.hour, start.minute);
    final endDT = DateTime(9, 9, 10, end.hour, end.minute);

    final range = DateTimeRange(start: startDT, end: endDT);
    final hours = range.duration.inHours % 24;
    final minutes = range.duration.inMinutes % 60;

    final _onlyHours = minutes == 0;
    final _onlyMinutes = hours == 0;
    final hourText = _onlyMinutes ? '' : '$hours';
    final minutesText = _onlyHours ? '' : '$minutes';
    totalHoursController.text = hourText + minutesText;
    return hourText + minutesText;
  }

  Future<void> selectEndTime(BuildContext context) async {
    final TimeOfDay? picked_s = await showTimePicker(
        context: context,
        initialTime: const TimeOfDay(hour: 12, minute: 00),
        initialEntryMode: TimePickerEntryMode.inputOnly);

    if (picked_s != null && picked_s != selectedTime) {
      endTime.value = picked_s;
      final date = DateTime.now();
      endTimeController.text = DateFormat.jm().format(DateTime(
          date.year, date.month, date.day, picked_s.hour, picked_s.minute));
      ;
    }
  }

  Future<void> selectStartTime(BuildContext context) async {
    final TimeOfDay? picked_s = await showTimePicker(
        context: context,
        initialTime: const TimeOfDay(hour: 12, minute: 00),
        initialEntryMode: TimePickerEntryMode.inputOnly);

    if (picked_s != null && picked_s != selectedTime) {
      startTime.value = picked_s;
      final date = DateTime.now();
      startTimeController.text = DateFormat.jm().format(DateTime(
          date.year, date.month, date.day, picked_s.hour, picked_s.minute));
    }
  }

  String formatDuration(Duration duration) {
    int hours = duration.inHours;
    int minutes = (duration.inMinutes % 60).abs();
    int seconds = (duration.inSeconds % 60).abs();

    String formattedTime =
        '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

    return formattedTime;
  }

  Future<bool> EditsubmitDailyHours({
    required int id,
    required String startTime,
    required String endTime,
    required int totalHours,
    required String date,
    required double generalExpValue,
    required double parkingTravelValue,
    required String parkingTravelImage,
    required String generalExpImage,
    required String feedBack,
    required int jobSiteID,
  }) async {
    bool isSuccess = await EditDailyHourServices().editDailySubmitHoursServices(
      id: id,
      startTime: startTime,
      endTime: endTime,
      totalHours: totalHours,
      date: date,
      generalExpValue: generalExpValue,
      parkingTravelValue: parkingTravelValue,
      parkingTravelImage: parkingTravelImage,
      generalExpImage: generalExpImage,
      feedBack: feedBack,
      jobSiteID: jobSiteID,
    );
    return isSuccess;
  }

  RxBool isKeyboard =false.obs;
  @override
  void onInit() {
    KeyboardVisibilityController().onChange.listen((event) { 
      isKeyboard.value = event;
    });
    // TODO: implement onInit
    super.onInit();
  }
}
