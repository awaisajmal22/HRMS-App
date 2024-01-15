import 'package:get/get.dart';

import '../../../RoutesAndBindings/app_routes.dart';
import '../../../Utils/spint_kit_view_spinner.dart';
import '../../DailyWorkSummaryRecruiterModule/ViewModel/daily_work_summary_recruiter_view_model.dart';
import '../../WeeklyWorkSummaryRecruiterModule/ViewModel/weekly_work_summary_recruiter_view_model.dart';
import '../Model/worker_model.dart';

class WorkerViewModel extends GetxController {
  RxList<WorkerModel> homeFeatureList = <WorkerModel>[
    WorkerModel(
      title: 'Submit Hours',
      callBack: (context, check, id) async {
        if (check == 1) {
          Get.toNamed(AppRoutes.dailyTotalHoursRecruiterView, arguments: id);
        } else if (check == 0) {
          Get.toNamed(AppRoutes.weeklyTotalRecruiterView, arguments: id);
        }
      },
    ),
    WorkerModel(
      title: 'Check Current Summary',
      callBack: (context, check, id) async {
        if (check == 1) {
          final dailyWorkVM = Get.put(DailyWorkSummaryRecruiterViewModel());
          showLoadingIndicator(context: context);
          final result =
              await dailyWorkVM.getRecruiterDailyWorkSummary(workerId: id);
          print(result);
          hideOpenDialog(context: context);
          if (result != null) {
            Get.toNamed(AppRoutes.dailySummaryRecruiterView, arguments: id);
          }
        } else if (check == 0) {
          final weeklyWorkVM = Get.put(WeeklyWorkSummaryRecruiterViewModel());
          showLoadingIndicator(context: context);
          final result = await weeklyWorkVM.getRecruiterweeklyWorkSummary(workerId: id);
          print(result);
          hideOpenDialog(context: context);
          if (result != null) {
            Get.toNamed(AppRoutes.weeklySummaryRecruiterView, arguments: id);
          }
        }
      },
    ),
    WorkerModel(
      title: 'Report Unpaid Hours',
      callBack: (context, check, id) async {
        if (check == 0) {
          Get.toNamed(AppRoutes.unpaidHoursRecruiterView, arguments: id);
        } else if (check == 1) {
          Get.toNamed(AppRoutes.unpaidHoursRecruiterView, arguments: id);
        }
      },
    ),
  ].obs;
}
