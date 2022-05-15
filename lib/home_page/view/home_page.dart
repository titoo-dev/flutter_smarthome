import 'package:flutter/material.dart';
import 'package:flutter_smarthome/home_page/controller/navigation_section.dart';
import 'package:flutter_smarthome/home_page/view/section/camera_section.dart';
import 'package:flutter_smarthome/home_page/view/section/device_section.dart';
import 'package:get/get.dart';

import '../../hr_view/value/colors.dart';
import '../controller/home_page_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomePageController _homePageController = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _homePageController.goToInputMaterial();
        },
        backgroundColor: AppColors.pink50,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      drawer: const Drawer(),
      body: Column(
        children: [
          const NavigationSection(),
          const SizedBox(
            height: 8.0,
          ),
          CameraSection(),
          const SizedBox(
            height: 8.0,
          ),
          Expanded(
            child: DeviceSection(),
          )
        ],
      ),
    );
  }
}
