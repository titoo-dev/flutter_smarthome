import 'package:flutter/material.dart';
import 'package:flutter_smarthome/camera_section.dart';
import 'package:flutter_smarthome/device_section.dart';
import 'package:flutter_smarthome/navigation_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      drawer: const Drawer(),
      body: Column(
        children: const [
          NavigationSection(),
          SizedBox(
            height: 8.0,
          ),
          CameraSection(),
          SizedBox(
            height: 8.0,
          ),
          Expanded(
            child: DeviceSection(),
          ),
        ],
      ),
    );
  }
}
