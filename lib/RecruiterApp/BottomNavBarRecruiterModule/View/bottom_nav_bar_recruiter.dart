import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../Constant/AppColors/colors.dart';
import '../../../Constant/AppText/app_text.dart';
import '../../HomeRecruiterModule/View/Home_recruiter_view.dart';
import '../../SettingRecruiterModule/View/setting_recruiter_view.dart';
import '../../SupportRecruiterModule/View/supports_recruiter_view.dart';
import '../ViewModel/bottom_nav_bar_recruiter_view_model.dart';

class BottomNavBarRecruiter extends StatelessWidget {
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 0);

  final TextStyle selectedLabelStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 0);

  buildBottomNavigationMenu(context,
      {required BottomNavBarRecruiterRecruiterViewModel navBarVM}) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: 50.h,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: navBarVM.changeTabIndex,
            currentIndex: navBarVM.tabIndex.value,
            backgroundColor: Color(0xffD9D9D9),
            unselectedItemColor: Colors.white.withOpacity(0.5),
            selectedItemColor: Colors.white,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/home.svg',
                        color: navBarVM.tabIndex.value == 0
                            ? AppColor.blue
                            : AppColor.black.withOpacity(0.50),
                        width: 16.w,
                        height: 16.h,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      appText(
                        title: 'Home',
                        fontSize: 14,
                        textColor: navBarVM.tabIndex.value == 0
                            ? AppColor.blue
                            : AppColor.black.withOpacity(0.50),
                      )
                    ],
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/support.svg',
                        width: 16.w,
                        height: 16.h,
                        color: navBarVM.tabIndex.value == 1
                            ? AppColor.blue
                            : AppColor.black.withOpacity(0.50),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      appText(
                        title: 'Support',
                        fontSize: 14,
                        textColor: navBarVM.tabIndex.value == 1
                            ? AppColor.blue
                            : AppColor.black.withOpacity(0.50),
                      ),
                    ],
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/setting.svg',
                        width: 16.w,
                        height: 16.h,
                        color: navBarVM.tabIndex.value == 2
                            ? AppColor.blue
                            : AppColor.black.withOpacity(0.50),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      appText(
                        title: 'Setting',
                        fontSize: 14,
                        textColor: navBarVM.tabIndex.value == 2
                            ? AppColor.blue
                            : AppColor.black.withOpacity(0.50),
                      ),
                    ],
                  ),
                ),
                label: '',
              ),
            ],
          ),
        )));
  }

  final navBarVM = Get.find<BottomNavBarRecruiterRecruiterViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          buildBottomNavigationMenu(context, navBarVM: navBarVM),
      body: Obx(() => IndexedStack(
            index: navBarVM.tabIndex.value,
            children: [
              HomeRecruiterView(),
              SupportsRecruiterView(),
              SettingRecruiterView(),
            ],
          )),
    );
  }
}
