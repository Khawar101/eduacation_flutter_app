import 'package:flutter/material.dart';

Widget ganderButton(viewModel) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Radio(
        value: "male",
        groupValue: viewModel.gender,
        onChanged: (value) {
          viewModel.changeGender(value);
        },
      ),
      const Text("Male"),
      Radio(
        value: "female",
        groupValue: viewModel.gender,
        onChanged: (value) {
          viewModel.changeGender(value);
        },
      ),
      const Text("Female"),
      Radio(
        value: "other",
        groupValue: viewModel.gender,
        onChanged: (value) {
          viewModel.changeGender(value);
        },
      ),
      const Text("Other"),
    ],
  );
}
