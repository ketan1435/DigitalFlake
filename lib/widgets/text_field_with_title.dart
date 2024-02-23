import 'package:flutter_task/widgets/constant_widgets.dart';
import 'package:sizer/sizer.dart';
import '../utils/app_colors.dart';
import '../widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/text_styles.dart';

class CustomTextFieldWithTitle extends StatelessWidget {
  final String? title;
  final bool? isCompulsory;
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? textInputFormatter;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final bool? border;
  final Function()? onTap;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChange;
  final void Function(String?)? onSubmitted;
  final String? Function(String?)? validator;
  final bool readOnly;
  final int? maxLength;
  final int? minLength;
  final int? maxLines;
  final bool isShowCounterText;
  final TextCapitalization? textCapitalization;
  final FocusNode? focusNode;

  const CustomTextFieldWithTitle({
    Key? key,
    this.title,
    this.isCompulsory,
    this.controller,
    this.hintText,
    this.keyboardType,
    this.textInputAction,
    this.textInputFormatter,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.border,
    this.onTap,
    this.onSaved,
    this.onChange,
    this.onSubmitted,
    this.validator,
    this.maxLines,
    this.readOnly = false,
    this.maxLength,
    this.minLength,
    this.isShowCounterText = false,
    this.textCapitalization,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: title != null && title!.isNotEmpty ? title!.toTitleCase() : '',
            style: TextHelper.size14,
            children: [
              TextSpan(
                text: isCompulsory == true ? ' *' : '',
                style: TextHelper.size13.copyWith(
                  color: ColorsForApp.redColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 0.8.h),
        CustomTextField(
          controller: controller!,
          hintText: hintText!.toTitleCase(),
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          textInputFormatter: textInputFormatter,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          obscureText: obscureText,
          border: border,
          onTap: onTap,
          onSaved: onSaved,
          onChange: onChange,
          onSubmitted: onSubmitted,
          validator: validator,
          readOnly: readOnly,
          maxLength: maxLength,
          maxLines: maxLines,
          isShowCounterText: isShowCounterText,
          textCapitalization: textCapitalization,
        ),
        SizedBox(height: 1.5.h),
      ],
    );
  }
}
