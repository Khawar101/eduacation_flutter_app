// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education/services/Model/chat.dart';
import 'package:education/services/Model/userData.dart';
import 'package:education/ui/widgets/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'MessageBubble.dart';
import 'inbox_viewmodel.dart';

class InboxView extends StackedView<InboxViewModel> {
  final String chatId;
  final String uID;
  final String name;
  final String profile;
  final String otherUID;

  const InboxView(
      {Key? key,
      required this.chatId,
      required this.uID,
      required this.name,
      required this.profile,
      required this.otherUID})
      : super(key: key);

  @override
  void onViewModelReady(InboxViewModel viewModel) {
    viewModel.initState();
    super.onViewModelReady(viewModel);
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
                  Text(
                    name,
                    style: GoogleFonts.ibmPlexSans(
                        fontSize: 15,
                        color: const Color(0xff4873a6).withOpacity(0.7),
                        fontWeight: FontWeight.w600),
                  ),
                  StreamBuilder<dynamic>(
                    stream: viewModel.publisherStream(otherUID),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Something went wrong');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container();
                      }
                      userData _userData =
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
                            // _userData.firstName??"",
                            _userData.status ?? false
                                ? "Active now"
                                : "Offline",
                            style: TextStyle(
                              fontSize: 10,
                              color: const Color(0xff4873a6).withOpacity(0.7),
                            ),
                          )
                        ],
                      );
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
