import 'package:flutter/material.dart';

import '../../../hr_view/value/images.dart';
import '../../../service/realtime_database.dart';

class CameraSection extends StatelessWidget {
  CameraSection({Key? key}) : super(key: key);
  final RealtimeDatabaseUtils _realtimeDatabaseUtils = RealtimeDatabaseUtils();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.grey[300],
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  color: Colors.black38,
                  onPressed: () {},
                  shape: const CircleBorder(),
                  textColor: Colors.white,
                  child: const Icon(
                    Icons.rotate_left,
                    size: 14.0,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                MaterialButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  onPressed: () {},
                  padding: const EdgeInsets.all(8.0),
                  shape: const CircleBorder(),
                  child: const Icon(
                    Icons.power_settings_new,
                    size: 14,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                MaterialButton(
                  textColor: Colors.white,
                  color: Colors.black38,
                  onPressed: () {},
                  shape: const CircleBorder(),
                  child: const Icon(
                    Icons.timer_outlined,
                    size: 14.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black12,
                image: DecorationImage(
                    image: AssetImage(ImagePath.livingRoom1),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
