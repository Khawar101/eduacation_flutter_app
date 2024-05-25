// ignore_for_file: file_names
import '../../../../../services/Model/chat_member.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:education/services/Model/chat.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:education/app/app.locator.dart';
import 'package:education/app/app.router.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

final _navigationService = locator<NavigationService>();

class MessageBubble extends StatelessWidget {
  final bool isMe;
  final Chat messageData;
  final String chatId;
  final String uID;
  final String name;
  final String profile;
  final String otherUID;
  final bool isGroup;
  final List<Member> memberList;

  const MessageBubble(
      {super.key,
      required this.isMe,
      required this.messageData,
      required this.chatId,
      required this.uID,
      required this.name,
      required this.profile,
      required this.isGroup,
      required this.otherUID,
      required this.memberList});

  @override
  Widget build(BuildContext context) {
    return messageData.type == "notification"
        ? Align(
            alignment: Alignment.center,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Text(
                  messageData.sMS ?? "",
                  style: GoogleFonts.ibmPlexSans(fontSize: 10),
                ),
              ),
            ))
        : Row(
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: isMe
                      ? const Color(0xff4873a6).withOpacity(0.7)
                      : Colors.grey[300],
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(10.0),
                    topRight: const Radius.circular(10.0),
                    bottomLeft: isMe
                        ? const Radius.circular(10.0)
                        : const Radius.circular(0.0),
                    bottomRight: isMe
                        ? const Radius.circular(0.0)
                        : const Radius.circular(10.0),
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
                margin:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 8.0),
                child: Column(
                  children: [
                    messageData.type == "text"
                        ? Container(
                            constraints: const BoxConstraints(
                                minWidth: 10, maxWidth: 250),
                            child: Text(
                              messageData.sMS ?? "",
                              style: TextStyle(
                                height: 1.5,
                                color: isMe ? Colors.white : Colors.black,
                              ),
                              softWrap: true,
                            ),
                          )
                        : Container(),
                    messageData.type == "image" ||
                            messageData.type == "jpeg" ||
                            messageData.type == "jpg" ||
                            messageData.type == "png"
                        ? Image.network(messageData.sMS ?? "",
                            width: 200, fit: BoxFit.fill)
                        : Container(),
                    messageData.type == "pdf"
                        ? InkWell(
                            onTap: () {
                              if (messageData.sMS != null) {
                                _navigationService.navigateToPdfViewShow(
                                  sampleUrl: messageData.sMS!,
                                  chatId: chatId,
                                  uID: uID,
                                  name: name,
                                  profile: profile,
                                  isGroup: isGroup,
                                  otherUID: otherUID,
                                  memberList: memberList,
                                );
                                log("message"); // Use the PDF URL
                              } else {
                                log("pfdfasdfghjkjhgfds========>");
                              }
                            },
                            child: Image.asset(
                              "assets/icons/addPDF.png",
                              width: 100,
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ],
          );
  }
}
