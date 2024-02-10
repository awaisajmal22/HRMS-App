import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Constant/AppBar/custom_app_bar.dart';
import '../../../Constant/AppColors/colors.dart';
import '../../../Constant/AppText/app_text.dart';
import '../../../RoutesAndBindings/app_routes.dart';
import '../ViewModel/home_recruiter_view_model.dart';

class HomeRecruiterView extends StatelessWidget {
  HomeRecruiterView({super.key});
  final homeVM = Get.put(HomeRecruiterViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          customAppBar(
              onTap: () {
                Get.back();
              },
              title: 'Worker List'),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Align(
              alignment: Alignment.centerLeft,
              child: appText(
                title: 'Workers',
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
              child: Obx(
            () => ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0),
              itemCount: homeVM.workerList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.workerView,
                            arguments: homeVM.workerList[index]);
                      },
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 20.h),
                        decoration: BoxDecoration(
                          color: Color(0xffA6CEEB),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Obx(
                          () => appText(
                              title:
                                  "${homeVM.workerList[index].firstName} ${homeVM.workerList[index].lastName} ",
                              fontSize: 16,
                              textColor: AppColor.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    )
                  ],
                );
              },
            ),
          )),
        ],
      ),
    );
  }
}
