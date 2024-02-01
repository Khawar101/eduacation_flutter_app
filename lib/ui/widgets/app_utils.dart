// ignore_for_file: must_be_immutable

import 'package:education/ui/widgets/custom_text_form_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class AppUtils {
// const Color(0xff4873a6).withOpacity(0.7),
// color: const Color(0xff4873a6),
//backgroundColor: const Color(0xffe4f1f8),
  static CustomTextFormField getEditTextField(
      BuildContext context, String hintText,
      {double? width,
      EdgeInsetsGeometry? margin,
      TextEditingController? controller,
      String? validator}) {
    return CustomTextFormField(
      width: width,
      focusNode: FocusNode(),
      hintText: hintText,

      // enabledBorder: getEnabledBorder(),
      margin: margin,
      //   focusedBorder: getFocusBorder(),
      //     hintStyle: getDefaultHintStyle(),
      controller: controller,
      //    variant: WidgetVariant.OutlineBlack90019,
      //     padding: WidgetPadding.PaddingNormal);
    );
  }
}

class BigText extends StatelessWidget {
  final String text;

  final Color color;
  const BigText({
    super.key,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.ibmPlexSans(
            color: color, fontSize: 20, fontWeight: FontWeight.w600));
  }
}

class BigSubText extends StatelessWidget {
  final String text;

  const BigSubText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: TextAlign.center,
        style: GoogleFonts.ibmPlexSans(
            color: const Color(0xff969799),
            fontSize: 15,
            fontWeight: FontWeight.w400));
  }
}

class ButtonText extends StatelessWidget {
  final String text;
  final Color color;
  const ButtonText({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.ibmPlexSans(
            color: color, fontSize: 15, fontWeight: FontWeight.w500));
  }
}

class SmallText extends StatelessWidget {
  final String text;
  final Color color;
  const SmallText({
    super.key,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.ibmPlexSans(
        color: color, fontSize: 12,
        // fontWeight: FontWeight.w500
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  String text;
  double? fontSize;
  Color? color;
  bool localization;
  FontWeight? fontWeight;
  double? letterSpacing;
  double? wordspacing;
  TextAlign? textAlign;
  TextDirection? textDirection;
  TextOverflow? textOverflow;
  double? textScaleFactor;
  int? maxLines;
  bool? softWrap;
  CustomText(
      {super.key,
      this.text = "",
      this.color,
      this.localization = true,
      this.fontSize,
      this.fontWeight,
      this.letterSpacing,
      this.wordspacing,
      this.textAlign,
      this.textDirection,
      this.textOverflow,
      this.maxLines,
      this.textScaleFactor,
      this.softWrap});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.ibmPlexSans(
        color: color ?? Colors.black,
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.w400,
        letterSpacing: letterSpacing ?? 0,
        wordSpacing: wordspacing ?? 0,
      ),
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLines,
      textScaleFactor: textScaleFactor,
      softWrap: softWrap,
    );
  }
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
