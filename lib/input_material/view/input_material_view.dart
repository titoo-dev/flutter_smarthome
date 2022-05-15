import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_smarthome/input_material/controller/input_material_controller.dart';
import 'package:get/get.dart';

import '../../hr_view/value/borders.dart';
import '../../hr_view/value/colors.dart';
import '../../hr_view/value/images.dart';
import '../../hr_view/value/sizes.dart';
import '../../hr_view/value/strings.dart';
import '../../hr_view/value/styles.dart';
import '../../hr_view/widgets/custom_button.dart';
import '../../hr_view/widgets/custom_divider.dart';
import '../../hr_view/widgets/custom_text_field.dart';
import '../../hr_view/widgets/custom_text_form_field.dart';
import '../../hr_view/widgets/gradients.dart';
import '../../hr_view/widgets/spaces.dart';

class InputMaterialView extends StatelessWidget {
  InputMaterialView({Key? key}) : super(key: key);

  final InputMaterialController _inputMaterialController =
      Get.put(InputMaterialController());

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    var heightOfScreen = MediaQuery.of(context).size.height;
    var widthOfScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildHeader(context),
          Container(
            margin: EdgeInsets.only(top: heightOfScreen * 0.2),
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Sizes.RADIUS_24),
                topRight: Radius.circular(Sizes.RADIUS_24),
              ),
            ),
            child: ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: widthOfScreen * 0.1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        StringConst.newMaterial,
                        style: theme.textTheme.headline4?.copyWith(
                          color: AppColors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SpaceH8(),
                      CustomDivider(
                        color: AppColors.violetShade2,
                        height: Sizes.HEIGHT_3,
                        width: Sizes.WIDTH_40,
                      ),
                      SpaceH24(),
                      _buildForm(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    ThemeData theme = Theme.of(context);
    var heightOfScreen = MediaQuery.of(context).size.height;
    var widthOfScreen = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        Image.asset(
          ImagePath.livingRoom1,
          height: heightOfScreen * 0.3,
          width: widthOfScreen,
          fit: BoxFit.cover,
        ),
        Container(
          height: heightOfScreen * 0.3,
          width: widthOfScreen,
          decoration:
              const BoxDecoration(gradient: Gradients.headerOverlayGradient),
        ),
        Container(
          margin: EdgeInsets.only(
            top: heightOfScreen * 0.075,
            left: widthOfScreen * 0.1,
          ),
          child: Text(
            StringConst.livingRoom,
            style: theme.textTheme.headline4?.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForm(BuildContext context) {
    ThemeData theme = Theme.of(context);
    var heightOfScreen = MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        _imagePicker(),
        SpaceH20(),
        CustomTextFormField(
          controller: _inputMaterialController.titleController,
          labelText: StringConst.title,
          textInputType: TextInputType.text,
          hintText: StringConst.led,
          hintTextStyle: Styles.customTextStyle(color: AppColors.greyShade8),
          textStyle: Styles.customTextStyle(color: AppColors.violetShade2),
          labelStyle: theme.textTheme.subtitle1?.copyWith(
            color: AppColors.violetShade2,
          ),
          hasPrefixIcon: true,
          border:
              Borders.customOutlineInputBorder(borderRadius: Sizes.RADIUS_4),
          enabledBorder:
              Borders.customOutlineInputBorder(borderRadius: Sizes.RADIUS_4),
          focusedBorder: Borders.customOutlineInputBorder(
            borderRadius: Sizes.RADIUS_4,
            color: AppColors.violetShade2,
            width: Sizes.WIDTH_2,
          ),
        ),
        SpaceH20(),
        CustomTextField(
          controller: _inputMaterialController.descriptionController,
          labelText: StringConst.description,
          hintText: StringConst.bigLed,
          hintTextStyle: Styles.customTextStyle(color: AppColors.greyShade8),
          textFormFieldStyle:
              Styles.customTextStyle(color: AppColors.violetShade2),
          labelStyle: theme.textTheme.subtitle1?.copyWith(
            color: AppColors.violetShade2,
          ),
          textInputType: TextInputType.multiline,
          maxLines: 3,
          border:
              Borders.customOutlineInputBorder(borderRadius: Sizes.RADIUS_4),
          enabledBorder:
              Borders.customOutlineInputBorder(borderRadius: Sizes.RADIUS_4),
          focusedBorder: Borders.customOutlineInputBorder(
            borderRadius: Sizes.RADIUS_4,
            color: AppColors.violetShade2,
            width: Sizes.WIDTH_2,
          ),
        ),
        SpaceH24(),
        CustomButton(
          title: StringConst.save,
          color: AppColors.violetShade2,
          borderRadius: Sizes.ELEVATION_4,
          textStyle: theme.textTheme.button?.copyWith(
            color: AppColors.white,
            fontSize: Sizes.TEXT_SIZE_16,
          ),
          onPressed: () async {
            await _inputMaterialController.addNewMaterial(context);
          },
        ),
        SizedBox(
          height: heightOfScreen * 0.03,
        ),
      ],
    );
  }

  Widget _imagePicker() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: CircleAvatar(
            radius: 100,
            backgroundColor: Colors.white,
            child: ClipOval(
              child: SizedBox(
                  width: 180.0,
                  height: 180.0,
                  child: Obx(() => SizedBox(
                      width: 180.0,
                      height: 180.0,
                      child: _inputMaterialController.image.value == ''
                          ? Image.asset(
                              ImagePath.defaultPhoto,
                              fit: BoxFit.fill,
                            )
                          : Image.file(
                              File(_inputMaterialController.image.value),
                              fit: BoxFit.fill,
                            )))),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: IconButton(
            icon: const Icon(
              Icons.image,
              size: 30.0,
              color: AppColors.primaryColor,
            ),
            onPressed: () async {
              await _inputMaterialController.getImage();
            },
          ),
        ),
      ],
    );
  }
}
