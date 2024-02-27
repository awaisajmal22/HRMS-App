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
import '../../SupportModule/View/Supports2_view.dart';
import '../../SupportModule/View/supports_view.dart';
import '../ViewModel/onboarding_view_model.dart';

class OnBoardingView extends StatelessWidget {
  OnBoardingView({super.key});
  final onBVM = Get.find<OnBoardingViewModel>();
  final token = Get.arguments;
  @override
  Widget build(BuildContext context) {
    onBVM.checkVersion(context);
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
                          title:
                              'Welcome ${onBVM.name.value} ${onBVM.lastname.value}',
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
                        title: onBVM.token.value == '' ||
                                onBVM.token.value == null
                            ? 'The Permission is not granted yet to Add  Hours.'
                            : 'You can Now Add the daily or weekly Hours of the Workers',
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
                                      SupportsView2(),
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
                                  AppRoutes.navBarView,
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
