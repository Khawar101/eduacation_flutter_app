import 'package:education/ui/views/buttom_bar/student_information/student_information_viewmodel.dart';
import 'package:education/ui/widgets/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class UserInfo extends ViewModelWidget<StudentInformationViewModel> {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    StudentInformationViewModel viewModel,
  ) {
    return Column(
      children: [
        Center(
          child: CircleAvatar(
              radius: 50,
              backgroundImage:
                  NetworkImage(viewModel.userInfo.profile.toString())
              // AssetImage('assets/images/profile_picture.jpeg'),
              ),
        ),
        const SizedBox(height: 4),
        BigText(text: "@${viewModel.userInfo.username}", color: Colors.black),
        const SizedBox(height: 4),
        CustomText(
          text:
              "Professinol comic book artist\nand full time art ${viewModel.userInfo.userType}",
          textAlign: TextAlign.center,
          fontSize: 12,
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 30,
                width: 90,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: const Color(0xff4873a6).withOpacity(0.7),
                        width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: ButtonText(
                        text: "${viewModel.userInfo.userType}",
                        color: Colors.black))),
            const SizedBox(width: 10),
            Container(
              height: 30,
              width: 90,
              decoration: BoxDecoration(
                  color: const Color(0xff4873a6).withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                  child: ButtonText(text: "Follow", color: Colors.white)),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: const Color(0xff4873a6).withOpacity(0.7),
                      width: 1)),
              child: Center(
                child: Image.asset(
                  'assets/icons/icons8-fb-24.png',
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.09),
            Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: const Color(0xff4873a6).withOpacity(0.7),
                      width: 1)),
              child: Center(
                child: Image.asset(
                  'assets/icons/instagram-48.png',
                  width: 24,
                ),
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.09),
            Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: const Color(0xff4873a6).withOpacity(0.7),
                      width: 1)),
              child: Center(
                child: Image.asset(
                  'assets/icons/icons8-twitter-48.png',
                  width: 24,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
