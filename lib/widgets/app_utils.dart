import 'package:e_learning_app/utils/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    FormFieldValidator<String>? useValidator;
    if (validator != null) {
   //   useValidator = ValidationRules.getValidator(context, validator);
    }
    return CustomTextFormField(
        width: width,
        validator: useValidator,
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
 const BigText({super.key, 
    required this.text,
    
    required this.color,
  }); 

@override
Widget build(BuildContext context) {
  return Text(
    text,
   
    style: GoogleFonts.ibmPlexSans(
      color: color,
      fontSize: 20,
      fontWeight: FontWeight.w600
    ),
  );
 }
}

class BigSubText extends StatelessWidget {
final String text;

 const BigSubText({super.key, 
    required this.text,
    
  }); 

@override
Widget build(BuildContext context) {
  return Text(
    text,
textAlign: TextAlign.center,
    style: GoogleFonts.ibmPlexSans(
       color: const Color(0xff969799), fontSize: 15,
      fontWeight: FontWeight.w400
    ),
  );
 }
}
  
class ButtonText extends StatelessWidget {
final String text;
final Color color;
 const ButtonText({super.key, 
    required this.text, required this.color,
    
  }); 

@override
Widget build(BuildContext context) {
  return Text(
    text,
   
    style: GoogleFonts.ibmPlexSans(
       color:color, fontSize: 15,
      fontWeight: FontWeight.w500
    ),
  );
 }
}

class SmallText extends StatelessWidget {
final String text;
final Color color;
 const SmallText({super.key, 
    required this.text, required this.color,
    
  }); 

@override
Widget build(BuildContext context) {
  return Text(
    text,
   
    style: GoogleFonts.ibmPlexSans(
       color:color, fontSize: 12,
      // fontWeight: FontWeight.w500
    ),
  );
 }
}

class CustomText extends StatelessWidget {
final String text;
final double size;
final FontWeight fontWeight;
 final Color color;
 const CustomText({super.key, 
    required this.text,
    required this.size,
    required this.fontWeight,
    required this.color,
  }); 

@override
Widget build(BuildContext context) {
  return Text(
    text,
   
    style: GoogleFonts.ibmPlexSans(
      color: color,
      fontSize: size,
      fontWeight: fontWeight
    ),
  );
 }
}






final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);


