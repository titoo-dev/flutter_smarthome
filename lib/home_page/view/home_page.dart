import 'package:flutter/material.dart';
import 'package:flutter_smarthome/home_page/controller/navigation_section.dart';
import 'package:flutter_smarthome/home_page/view/section/camera_section.dart';
import 'package:flutter_smarthome/home_page/view/section/device_section.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
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
