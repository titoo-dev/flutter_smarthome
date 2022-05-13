import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import '../../service/realtime_database.dart';
import '../model/material_data.dart';

class HomePageController extends GetxController {
  final currentRoom = 0.obs;

  RealtimeDatabaseUtils _realtimeDatabaseUtils = RealtimeDatabaseUtils();

  final List<String> roomSections = [
    'Living Room',
    'Kitchen',
    'Bathroom',
    'Bedroom',
    'Bathroom'
  ];

  void switchRoom({required int roomIndex}) {
    currentRoom.value = roomIndex;
  }

  Future<void> updateData(MaterialData materialData) async {
    DatabaseReference ref = _realtimeDatabaseUtils.getKey(materialData.id);
    int value = materialData.value == 1 ? 0 : 1;
    await _realtimeDatabaseUtils.updateData(
        ref: ref, id: materialData.id, title: materialData.title, value: value);
  }
}
