// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables
import 'package:education/services/Model/userData.dart';
import '../../../../../services/Model/chat_member.dart';
import 'package:education/ui/widgets/app_utils.dart';
import 'package:education/services/Model/chat.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'inbox_viewmodel.dart';
import 'MessageBubble.dart';
import 'dart:developer';

class InboxView extends StackedView<InboxViewModel> {
  final String chatId;
  final String uID;
  final String name;
  final String profile;
  final String otherUID;
  final bool isGroup;
  List<Member> memberList;

  InboxView({
    super.key,
    required this.chatId,
    required this.uID,
    required this.name,
    required this.profile,
    required this.isGroup,
    required this.otherUID,
    required this.memberList,
  });

  @override
  void onViewModelReady(InboxViewModel viewModel) {
    viewModel.initState();
    super.onViewModelReady(viewModel);
    viewModel.memberList = memberList;
  }

  @override
  void onDispose(InboxViewModel viewModel) {
    viewModel.smsController.dispose();
    super.onDispose(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    InboxViewModel viewModel,
    Widget? child,
  ) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
            log(chatId.toString());
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
            size: 18,
          ),
        ),
        title: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.green.withOpacity(0.7),
                backgroundImage: NetworkImage(profile),
                child: profile == ""
                    ? CustomText(
                        text: name.isNotEmpty
                            ? name[0].toUpperCase()
                            : "", // Display the first letter of the name
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      )
                    : Container(),
              ),
              const SizedBox(width: 4),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width * 0.62,
                    child: CustomText(
                        text: name,
                        textOverflow: TextOverflow.ellipsis,
                        fontSize: 15,
                        color: const Color(0xff4873a6).withOpacity(0.7),
                        fontWeight: FontWeight.w600),
                  ),
                  !isGroup
                      ? SizedBox(
                          width: width * 0.62,
                          height: 15,
                          child: viewModel.memberList.isNotEmpty
                              ? ListView.builder(
                                  itemCount: viewModel.memberList.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (ctx, index) {
                                    return InkWell(
                                        onTap: () {
                                          viewModel.openNewChat(
                                              viewModel.memberList[index],
                                              viewModel.chatMembers[index]);
                                        },
                                        child: CustomText(
                                            text:
                                                "${viewModel.memberList[index].name} , ",
                                            fontSize: 14,
                                            color: const Color(0xff4873a6)
                                                .withOpacity(0.7),
                                            fontWeight: FontWeight.w600));
                                  },
                                )
                              : CustomText(
                                  text:
                                      "No One Member In This Group Right Know",
                                  fontSize: 15,
                                  color:
                                      const Color(0xff4873a6).withOpacity(0.7),
                                  fontWeight: FontWeight.w600),
                        )
                      : StreamBuilder(
                          stream: viewModel.publisherStream(otherUID),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasError) {
                              return const Text('Something went wrong');
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Container();
                            }

                            // Check if snapshot data is not null before using it
                            if (snapshot.data != null) {
                              final userData _userData =
                                  userData.fromJson(snapshot.data.data());
                              return Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: _userData.status ?? false
                                        ? Colors.green
                                        : Colors.grey,
                                    size: 11,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  CustomText(
                                    // _userData.email ?? "",
                                    text: _userData.status ?? false
                                        ? "Active now"
                                        : "Offline",

                                    fontSize: 10,
                                    color: const Color(0xff4873a6)
                                        .withOpacity(0.7),
                                  )
                                ],
                              );
                            } else {
                              return const Text('No data available');
                            }
                          },
                        ),
                ],
              ),
            ],
          ),
        ),
        // centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<Chat>>(
                stream: viewModel.chatStream(chatId),
                builder:
                    (BuildContext context, AsyncSnapshot<List<Chat>> snapshot) {
                  if (snapshot.hasError) {
                    log(snapshot.error.toString());
                    return Text(snapshot.error.toString());
                  }

                  if (!snapshot.hasData) {
                    return const Text('No messages yet...');
                  }
                  return ListView.builder(
                    itemCount: snapshot.data?.length,
                    reverse: true, 
                    itemBuilder: (context, index) {
                      final Chat messageData = snapshot.data![index];

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onLongPress: () {
                            // viewModel.deleteMessage(chatId, messageData.id);
                            // log(messageData.id.toString());

                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Delete Message'),
                                  content: const Text(
                                      'Are you sure you want to delete this message?'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); // Close the dialog
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        viewModel.deleteMessage(
                                            chatId, messageData.id);
                                        Navigator.of(context)
                                            .pop(); // Close the dialog
                                      },
                                      child: const Text('Delete'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: MessageBubble(
                            isMe: messageData.uID ==
                                viewModel.loginService.UserData.uID,
                            messageData: messageData,
                            chatId: chatId,
                            uID: uID,
                            name: name,
                            profile: profile,
                            isGroup: isGroup,
                            otherUID: otherUID,
                            memberList: memberList,
                          ),
                        ),
                      );
                    },
                  );
                }),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            color: Colors.grey[200],
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: viewModel.smsController,
                    onChanged: (text) {
                      viewModel.updateTextStatus(); // Update the text status
                    },
                    decoration: const InputDecoration(
                      hintText: 'Type your message...',
                      border: InputBorder.none,
                    ),
                    maxLines: 5,
                    minLines: 1,
                  ),
                ),
                PopupMenuButton<String>(
                  // onSelected: (value) {},
                  itemBuilder: (BuildContext context) {
                    return <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        // value: 'Item 1',
                        child: const Text('Camera'),
                        onTap: () {
                          viewModel.sendImageWithCamera(
                              chatId, otherUID, name, profile, otherUID);
                        },
                      ),
                      PopupMenuItem<String>(
                        // value: 'Item 2',
                        child: const Text('Gallery'),
                        onTap: () {
                          viewModel.sendImageWithGallery(
                              chatId, otherUID, name, profile, otherUID);
                        },
                      ),
                      PopupMenuItem<String>(
                        // value: 'Item 3',
                        child: const Text('Pdf'),
                        onTap: () {
                          viewModel.showPdfFile(
                              chatId, name, profile, otherUID);
                        },
                      ),
                      PopupMenuItem<String>(
                        value: 'Item 4',
                        child: const Text('Video'),
                        onTap: () {},
                      ),
                    ];
                  },
                  child: const IconButton(
                    onPressed: null,
                    icon: Icon(Icons.attachment_outlined),
                  ),
                ),
                // const SizedBox(width: 5),
                IconButton(
                  icon: Icon(
                    Icons.send,
                    color: viewModel.isTextEmpty
                        ? Colors.grey
                        : const Color(0xff4873a6).withOpacity(0.7),
                  ),
                  onPressed: () {
                    if (viewModel.smsController.text.isNotEmpty) {
                      viewModel.sendSMS(chatId, name, profile, otherUID);
                    }
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  InboxViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      InboxViewModel();
}
