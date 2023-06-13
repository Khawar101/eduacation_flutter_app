import 'package:flutter/material.dart';

Widget ganderButton(viewModel) {
  return Row(
    children: [
      Spacer(),
      Row(
        children: [
          Radio(
            value: "Student",
            groupValue: viewModel.userType,
            onChanged: (value) {
              viewModel.changeGender(value);
            },
          ),
          const Text("Student"),
        ],
      ),
      Spacer(),
      Row(
        children: [
          Radio(
            value: "Teacher",
            groupValue: viewModel.userType,
            onChanged: (value) {
              viewModel.changeGender(value);
            },
          ),
          const Text("Teacher"),
        ],
      ),
      Spacer()
    ],
  );
}
