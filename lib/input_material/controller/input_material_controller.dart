import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../home_page/controller/home_page_controller.dart';
import '../../home_page/model/material_data.dart';
import '../../hr_view/dialog/alert_dialog.dart';
import '../../service/realtime_database.dart';
import '../../service/storage_utils.dart';

class InputMaterialController extends GetxController {
  final HomePageController _homePageController = Get.put(HomePageController());
  final AlertDialogWidget _alertDialog = AlertDialogWidget();
  final StorageUtils _storageUtils = StorageUtils();
  final RealtimeDatabaseUtils _realtimeDatabaseUtils = RealtimeDatabaseUtils();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  PickedFile? pickedFile;
  RxBool valueIsOn = false.obs;

  @override
  Future<void> onInit() async {
    valueIsOn.value = _homePageController.currentMaterialData.value?.value == 1;
    super.onInit();
  }

  RxString image = ''.obs;

  Future getImage() async {
    pickedFile = (await ImagePicker().getImage(source: ImageSource.gallery))!;
    image.value = pickedFile!.path;
  }

  Future<void> addNewMaterial(BuildContext context) async {
    if (!verifyInformationRegister(context)) {
      return;
    }
    DatabaseReference ref = _realtimeDatabaseUtils.getKeyRandom('livingRoom');
    String id = _realtimeDatabaseUtils.keyOfData;
    String photo = await _storageUtils.uploadPic(id, pickedFile!);
    await _realtimeDatabaseUtils.createData(
        ref: ref,
        id: _realtimeDatabaseUtils.keyOfData,
        title: titleController.text,
        value: 0,
        photo: photo,
        description: descriptionController.text);
    titleController.text = '';
    descriptionController.text = '';
    _alertDialog.showSampleDialog(
      context: context,
      title: 'Register',
      text: 'finish!!!',
    );
  }

  bool verifyInformationRegister(BuildContext context) {
    if (titleController.text.isEmpty) {
      _alertDialog.showSampleDialog(
        context: context,
        title: 'Information',
        text: 'please enter the title',
      );
      return false;
    }
    if (pickedFile == null) {
      _alertDialog.showSampleDialog(
        context: context,
        title: 'Information',
        text: 'please enter the image',
      );
      return false;
    }
    return true;
  }

  Future<void> changeValueOfMaterial(MaterialData materialData) async {
    await _homePageController
        .changeValueOfMaterial(_homePageController.currentMaterialData.value!);
    valueIsOn.value = !valueIsOn.value;
    _homePageController.currentMaterialData.value = MaterialData.fromList([
      _homePageController.currentMaterialData.value?.id,
      _homePageController.currentMaterialData.value?.title,
      _homePageController.currentMaterialData.value?.value == 1 ? 0 : 1,
      _homePageController.currentMaterialData.value?.description,
      _homePageController.currentMaterialData.value?.photo,
    ]);
  }
}
