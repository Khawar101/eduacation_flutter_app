// ignore_for_file: must_be_immutable

import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'MessageBubble.dart';
import 'inbox_viewmodel.dart';

class InboxView extends StackedView<InboxViewModel> {
  String chatId;
  InboxView({Key? key, required this.chatId}) : super(key: key);

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
        title: FutureBuilder<String>(
          future: viewModel.fetchUserName(
              chatId), // Replace userId with the actual user's ID
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(); // Show loading indicator while fetching name
            } else if (snapshot.hasError) {
              return const Text('Error fetching user name');
            } else if (!snapshot.hasData) {
              return const Text('No user name available');
            }
            return Text(
              snapshot.data!,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            );
          },
        ),
        // Text(
        //   viewModel.,
        //   textAlign: TextAlign.center,
        //   style: GoogleFonts.ibmPlexSans(
        //       fontSize: 18,
        //       color: const Color(0xff4873a6).withOpacity(0.7),
        //       fontWeight: FontWeight.w600),
        // ),
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
                    return  Text('Error fetching messages');
                  }

                  if (!snapshot.hasData) {
                    return const Text('No messages yet');
                  }
                  return ListView.builder(
                    itemCount: snapshot.data?.docs.length, // Replace with your actual message count
                 // reverse: true, // To show the latest messages at the bottom
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
                    controller: viewModel.SMScontroller,
                    decoration: const InputDecoration(
                      hintText: 'Type your message...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    viewModel.SentSMS(chatId, context);
                  },
                ),
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
