import 'package:flutter/material.dart';

import '../value/borders.dart';
import '../value/colors.dart';
import '../value/sizes.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextStyle? textFormFieldStyle;
  final TextStyle? hintTextStyle;
  final TextStyle? labelStyle;
  final TextStyle? fieldTitleTextStyle;
  final BorderStyle borderStyle;
  final double borderRadius;
  final double borderWidth;
  final double contentPaddingHorizontal;
  final double contentPaddingVertical;
  final String? hintText;
  final String? labelText;
  final String? fieldTitle;
  final Color fillColor;
  final bool filled;
  final bool obscured;
  final bool autoCorrect;
  final bool hasTitle;
  final bool hasSuffixIcon;
  final bool hasPrefixIcon;
  final IconData suffixIcon;
  final IconData? prefixIcon;
  final Color suffixIconColor;
  final Color? prefixIconColor;
  final Color suffixIconBackgroundColor;
  final GestureTapCallback? onTapSuffixIcon;
  final GestureTapCallback? onTapPrefixIcon;
  final GestureTapCallback? onTap;
  final TextInputType textInputType;
  final FormFieldValidator<String>? validator;
  final int maxLines;
  final InputBorder border;
  final InputBorder enabledBorder;
  final InputBorder focusedBorder;
  final String? initialValue;

  CustomTextField({
    this.controller,
    this.hasSuffixIcon = false,
    this.autoCorrect = false,
    this.suffixIcon = Icons.search,
    this.onTapSuffixIcon,
    this.onTap,
    this.suffixIconBackgroundColor = AppColors.primaryColor,
    this.suffixIconColor = AppColors.primaryText,
    this.prefixIcon,
    this.onTapPrefixIcon,
    this.prefixIconColor,
    this.hasPrefixIcon = false,
    this.textInputType = TextInputType.text,
    this.textFormFieldStyle,
    this.fieldTitleTextStyle,
    this.hintTextStyle,
    this.labelStyle,
    this.borderStyle = BorderStyle.none,
    this.borderRadius = Sizes.RADIUS_6,
    this.borderWidth = Sizes.WIDTH_0,
    this.contentPaddingHorizontal = Sizes.SIZE_16,
    this.contentPaddingVertical = Sizes.SIZE_16,
    this.hintText,
    this.labelText,
    this.fillColor = AppColors.white,
    this.filled = true,
    this.obscured = false,
    this.hasTitle = false,
    this.fieldTitle,
    this.validator,
    this.maxLines = 1,
    this.border = Borders.defaultBorder,
    this.focusedBorder = Borders.defaultBorder,
    this.enabledBorder = Borders.defaultBorder,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          hasTitle ? formFieldTitle(fieldTitle: fieldTitle!) : Container(),
          TextFormField(
            controller: controller,
            style: textFormFieldStyle,
            validator: validator,
            initialValue: initialValue,
            onTap: onTap,
            autocorrect: autoCorrect,
            maxLines: maxLines,
            decoration: InputDecoration(
              labelText: labelText,
              labelStyle: labelStyle,
              border: border,
              enabledBorder: enabledBorder,
              focusedBorder: focusedBorder,
              prefixIcon: hasPrefixIcon
                  ? InkWell(
                      onTap: onTapPrefixIcon,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.PADDING_4,
                          vertical: Sizes.PADDING_4,
                        ),
                        child: Icon(
                          prefixIcon,
                          color: prefixIconColor,
                        ),
                      ),
                    )
                  : null,
              suffixIcon: hasSuffixIcon
                  ? InkWell(
                      onTap: onTapSuffixIcon,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: Sizes.MARGIN_4,
                          vertical: Sizes.MARGIN_4,
                        ),
                        decoration: BoxDecoration(
                          color: suffixIconBackgroundColor,
                          borderRadius: BorderRadius.circular(Sizes.RADIUS_6),
                        ),
                        child: Icon(
                          suffixIcon,
                          color: suffixIconColor,
                        ),
                      ),
                    )
                  : null,
              hintText: hintText,
              hintStyle: hintTextStyle,
              contentPadding: EdgeInsets.symmetric(
                horizontal: contentPaddingHorizontal,
                vertical: contentPaddingVertical,
              ),
              filled: filled,
              fillColor: fillColor,
            ),
            keyboardType: textInputType,
            obscureText: obscured,
          ),
        ],
      ),
    );
  }

  Widget formFieldTitle({required String fieldTitle}) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      child: Text(
        fieldTitle,
        style: fieldTitleTextStyle,
      ),
    );
  }
}
