import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Constant/AppBar/custom_app_bar.dart';
import '../../../Constant/AppButton/text_button.dart';
import '../../../Constant/AppColors/colors.dart';
import '../../../Utils/spint_kit_view_spinner.dart';
import '../../HomeRecruiterModule/Model/workers_list_model.dart';
import '../../HomeRecruiterModule/ViewModel/home_recruiter_view_model.dart';
import '../Model/worker_model.dart';
import '../ViewModel/worker_view_model.dart';

class WorkerView extends StatelessWidget {
  WorkerView({super.key});
  final WorkersListModel worker = Get.arguments;
  final workerVM = Get.find<WorkerViewModel>();
  final homeVM = Get.find<HomeRecruiterViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          customAppBar(
              title: worker.firstName,
              isBackButton: true,
              onTap: () {
                Get.back();
              }),
          SizedBox(
            height: 145.h,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 63.w),
              child: Column(
                children:
                    List.generate(workerVM.homeFeatureList.length, (index) {
                  return Column(
                    children: [
                      customTextButton(
                          buttonColor: AppColor.blue,
                          title: workerVM.homeFeatureList[index].title!,
                          onTap: () async {
                            showLoadingIndicator(context: context);
                            final response = await homeVM.getRecruiterJobSite(
                                reload: true, workerId: worker.id);
                            homeVM.getCurrentWeek();
                            print(response);
                            hideOpenDialog(context: context);
                            if (response != null) {
                              workerVM.homeFeatureList[index].callBack(
                                  context, worker.timeSheettype, worker.id);
                            } else {
                              hideOpenDialog(context: context);
                            }
                          }),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  );
                }),
              )),
        ],
      ),
    );
  }
}
