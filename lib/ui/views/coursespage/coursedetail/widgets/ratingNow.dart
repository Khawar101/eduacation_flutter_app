// ignore_for_file: file_names
import 'package:education/services/Model/userData.dart';
import 'package:education/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../../services/Model/CoursesModel.dart';

ratingNow(context, reviewCtrl, CoursesModel courseData, userData userData,
    notifyListeners) {
  var _formKey = GlobalKey<FormState>();

  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      titlePadding: const EdgeInsets.all(15),
      actionsPadding: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      title: const Center(
        child: Text(
          'Write a Review',
        ),
      ),
      content: Form(
        key: _formKey,
        child: Container(
          color: const Color.fromARGB(60, 145, 28, 28),
          height: 170,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RatingBar.builder(
                  wrapAlignment: WrapAlignment.start,
                  initialRating: 2.5,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 38,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    // color: Colors.yellow,
                  ),
                  onRatingUpdate: (rating) {
                    //print(rating);
                  },
                ),
                CustomTextFormField(
                  controller: reviewCtrl,
                  hintText: 'Write anything about this course...',
                ),
              ],
            ),
          ),
        ),
      ),
      actions: <Widget>[
        InkWell(
          onTap: () {},
          child: const SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Rate Now',
                ),
              ],
            ),
          ),
        ),
        // TextButton(
        //   onPressed: () {
        //     final isValid = _formKey.currentState?.validate();
        //     if (isValid!) {
        //       // faq.add(
        //       //     FAQ(question: questionCtrl.text, answer: answerCtrl.text));
        //       // courseData.fAQ = faq;
        //       // notifyListeners();
        //       // questionCtrl.clear();
        //       // answerCtrl.clear();
        //       Navigator.pop(context);
        //     }
        //     _formKey.currentState?.save();
        //   },
        //   child: const Text(
        //     'Submit Review',
        //   ),
        // ),
      ],
    ),
  );
}
