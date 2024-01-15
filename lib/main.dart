
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';

import 'Constant/AppColors/colors.dart';
import 'RoutesAndBindings/app_pages.dart';
import 'RoutesAndBindings/app_routes.dart';

void main() async {
  await GetStorage.init();

  //  Directory directory = await getApplicationDocumentsDirectory();
  // Hive
  //   ..init(directory.path)
  //   ..registerAdapter(NewUserModelAdapter());

  // WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, _) {
        return GetMaterialApp(
          useInheritedMediaQuery: true,
          title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: AppColor.white
          ),
         getPages: AppPages.routes,
         initialRoute: AppRoutes.splashView,
        );
      }
    );
  }
}
