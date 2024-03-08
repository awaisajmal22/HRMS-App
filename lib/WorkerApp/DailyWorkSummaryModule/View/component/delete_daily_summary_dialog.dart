import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrmsapp/Constant/AppText/app_text.dart';
import 'package:hrmsapp/WorkerApp/DailyWorkSummaryModule/ViewModel/daily_work_summary_view_model.dart';

showDeleteDialog(
    {required BuildContext context,
    required DailyWorkSummaryViewModel viewModel,
    required int id}) {
  return showAdaptiveDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: appText(
              title: 'Delete Summary',
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.start),
          content: appText(
              title: 'Do you want to delete your daily summary?',
              fontSize: 14,
              textAlign: TextAlign.start),
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: appText(title: 'No')),
            TextButton(
                onPressed: () {
                  viewModel.selectedDailySummaryIndex.value = -1;
                  viewModel
                      .deleteSpecificData(id: id)
                      .whenComplete(() => viewModel.getDailyWorkSummary())
                      .whenComplete(() => Get.back());
                },
                child: appText(title: 'Yes'))
          ],
        );
      });
}
