// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'MessageBubble.dart';
import 'inbox_viewmodel.dart';

class InboxView extends StackedView<InboxViewModel> {
  String chatId;
  final otherData;
  InboxView({
    Key? key,
    required this.chatId,
    required this.otherData,
  }) : super(key: key);

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
        title: Text(
          otherData["username"].toString(),
          style: GoogleFonts.ibmPlexSans(
              fontSize: 18,
              color: const Color(0xff4873a6).withOpacity(0.7),
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: viewModel.getMessagesStream(chatId),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    log(snapshot.error.toString());
                    return const Text('Error fetching messages');
                  }

                  if (!snapshot.hasData) {
                    return const Text('No messages yet');
                  }
                  return ListView.builder(
                    itemCount: snapshot.data?.docs
                        .length, // Replace with your actual message count
                    reverse: true, // To show the latest messages at the bottom
                    itemBuilder: (context, index) {
                      var messageData = snapshot.data!.docs[index].data();

                      log('Message at index $index: $messageData');

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MessageBubble(
                          isMe: messageData['UID'] ==
                              viewModel.loginService.UserData.uID,
                          message: messageData['SMS'],
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
                    if (!viewModel.isTextEmpty) {
                      // Perform action when there is text
                      viewModel.sentSMS(chatId, context);
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
