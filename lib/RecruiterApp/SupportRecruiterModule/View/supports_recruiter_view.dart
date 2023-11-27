import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Constant/AppBar/custom_app_bar.dart';
import '../../../Constant/AppColors/colors.dart';
import '../../../Constant/AppText/app_text.dart';
import '../../BottomNavBarRecruiterModule/ViewModel/bottom_nav_bar_recruiter_view_model.dart';

class SupportsRecruiterView extends StatelessWidget {
  SupportsRecruiterView({super.key});
  final navBarVM = Get.put(BottomNavBarRecruiterRecruiterViewModel());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customAppBar(
          isBackButton: true,
          title: 'Contact Support',
          onTap: () {
            navBarVM.tabIndex.value = 0;
          },
        ),
        SizedBox(
          height: 16.h,
        ),
        GestureDetector(
          onTap: () async{
            String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}
            final Uri emailUri = Uri(
              scheme: 'mailto',
               path: 'support@example.com',
               query: encodeQueryParameters(<String, String>{
                 'subject': 'Example Subject & Symbols are allowed!',
               })
              
            ); if(await canLaunchUrl(emailUri)){
launchUrl(emailUri);
            } else{
              throw Exception('Could not launch $emailUri');
            };
          },
          child: Padding(
              padding: EdgeInsets.only(
                  left: 20.w, right: 27.w, top: 12.h, bottom: 12.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/icons/email.png',
                    height: 32.h,
                    width: 32.w,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      appText(
                        title: 'Email Support',
                        textColor: AppColor.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      appText(
                          title: 'Typically responds within 24\nhours',
                          textColor: AppColor.black.withOpacity(0.50),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.left),
                    ],
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Expanded(
                    child: appText(
                      title: 'support@example.com',
                      textColor: AppColor.black,
                      fontSize: 14,
                      textAlign: TextAlign.right,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
