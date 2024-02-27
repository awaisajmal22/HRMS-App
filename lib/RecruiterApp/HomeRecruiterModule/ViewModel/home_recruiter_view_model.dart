import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/current_week_recruiter_model.dart';

import '../Model/job_site_recruiter_model.dart';
import '../Model/workers_list_model.dart';
import '../services/home_recruiter_services.dart';

class HomeRecruiterViewModel extends GetxController {
  // RxList workersList = [
  //   'Worker 1',
  //   'Worker 2',
  //   'Worker 3',
  //   'Worker 4',
  // ].obs;

  RxList<WorkersListModel> workerList = <WorkersListModel>[].obs;
  Future<List<WorkersListModel>> getWorkerList() async {
    final data = await HomeRecruiterServices().getWorkerList();
    if (data != null) {
      workerList.value = data;

      print(data);
    }
    return data;
  }

  RxString selectedDropDownValue = ''.obs;
  List<JobSiteRecruiterModel> _jobSites = [];
  List<JobSiteRecruiterModel> get jobSites => _jobSites;
  List<String> _jobSiteValue = [];
  List<String> get jobSiteValue => _jobSiteValue;

  RxInt selectedJobsiteId = 0.obs;
  RxString name = ''.obs;
  RxString id = ''.obs;
  RxInt check = 0.obs;

  Future<List<JobSiteRecruiterModel>> getRecruiterJobSite(
      {required bool reload, required int workerId}) async {
    if (reload == true) {
      _jobSiteValue.clear();
      _jobSites.clear();
    }
    final response = await HomeRecruiterServices()
        .getRecruiterJobSiteServices(workerId: workerId);

    print(selectedDropDownValue.value);
    if (response.isNotEmpty) {
      selectedDropDownValue.value = response[0].value;
      selectedJobsiteId.value = response[0].id;
      for (var a in response) {
        _jobSiteValue.add(a.value);
        _jobSites.add(a);
        print('yes its done');
      }
    } else {
      _jobSiteValue.add('Job Sites');
      selectedDropDownValue.value = 'Job Sites';
      _jobSites.add(JobSiteRecruiterModel(id: 1, value: 'Job Sites'));
    }
    // print(jobSiteValue.length);
    return response;
  }

  RxString startDate = ''.obs;
  RxString endDate = ''.obs;
  RxString startOfWeek = ''.obs;
  RxString endOfWeek = ''.obs;
  Rx<DateTime> endWeekDate = DateTime.now().obs;
   Rx<WorkersListModel> worker = WorkersListModel.fromJson({}).obs;
  Future<WorkersListModel> getSpecificWorkerData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    worker.value = WorkersListModelFromJson(pref.getString('userData') ?? '');
    return worker.value;
  }
  getCurrentWeek() async {
    CurrentWeekRecruiterDateModel date =
        await HomeRecruiterServices().getCurrentWeekDate();
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
    super.onInit();
    getCurrentWeek();
    getWorkerList();
  }
}
