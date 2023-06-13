import 'package:flutter/material.dart';

import '../../../../widgets/app_utils.dart';

Widget detaileRow(title, value) {
  return value != null
      ? Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: ButtonText(
            text: "$title: $value",
            color: Colors.white,
          ),
        )
      : Container();
}
