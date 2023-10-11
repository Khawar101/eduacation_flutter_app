// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables
import 'dart:developer';
import 'package:education/services/Model/chat.dart';
import 'package:education/services/Model/userData.dart';
import 'package:education/ui/widgets/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import '../../../../../services/Model/chat_member.dart';
import 'MessageBubble.dart';
import 'inbox_viewmodel.dart';

class InboxView extends StackedView<InboxViewModel> {
  final String chatId;
  final String uID;
  final String name;
  final String profile;
  final String otherUID;
  final bool isGroup;
  List<Member> memberList;

  InboxView(
      {Key? key,
      required this.chatId,
      required this.uID,
      required this.name,
      required this.profile,
      required this.isGroup,
      required this.otherUID,
      required this.memberList})
      : super(key: key);

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
                        size: 18,
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
                    width: width * 0.67,
                    child: Text(
                      name,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.ibmPlexSans(
                          fontSize: 15,
                          color: const Color(0xff4873a6).withOpacity(0.7),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  !isGroup
                      ? SizedBox(
                          width: width * 0.67,
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
                                      child: Text(
                                          "${viewModel.memberList[index].name}",
                                          style: GoogleFonts.ibmPlexSans(
                                              fontSize: 15,
                                              color: const Color(0xff4873a6)
                                                  .withOpacity(0.7),
                                              fontWeight: FontWeight.w600)),
                                    );
                                  },
                                )
                              : Text(
                                  "No One Member In This Group Right Know",
                                  style: GoogleFonts.ibmPlexSans(
                                      fontSize: 15,
                                      color: const Color(0xff4873a6)
                                          .withOpacity(0.7),
                                      fontWeight: FontWeight.w600),
                                ),
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
                                  Text(
                                    // _userData.email ?? "",
                                    _userData.status ?? false
                                        ? "Active now"
                                        : "Offline",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: const Color(0xff4873a6)
                                          .withOpacity(0.7),
                                    ),
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
                    // Replace with your actual message count
                    reverse: true, // To show the latest messages at the bottom
                    itemBuilder: (context, index) {
                      final Chat messageData = snapshot.data![index];

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MessageBubble(
                          isMe: messageData.uID ==
                              viewModel.loginService.UserData.uID,
                          messageData: messageData,
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
                  onSelected: (value) {},
                  itemBuilder: (BuildContext context) {
                    return <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: 'Item 1',
                        child: const Text('Camera'),
                        onTap: () {
                          viewModel.sendImage(chatId, ImageSource.camera);
                        },
                      ),
                      PopupMenuItem<String>(
                        value: 'Item 2',
                        child: const Text('Gallery'),
                        onTap: () {
                          viewModel.sendImage(chatId, ImageSource.gallery);
                        },
                      ),
                      PopupMenuItem<String>(
                        value: 'Item 3',
                        child: const Text('Pdf'),
                        onTap: () {},
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
