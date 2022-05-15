import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import '../../input_material/view/detail_material_view.dart';
import '../../input_material/view/input_material_view.dart';
import '../../service/realtime_database.dart';
import '../model/material_data.dart';

class HomePageController extends GetxController {
  final currentRoom = 0.obs;
  Rxn<MaterialData> currentMaterialData = Rxn<MaterialData>();

  final RealtimeDatabaseUtils _realtimeDatabaseUtils = RealtimeDatabaseUtils();

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

  void goToInputMaterial() {
    Get.to(InputMaterialView());
  }

  void goToDetailMaterial(MaterialData materialData) {
    currentMaterialData.value = materialData;
    Get.to(DetailMaterialView());
  }

  Future<void> updateData(MaterialData materialData) async {
    DatabaseReference ref = _realtimeDatabaseUtils.getKey(materialData.id);
    int value = materialData.value == 1 ? 0 : 1;
    await _realtimeDatabaseUtils.updateData(
        ref: ref, id: materialData.id, title: materialData.title, value: value);
  }

  Future<void> changeValueOfMaterial(MaterialData materialData) async {
    DatabaseReference ref = _realtimeDatabaseUtils.getValueKey(materialData.id);
    int value = materialData.value == 1 ? 0 : 1;
    await _realtimeDatabaseUtils.updateValueOfData(ref: ref, value: value);
  }
}
