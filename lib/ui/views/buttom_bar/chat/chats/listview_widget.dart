import 'package:education/services/Model/chat_member.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../../widgets/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'chats_viewmodel.dart';

class ListViewData extends StackedView<ChatsViewModel> {
  final ChatMember chatMember;
  final LastMessage lastMessage;
  const ListViewData(
      {Key? key, required this.lastMessage, required this.chatMember})
      : super(key: key);
  @override
  void onViewModelReady(ChatsViewModel viewModel) {
    viewModel.initState();

    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    ChatsViewModel viewModel,
    Widget? child,
  ) {
    return GestureDetector(
      onTap: () {
        viewModel.setChatId(chatMember);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.green,
                  backgroundImage: NetworkImage(
                      viewModel.cruntUserProfile(chatMember) ?? ""),
                  child: viewModel.cruntUserProfile(chatMember) == ""
                      ? CustomText(
                          text: viewModel
                              .cruntUserName(chatMember)[0]
                              .toUpperCase(),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        )
                      : Container(),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: CustomText(
                          text: viewModel.cruntUserName(chatMember) ??
                              "".toString(),
                          fontSize: 14,
                          maxLines: 1,
                          textOverflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 4),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: CustomText(
                        text: lastMessage.sMS ?? "",
                        fontSize: 12,
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomText(
                    text: timeago.format(
                      DateTime.fromMicrosecondsSinceEpoch(
                        int.parse(lastMessage.date ?? ""),
                      ),
                    ),
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54)
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  ChatsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChatsViewModel();
}
