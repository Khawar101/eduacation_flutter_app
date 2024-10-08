import 'package:stacked_services/stacked_services.dart';
import 'package:education/ui/widgets/app_utils.dart';
import 'package:education/ui/common/app_colors.dart';
import 'package:education/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'notice_sheet_model.dart';

class NoticeSheet extends StackedView<NoticeSheetModel> {
  final Function(SheetResponse)? completer;
  final SheetRequest request;
  const NoticeSheet({
    super.key,
    required this.completer,
    required this.request,
  });

  @override
  Widget builder(
    BuildContext context,
    NoticeSheetModel viewModel,
    Widget? child,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
              text: request.title!, fontSize: 25, fontWeight: FontWeight.w900),
          verticalSpaceTiny,
          CustomText(
            text: request.description!,
            fontSize: 14,
            color: kcMediumGrey,
            maxLines: 3,
            softWrap: true,
          ),
          verticalSpaceLarge,
        ],
      ),
    );
  }

  @override
  NoticeSheetModel viewModelBuilder(BuildContext context) => NoticeSheetModel();
}
