import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smarthome/home_page.dart';
import 'package:flutter_smarthome/home_page_controller.dart';
import 'package:get/get.dart';

void main() => runApp(
      DevicePreview(
        enabled: true,
        builder: (context) => const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const HomePage(),
      onInit: () {
        Get.put(HomePageController());
      },
    );
  }
}
