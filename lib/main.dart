import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/global/constants/app_string.dart';
import 'package:flutter_boiler_plate/global/utils/services/app_config.dart';
import 'package:flutter_boiler_plate/src/routes/app_pages.dart';
import 'package:flutter_boiler_plate/src/view/home/controller/getx_put_initializer.dart';
import 'package:get/get.dart';

void main() {
  // Environment Control System
  WidgetsFlutterBinding.ensureInitialized();
  BuildConfiguration.shared.environment = Environment.staging;
  getXPutInitializer();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(
      BuildContext context,
      ) {
    return GetMaterialApp(
      title: AppString.appName,
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      fallbackLocale: const Locale(
        'en',
        'US',
      ),
      theme: ThemeData(
        fontFamily: 'DM Sans',
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
