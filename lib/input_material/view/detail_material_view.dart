import 'package:flutter/material.dart';
import 'package:flutter_smarthome/home_page/controller/home_page_controller.dart';
import 'package:get/get.dart';

import '../../hr_view/layout/adaptive.dart';
import '../../hr_view/value/colors.dart';
import '../../hr_view/value/images.dart';
import '../../hr_view/value/sizes.dart';
import '../../hr_view/widgets/background_widget.dart';
import '../../hr_view/widgets/curved_container.dart';
import '../../hr_view/widgets/spaces.dart';
import '../../hr_view/widgets/vertical_text.dart';
import '../controller/input_material_controller.dart';

class DetailMaterialView extends StatelessWidget {
  DetailMaterialView({Key? key}) : super(key: key);

  final InputMaterialController _inputMaterialController =
      Get.put(InputMaterialController());
  final HomePageController _homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          BackgroundWidget(
            image: NetworkImage(
                _homePageController.currentMaterialData.value?.photo ?? ''),
            height: assignHeight(context: context, fraction: 0.60),
          ),
          Column(
            children: [
              Container(
                height: assignHeight(context: context, fraction: 0.45),
                padding: const EdgeInsets.only(
                  left: Sizes.PADDING_16,
                  right: Sizes.PADDING_16,
                  top: Sizes.SAFE_AREA_MARGIN + Sizes.PADDING_16,
                  bottom: Sizes.PADDING_24,
                ),
              ),
              CurvedContainer(
                height: assignHeight(context: context, fraction: 0.40),
                backgroundColor: AppColors.white,
                topLeftRadius: Sizes.RADIUS_40,
                topRightRadius: Sizes.RADIUS_40,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Obx(() => VerticalText(
                          title: _homePageController
                                      .currentMaterialData.value?.value ==
                                  1
                              ? '${_homePageController.currentMaterialData.value?.title} turn On'
                              : '${_homePageController.currentMaterialData.value?.title} turn Off',
                          subtitle: _homePageController
                              .currentMaterialData.value?.description,
                          titleTextStyle: theme.textTheme.subtitle1?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.TEXT_SIZE_24,
                          ),
                          subtitleTextStyle:
                              theme.textTheme.bodyText1?.copyWith(
                            fontSize: Sizes.TEXT_SIZE_16,
                            color: AppColors.purple50,
                          ),
                        )),
                    SpaceH20(),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          await _inputMaterialController.changeValueOfMaterial(
                              _homePageController.currentMaterialData.value!);
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Obx(() => SizedBox(
                                  child: Image.asset(
                                _homePageController
                                            .currentMaterialData.value?.value ==
                                        1
                                    ? ImagePath.turnOff
                                    : ImagePath.turnOn,
                                fit: BoxFit.fill,
                              ))),
                          minRadius: Sizes.SIZE_60,
                          maxRadius: Sizes.SIZE_60,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Obx(() => Container(
                    height: assignHeight(context: context, fraction: 0.15),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      gradient: LinearGradient(
                          colors: [
                            _homePageController
                                        .currentMaterialData.value?.value ==
                                    1
                                ? Colors.orange
                                : const Color(0x19000000),
                            Colors.white
                          ],
                          begin: const FractionalOffset(0.0, 1.0),
                          end: const FractionalOffset(0.0, 0.0),
                          stops: const [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
