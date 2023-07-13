// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../utils/loading.dart';

Widget networkImage(url, height, width, shape) {
  return CachedNetworkImage(
    imageUrl: url ?? "",
    height: height - 0.1,
    width: width - 0.1,
    imageBuilder: (context, imageProvider) => Container(
      decoration: BoxDecoration(
        shape: shape ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: shape ? null : BorderRadius.circular(10),
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
          // colorFilter: const ColorFilter.mode(Colors.red, BlendMode.colorBurn),
        ),
      ),
    ),
    placeholder: (context, url) => Center(child: Loading(width / 4)),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
}
