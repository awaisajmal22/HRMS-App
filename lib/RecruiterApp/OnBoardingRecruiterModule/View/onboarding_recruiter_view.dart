import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../Constant/AppBar/custom_app_bar.dart';
import '../../../Constant/AppButton/text_button.dart';
import '../../../Constant/AppColors/colors.dart';
import '../../../Constant/AppText/app_text.dart';
import '../../../Constant/BackgroundGradient/background_gradient.dart';
import '../../../RoutesAndBindings/app_routes.dart';
import '../../../Utils/spint_kit_view_spinner.dart';
import '../../AuthModule/Login/Model/login_model.dart';
import '../../HomeRecruiterModule/Model/workers_list_model.dart';
import '../../HomeRecruiterModule/ViewModel/home_recruiter_view_model.dart';
import '../../SupportRecruiterModule/View/Supports2_recruiter_view.dart';
import '../../SupportRecruiterModule/View/supports_recruiter_view.dart';
import '../ViewModel/onboarding_recruiter_view_model.dart';

class OnBoardingRecruiterView extends StatelessWidget {
  OnBoardingRecruiterView({super.key});
  final onBVM = Get.find<OnBoardingRecruiterViewModel>();
  final token = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: backgroundGradient(
        context: context,
        widget: Column(
          children: [
            SizedBox(
              height: 90.h,
            ),
            SvgPicture.asset('assets/icons/logo.svg'),
            SizedBox(
              height: 120.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 49.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Obx(
                      () => appText(
                          title: 'Welcome ${onBVM.name.value}',
                          fontSize: 24,
                          textColor: AppColor.white),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Center(
                    child: Obx(
                      () => appText(
                        title:
                            onBVM.token.value == '' || onBVM.token.value == null
                                ? 'Permission is not granted yet to add  hours.'
                                : 'You can now add the daily or weekly hours',
                        fontSize: 16,
                        textColor: AppColor.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 49.w),
                    child: Obx(
                      () => onBVM.token.value == '' || onBVM.token.value == null
                          ? Column(
                              children: [
                                customTextButton(
                                  onTap: () {
                                    Get.offNamed(AppRoutes.loginView);
                                  },
                                  title: 'Close',
                                  textColor: AppColor.black,
                                  buttonColor: AppColor.white,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                customTextButton(
                                  onTap: () {
                                    Get.to(
                                      SupportsRecruiterView2(),
                                    );
                                  },
                                  title: 'Contact Support',
                                  textColor: AppColor.black,
                                  buttonColor: AppColor.white.withOpacity(0.65),
                                ),
                              ],
                            )
                          : customTextButton(
                              onTap: () {
                                Get.offAllNamed(
                                  AppRoutes.navBarRecruiterView,
                                );
                              },
                              title: 'Continue',
                              textColor: AppColor.black,
                              buttonColor: AppColor.white,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
