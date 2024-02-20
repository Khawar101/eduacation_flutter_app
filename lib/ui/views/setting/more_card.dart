// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import '../../widgets/app_utils.dart';

Widget MoreCard(icon, title, fun) {
  return Container(
    height: 40,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: const Color(0xFF4873A6).withOpacity(0.7),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              icon.runtimeType == IconData
                  ? Icon(
                      icon,
                      size: 18,
                      color: const Color(0xFF4873A6).withOpacity(0.7),
                    )
                  : ButtonText(
                      text: icon,
                      color: const Color(0xFF4873A6).withOpacity(0.7),
                    ),
              const SizedBox(width: 10),
              ButtonText(
                text: title,
                color: const Color(0xFF4873A6).withOpacity(0.7),
              )
            ],
          ),
          IconButton(
              onPressed: fun,
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: const Color(0xFF4873A6).withOpacity(0.7),
              ))
        ],
      ),
    ),
  );
}
