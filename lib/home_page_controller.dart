import 'package:get/get.dart';

class HomePageController extends GetxController {
  final currentRoom = 0.obs;

  final List<String> roomSections = [
    'Living Room',
    'Kitchen',
    'Bathroom',
    'Bedroom'
  ];

  void switchRoom({required int roomIndex}) {
    currentRoom.value = roomIndex;
  }
}
