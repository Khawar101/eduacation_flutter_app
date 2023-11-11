// ignore_for_file: file_names

import 'package:flutter/material.dart';

Widget ganderButton(viewModel) {
  return Row(
    children: [
      const Spacer(),
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
      const Spacer(),
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
      const Spacer()
    ],
  );
}
