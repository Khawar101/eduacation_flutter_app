import 'package:education/ui/views/buttom_bar/chat/inbox/inbox_viewmodel.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
import '../../../../../services/Model/chat_member.dart';
import '../../../../../services/Model/userData.dart';
import '../../../../widgets/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'dart:developer';

class PdfViewShow extends StackedView<InboxViewModel> {
  final String sampleUrl;
  final String chatId;
  final String uID;
  final String name;
  final String profile;
  final String otherUID;
  final bool isGroup;
  final List<Member> memberList;

  const PdfViewShow(
      {super.key,
      required this.sampleUrl,
      required this.chatId,
      required this.uID,
      required this.name,
      required this.profile,
      required this.isGroup,
      required this.otherUID,
      required this.memberList});

  @override
  void onViewModelReady(InboxViewModel viewModel) {
    viewModel.loadPdf(sampleUrl);

    viewModel.initState();
    super.onViewModelReady(viewModel);
    viewModel.memberList = memberList;
  }

  @override
  Widget builder(
    BuildContext context,
    InboxViewModel viewModel,
    Widget? child,
  ) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
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
                          fontWeight: FontWeight.w600)),
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
                                                "${viewModel.memberList[index].name}",
                                            fontSize: 15,
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
                                          .withOpacity(0.7))
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
          if (viewModel.pdfFlePath != null)
            Expanded(
              child: PdfView(path: viewModel.pdfFlePath!),
            )
          else
            const Text("Pdf is not Loaded"),
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
