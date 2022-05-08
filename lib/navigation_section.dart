import 'package:flutter/material.dart';
import 'package:flutter_smarthome/home_page_controller.dart';
import 'package:get/get.dart';

class NavigationSection extends GetView<HomePageController> {
  const NavigationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Row(
        children: [
          IconButton(
            onPressed: () => _onMenuPressed(context),
            icon: const Icon(Icons.menu),
          ),
          Expanded(
            child: GetX<HomePageController>(
              builder: (state) => ListView(
                padding: const EdgeInsets.only(top: 50.0),
                scrollDirection: Axis.horizontal,
                children: controller.roomSections
                    .asMap()
                    .entries
                    .map(
                      (item) => NavigationItem(
                        label: item.value,
                        active: state.currentRoom.value == item.key,
                        onTap: () {
                          controller.switchRoom(roomIndex: item.key);
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }

  _onMenuPressed(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }
}

class NavigationItem extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;

  const NavigationItem({
    Key? key,
    required this.label,
    this.active = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: active ? Colors.indigo : Colors.black45,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              height: 2,
              width: active ? 24 : 0,
              color: active ? Colors.indigo : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
