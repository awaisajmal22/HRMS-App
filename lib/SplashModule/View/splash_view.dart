import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../Constant/AppColors/colors.dart';
import '../../../Constant/AppText/app_text.dart';
import '../../../Constant/BackgroundGradient/background_gradient.dart';
import '../ViewModel/splash_view_model.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key});
  final splashVM = Get.find<SplashViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: backgroundGradient(
        context: context,
        widget: Column(
          children: [
            SizedBox(
              height: 155.h,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset('assets/icons/logo.svg'),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SpinKitCircle(
                        itemBuilder: (BuildContext context, int index) {
                          return DecoratedBox(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      appText(
                          title: 'Loading',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          textColor: AppColor.white),
                      SizedBox(
                        height: 47.h,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
