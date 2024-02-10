import 'package:get/get.dart';
import 'package:hrmsapp/AuthModule/ChangePassword/View/change_password_view.dart';
import 'package:hrmsapp/AuthModule/ChangePassword/ViewModel/change_password_view_model.dart';
import 'package:hrmsapp/AuthModule/Forgetpassword/View/forget_password_view.dart';
import 'package:hrmsapp/AuthModule/Forgetpassword/ViewModel/forget_password_view_model.dart';
import 'package:hrmsapp/AuthModule/OtpModule/View/otp_view.dart';
import 'package:hrmsapp/AuthModule/OtpModule/ViewModel/otp_view_model.dart';
import 'package:hrmsapp/RecruiterApp/UnpaidRecruiterHoursSummaryModule/View/unpaid_recruiter_summary_view.dart';
import 'package:hrmsapp/RecruiterApp/UnpaidRecruiterHoursSummaryModule/ViewModel/unpaid_recuiter_summary_view_model.dart';
import 'package:hrmsapp/WorkerApp/UnpaidHoursSummaryModule/View/unpaid_recruiter_summary_view.dart';
import 'package:hrmsapp/WorkerApp/UnpaidHoursSummaryModule/ViewModel/unpaid_recuiter_summary_view_model.dart';

import '../AuthModule/Login/View/login_view.dart';
import '../AuthModule/Login/ViewModel/login_view_model.dart';
import '../RecruiterApp/BottomNavBarRecruiterModule/View/bottom_nav_bar_recruiter.dart';
import '../RecruiterApp/BottomNavBarRecruiterModule/ViewModel/bottom_nav_bar_recruiter_view_model.dart';
import '../RecruiterApp/DailyTotalHoursRecruiterModule/View/daily_total_hours_recruiter_view.dart';
import '../RecruiterApp/DailyTotalHoursRecruiterModule/ViewModel/daily_total_hours_recruiter_view_model.dart';
import '../RecruiterApp/DailyWorkSummaryRecruiterModule/View/daily_work_summary_recruiter_view.dart';
import '../RecruiterApp/DailyWorkSummaryRecruiterModule/ViewModel/daily_work_summary_recruiter_view_model.dart';
import '../RecruiterApp/EditDailyTotalHoursRecruiterModule/View/edit_daily_total_hours_recruiter_view.dart';
import '../RecruiterApp/EditDailyTotalHoursRecruiterModule/ViewModel/edit_daily_total_hours_recruiter_view_model.dart';
import '../RecruiterApp/EditWeeklyHoursRecruiterModule/View/edit_weekly_total_hours_recruiter_view.dart';
import '../RecruiterApp/EditWeeklyHoursRecruiterModule/ViewModel/edit_weeklytotal_recruiter_view_model.dart';
import '../RecruiterApp/HomeRecruiterModule/ViewModel/home_recruiter_view_model.dart';
import '../RecruiterApp/OnBoardingRecruiterModule/View/onboarding_recruiter_view.dart';
import '../RecruiterApp/OnBoardingRecruiterModule/ViewModel/onboarding_recruiter_view_model.dart';
import '../RecruiterApp/UnpaidHoursRecruiterModule/View/unpaid_hours_recruiter_view.dart';
import '../RecruiterApp/UnpaidHoursRecruiterModule/ViewModel/unpaid_hours_recruiter_view_model.dart';
import '../RecruiterApp/UploadDocumentRecruiterModule/View/upload_document_recruiter_view.dart';
import '../RecruiterApp/UploadDocumentRecruiterModule/ViewModel/upload_document_recruiter_view_model.dart';
import '../RecruiterApp/WeeklyTotalHoursRecruiterModule/View/weekly_total_hours_recruiter_view.dart';
import '../RecruiterApp/WeeklyTotalHoursRecruiterModule/ViewModel/weeklytotal_recruiter_view_model.dart';
import '../RecruiterApp/WeeklyWorkSummaryRecruiterModule/View/weekly_work_summary_recruiter_view.dart';
import '../RecruiterApp/WeeklyWorkSummaryRecruiterModule/ViewModel/weekly_work_summary_recruiter_view_model.dart';
import '../RecruiterApp/WorkerModule/View/worker_view.dart';
import '../RecruiterApp/WorkerModule/ViewModel/worker_view_model.dart';
import '../SplashModule/View/splash_view.dart';
import '../SplashModule/ViewModel/splash_view_model.dart';
import '../WorkerApp/BottomNavBarModule/View/bottom_nav_bar.dart';
import '../WorkerApp/BottomNavBarModule/ViewModel/bottom_nav_bar_view_model.dart';
import '../WorkerApp/DailyTotalHoursModule/View/daily_total_hours_view.dart';
import '../WorkerApp/DailyTotalHoursModule/ViewModel/daily_total_hours_view_model.dart';
import '../WorkerApp/DailyWorkSummaryModule/View/daily_work_summary_view.dart';
import '../WorkerApp/DailyWorkSummaryModule/ViewModel/daily_work_summary_view_model.dart';
import '../WorkerApp/EditDailyTotalHoursModule/View/edit_daily_total_hours_view.dart';
import '../WorkerApp/EditDailyTotalHoursModule/ViewModel/edit_daily_total_hours_view_model.dart';
import '../WorkerApp/EditWeeklyHoursModule/View/edit_weekly_total_hours_view.dart';
import '../WorkerApp/EditWeeklyHoursModule/ViewModel/edit_weeklytotal_view_model.dart';
import '../WorkerApp/HomeModule/ViewModel/home_view_model.dart';
import '../WorkerApp/OnBoardingModule/View/onboarding_view.dart';
import '../WorkerApp/OnBoardingModule/ViewModel/onboarding_view_model.dart';
import '../WorkerApp/SummaryModule/View/summary_view.dart';
import '../WorkerApp/UnpaidHoursModule/View/unpaid_hours_view.dart';
import '../WorkerApp/UnpaidHoursModule/ViewModel/unpaid_hours_view_model.dart';
import '../WorkerApp/UploadDocumentModule/View/upload_document_view.dart';
import '../WorkerApp/UploadDocumentModule/ViewModel/upload_document_view_model.dart';
import '../WorkerApp/WeeklyTotalHoursModule/View/weekly_total_hours_view.dart';
import '../WorkerApp/WeeklyTotalHoursModule/ViewModel/weeklytotal_view_model.dart';
import '../WorkerApp/WeeklyWorkSummaryModule/View/weekly_work_summary_view.dart';
import '../WorkerApp/WeeklyWorkSummaryModule/ViewModel/weekly_work_summary_view_model.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
        name: AppRoutes.splashView,
        transition: Transition.fadeIn,
        page: () => SplashView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => SplashViewModel());
        })),
    GetPage(
        name: AppRoutes.loginView,
        transition: Transition.fadeIn,
        page: () => LoginView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => LoginViewModel());
        })),
    GetPage(
        name: AppRoutes.onBoardingView,
        transition: Transition.fadeIn,
        page: () => OnBoardingView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => OnBoardingViewModel());
        })),
    GetPage(
        name: AppRoutes.navBarView,
        transition: Transition.fadeIn,
        page: () => BottomNavBar(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => BottomNavBarViewModel());
        })),
    GetPage(
        name: AppRoutes.weeklyTotalView,
        transition: Transition.fadeIn,
        page: () => WeeklyTotalHoursView(),
        binding: BindingsBuilder(() {
           Get.lazyPut(() => HomeViewModel());
          Get.lazyPut(() => WeeklyTotalHoursViewModel());
          Get.lazyPut(() => UploadDocumentViewModel());
        })),
    GetPage(
        name: AppRoutes.uploadDocumentView,
        transition: Transition.fadeIn,
        page: () => UploadDocumentView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => UploadDocumentViewModel());
        })),
    GetPage(
        name: AppRoutes.summaryView,
        transition: Transition.fadeIn,
        page: () => SummaryView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => UploadDocumentViewModel());
        })),
    GetPage(
        name: AppRoutes.weeklySummaryView,
        transition: Transition.fadeIn,
        page: () => WeeklyWorkSummaryView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => WeeklyWorkSummaryViewModel());
          Get.lazyPut(() => HomeViewModel());
        })),
    GetPage(
        name: AppRoutes.unpaidHoursView,
        transition: Transition.fadeIn,
        page: () => UnpaidHoursView(),
        binding: BindingsBuilder(() {
           Get.lazyPut(() => HomeViewModel());
          Get.lazyPut(() => UnpaidHoursViewModel());
          Get.lazyPut(() => UploadDocumentViewModel());
        })),
    GetPage(
        name: AppRoutes.dailyTotalHoursView,
        transition: Transition.fadeIn,
        page: () => DailyTotalHoursView(),
        binding: BindingsBuilder(() {

          Get.lazyPut(() => HomeViewModel());
          Get.lazyPut(() => DailyTotalHoursViewModel());
          Get.lazyPut(() => UploadDocumentViewModel());
        })),
    GetPage(
        name: AppRoutes.editDailyTotalHoursView,
        transition: Transition.fadeIn,
        page: () => EditDailyTotalHoursView(),
        binding: BindingsBuilder(() {
           Get.lazyPut(() => HomeViewModel());
          Get.lazyPut(() => EditDailyTotalHoursViewModel());
          Get.lazyPut(() => UploadDocumentViewModel());
        })),
    GetPage(
        name: AppRoutes.dailySummaryView,
        transition: Transition.fadeIn,
        page: () => DailyWorkSummaryView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => DailyWorkSummaryViewModel());
        })),
    GetPage(
        name: AppRoutes.editWeeklyTotalHoursView,
        transition: Transition.fadeIn,
        page: () => EditWeeklyTotalHoursView(),
        binding: BindingsBuilder(() {
           Get.lazyPut(() => HomeViewModel());
          Get.lazyPut(() => EditWeeklyTotalHoursViewModel());
          Get.lazyPut(() => UploadDocumentViewModel());
        })),
         GetPage(
        name: AppRoutes.onBoardingRecruiterView,
        transition: Transition.fadeIn,
        page: () => OnBoardingRecruiterView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => OnBoardingRecruiterViewModel());
        })),
    GetPage(
        name: AppRoutes.editDailyTotalHoursRecruiterView,
        transition: Transition.fadeIn,
        page: () => EditDailyTotalHoursRecruiterView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => HomeRecruiterViewModel());
          Get.lazyPut(() => EditDailyTotalHoursRecruiterViewModel());
          Get.lazyPut(() => UploadDocumentRecruiterViewModel());
        })),
    GetPage(
        name: AppRoutes.navBarRecruiterView,
        transition: Transition.fadeIn,
        page: () => BottomNavBarRecruiter(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => BottomNavBarRecruiterRecruiterViewModel());
        })),
    GetPage(
        name: AppRoutes.workerView,
        transition: Transition.fadeIn,
        page: () => WorkerView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => HomeRecruiterViewModel());
          Get.lazyPut(() => WorkerViewModel());
        })),
    GetPage(
        name: AppRoutes.dailySummaryRecruiterView,
        transition: Transition.fadeIn,
        page: () => DailyWorkSummaryRecruiterView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => DailyWorkSummaryRecruiterViewModel());
        })),
    GetPage(
        name: AppRoutes.weeklySummaryRecruiterView,
        transition: Transition.fadeIn,
        page: () => WeeklyWorkSummaryRecruiterView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => WeeklyWorkSummaryRecruiterViewModel());
        })),
    GetPage(
        name: AppRoutes.unpaidHoursRecruiterView,
        transition: Transition.fadeIn,
        page: () => UnpaidHoursRecruiterView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => UnpaidHoursRecruiterViewModel());
          Get.lazyPut(() => UploadDocumentRecruiterViewModel());
        })),
    GetPage(
        name: AppRoutes.dailyTotalHoursRecruiterView,
        transition: Transition.fadeIn,
        page: () => DailyTotalHoursRecruiterView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => DailyTotalHoursRecruiterViewModel());
          Get.lazyPut(() => UploadDocumentRecruiterViewModel());
        })),
    GetPage(
        name: AppRoutes.weeklyTotalRecruiterView,
        transition: Transition.fadeIn,
        page: () => WeeklyTotalHoursRecruiterView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => WeeklyTotalHoursRecruiterViewModel());
          Get.lazyPut(() => UploadDocumentRecruiterViewModel());
        })),
    GetPage(
        name: AppRoutes.uploadDocumentRecruiterView,
        transition: Transition.fadeIn,
        page: () => UploadDocumentRecruiterView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => UploadDocumentRecruiterViewModel());
        })),
    GetPage(
        name: AppRoutes.editWeeklyTotalHoursRecruiterView,
        transition: Transition.fadeIn,
        page: () => EditWeeklyTotalHoursRecruiterView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => HomeRecruiterViewModel());
          Get.lazyPut(() => EditWeeklyTotalHoursRecruiterViewModel());
          Get.lazyPut(() => UploadDocumentRecruiterViewModel());
        })),
        GetPage(name: AppRoutes.forgetPasswordView, page: ()=>ForgetPasswordView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => ForgetPasswordViewModel());
        })),
        GetPage(name: AppRoutes.otpView, page: ()=>OtpView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => OtpViewModel());

        })),
        GetPage(name: AppRoutes.changePasswordView, page: ()=>ChangePasswordView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => ChangePasswordViewModel());

        })),
        GetPage(
          name: AppRoutes.unpaidRecruiterWorkSummaryView, 
        transition: Transition.fadeIn,
        page: ()=>UnpaidRecruiterSummaryView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => HomeRecruiterViewModel());
          Get.lazyPut(() => UnpaidRecruiterSummaryViewModel());

        })),
        GetPage(
          name: AppRoutes.unpaidWorkSummaryView, 
        transition: Transition.fadeIn,
        page: ()=>UnpaidWorkSummaryView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => HomeViewModel());
          Get.lazyPut(() => UnpaidSummaryViewModel());

        })),
  ];
}
