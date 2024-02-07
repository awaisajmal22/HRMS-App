import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../RoutesAndBindings/app_routes.dart';
import '../../../Utils/spint_kit_view_spinner.dart';
import '../../DailyWorkSummaryModule/ViewModel/daily_work_summary_view_model.dart';
import '../../UnpaidHoursModule/ViewModel/unpaid_hours_view_model.dart';
import '../../WeeklyTotalHoursModule/Model/jobSite_model.dart';
import '../../WeeklyTotalHoursModule/Services/jobsite_services.dart';
import '../../WeeklyTotalHoursModule/ViewModel/weeklytotal_view_model.dart';
import '../../WeeklyWorkSummaryModule/ViewModel/weekly_work_summary_view_model.dart';
import '../Model/current_week_date_model.dart';
import '../Model/home_model.dart';
import '../Services/home_services.dart';

class HomeViewModel extends GetxController {
  RxString selectedDropDownValue = ''.obs;
  List<JobSiteModel> _jobSites = [];
  List<JobSiteModel> get jobSites => _jobSites;
  List<String> _jobSiteValue = [];
  List<String> get jobSiteValue => _jobSiteValue;

  RxInt selectedJobsiteId = 0.obs;
  RxList<HomeModel> homeFeatureList = <HomeModel>[
    HomeModel(
      title: 'Submit Hours',
      callBack: (context, check) async {
        if (check == 1) {
          Get.toNamed(AppRoutes.dailyTotalHoursView);
        } else if (check == 0) {
          Get.toNamed(AppRoutes.weeklyTotalView);
        }
      },
    ),
    HomeModel(
      title: 'Check Current Summary',
      callBack: (context, check) async {
        if (check == 1) {
          final dailyWorkVM = Get.put(DailyWorkSummaryViewModel());
          showLoadingIndicator(context: context);
          final result = await dailyWorkVM.getDailyWorkSummary();
          print(result);
          hideOpenDialog(context: context);
          if (result != null) {
            Get.toNamed(AppRoutes.dailySummaryView);
          }
        } else if (check == 0) {
          final weeklyWorkVM = Get.put(WeeklyWorkSummaryViewModel());
          showLoadingIndicator(context: context);
          final result = await weeklyWorkVM.getweeklyWorkSummary();
          print("data is here $result");
          hideOpenDialog(context: context);
          if (result != null) {
            Get.toNamed(AppRoutes.weeklySummaryView);
          }
        }
      },
    ),
    HomeModel(
      title: 'Report Unpaid Hours',
      callBack: (context, check) async {
        if (check == 0) {
          Get.toNamed(AppRoutes.unpaidHoursView);
        } else if (check == 1) {
          Get.toNamed(AppRoutes.unpaidHoursView);
        }
      },
    ),
  ].obs;
  RxString name = ''.obs;
  RxString id = ''.obs;
  RxInt check = 0.obs;
  getUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    id.value = pref.getString('id') ?? '';
    name.value = pref.getString('name') ?? '';
    check.value = pref.getInt('check') ?? 0;
  }

  Future<List<JobSiteModel>> getJobSite({required bool reload}) async {
    if (reload == true) {
      _jobSiteValue.clear();
      _jobSites.clear();
    }
    final response = await ApiServices().getjobSiteServices();
    selectedDropDownValue.value = response[0].value;
    selectedJobsiteId.value = response[0].id;
    print(selectedDropDownValue.value);
    for (var a in response) {
      _jobSiteValue.add(a.value);
      _jobSites.add(a);
      print('yes its done');
    }
    // print(jobSiteValue.length);
    return response;
  }

  RxString startDate = ''.obs;
  Rx<DateTime> endWeekDate = DateTime.now().obs;
  RxString endDate = ''.obs;
  RxString startOfWeek = ''.obs;
  RxString endOfWeek = ''.obs;
  getCurrentWeek() async {
    CurrentWeekDateModel date = await HomeServices().getCurrentWeekDate();
    endWeekDate.value = date.endDate!;
    final startDay = DateFormat.EEEE()
        .format(DateTime.parse(date.startDate!.toIso8601String()));
    startOfWeek.value =
        "${DateFormat('yyyy-MMM-dd').format(DateTime.parse(date.startDate!.toIso8601String()))}";
    final dateStart = DateFormat.d()
        .format(DateTime.parse(date.startDate!.toIso8601String()));
    startDate.value = "$startDay $dateStart";
    print(startDate.value);
    final endDay = DateFormat.EEEE()
        .format(DateTime.parse(date.endDate!.toIso8601String()));
    endOfWeek.value =
        "${DateFormat('yyyy-MMM-dd').format(DateTime.parse(date.endDate!.toIso8601String()))}";
    final dateEnd =
        DateFormat.d().format(DateTime.parse(date.endDate!.toIso8601String()));
    endDate.value = '$endDay $dateEnd';
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getUserData();

    super.onInit();
    // getJobSite(reload: true);
    getCurrentWeek();
  }
}
