import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Constant/AppBar/custom_app_bar.dart';
import '../../../Constant/AppButton/text_button.dart';
import '../../../Constant/AppColors/colors.dart';
import '../../../Constant/AppText/app_text.dart';
import '../../../Utils/spint_kit_view_spinner.dart';
import '../ViewModel/home_view_model.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final homeVM = Get.put(HomeViewModel());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // customAppBar(),?\
        Expanded(
          child: ListView(
            children: [
              SizedBox(
                height: 23.h,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => appText(
                          title: 'Welcome ${homeVM.name.value} ${homeVM.lastName.value}',
                          fontSize: 24,
                          textAlign: TextAlign.start),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    appText(
                        title:
                            'Please select Button 1 to submit your work Hours and select Button 2 for report your previous Unpaid Hours',
                        fontSize: 14,
                        textAlign: TextAlign.start),
                  ],
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 63.w),
                child: Column(
                  children:
                      List.generate(homeVM.homeFeatureList.length, (index) {
                    return Column(
                      children: [
                        customTextButton(
                            buttonColor: AppColor.blue,
                            title: homeVM.homeFeatureList[index].title!,
                            onTap: () async {
                              showLoadingIndicator(context: context);
                              final response =
                                  await homeVM.getJobSite(reload: true);
                              homeVM.getCurrentWeek();
                              print(response);
                              hideOpenDialog(context: context);
                              if (response != null) {
                                homeVM.homeFeatureList[index].callBack!(
                                    context, homeVM.check.value);
                              }else{
                                 showLoadingIndicator(context: context);
                              }
                            }),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
