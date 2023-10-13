// import 'package:education/services/Model/chat_member.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:stacked/stacked.dart';
// import '../../../../widgets/app_utils.dart';
// import '../../../../widgets/custom_text_form_field.dart';
// import '../../../drawer/drawer_view.dart';
// import 'chats_viewmodel.dart';
// import 'package:timeago/timeago.dart' as timeago;

// class ChatsView extends StackedView<ChatsViewModel> {
//   const ChatsView({
//     Key? key,
//   }) : super(key: key);
//   @override
//   void onViewModelReady(ChatsViewModel viewModel) {
//     viewModel.initState();

//     super.onViewModelReady(viewModel);
//   }

//   @override
//   Widget builder(
//     BuildContext context,
//     ChatsViewModel viewModel,
//     Widget? child,
//   ) {
//     return Scaffold(
//       drawer: const DrawerView(),
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         leading: Builder(
//           builder: (BuildContext context) {
//             return IconButton(
//               icon: const Icon(
//                 Icons.vertical_distribute_sharp,
//                 color: Colors.black54,
//                 size: 18,
//               ),
//               onPressed: () {
//                 Scaffold.of(context).openDrawer();
//               },
//               tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
//             );
//           },
//         ),
//         title: Text(
//           "Chats",
//           textAlign: TextAlign.center,
//           style: GoogleFonts.ibmPlexSans(
//               fontSize: 18,
//               color: const Color(0xff4873a6).withOpacity(0.7),
//               fontWeight: FontWeight.w600),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(
//               height: 10,
//             ),
//             CustomTextFormField(
//               hintText: 'Search',
//               controller: viewModel.searchCTRL,
//               onChanged: (text) {
//                 viewModel.filterChatMembers(text);
//               },
//             ),
//             const SizedBox(height: 14),
//             const ButtonText(text: 'All Chats', color: Colors.black),
//             const SizedBox(height: 14),
//             viewModel.chatMembers.isNotEmpty
//                 ? Expanded(
//                     child: ListView.builder(
//                         itemCount: viewModel.chatMembers.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           ChatMember chatMember = viewModel.chatMembers[index];
//                           LastMessage? lastMessage = chatMember.lastMessage;

//                           return GestureDetector(
//                             onTap: () {
//                               viewModel.setChatId(chatMember);
//                             },
//                             child: Padding(
//                               padding: const EdgeInsets.only(bottom: 10),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Row(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       CircleAvatar(
//                                         radius: 22,
//                                         backgroundColor: Colors.green,
//                                         backgroundImage: NetworkImage(viewModel
//                                                 .cruntUserProfile(chatMember) ??
//                                             ""),
//                                         child: viewModel.cruntUserProfile(
//                                                     chatMember) ==
//                                                 ""
//                                             ? CustomText(
//                                                 text: viewModel
//                                                     .cruntUserName(
//                                                         chatMember)[0]
//                                                     .toUpperCase(),
//                                                 size: 18,
//                                                 fontWeight: FontWeight.w700,
//                                                 color: Colors.white,
//                                               )
//                                             : Container(),
//                                       ),
//                                       const SizedBox(width: 10),
//                                       Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           SizedBox(
//                                             width: MediaQuery.of(context)
//                                                     .size
//                                                     .width *
//                                                 0.5,
//                                             child: CustomText(
//                                                 text: viewModel.cruntUserName(
//                                                         chatMember) ??
//                                                     "".toString(),
//                                                 size: 14,
//                                                 maxLines: 1,
//                                                 textOverflow:
//                                                     TextOverflow.ellipsis,
//                                                 fontWeight: FontWeight.w600,
//                                                 color: Colors.black),
//                                           ),
//                                           const SizedBox(height: 4),
//                                           SizedBox(
//                                             width: MediaQuery.of(context)
//                                                     .size
//                                                     .width *
//                                                 0.5,
//                                             child: CustomText(
//                                               text: lastMessage!.sMS ?? "",
//                                               size: 12,
//                                               maxLines: 1,
//                                               textOverflow:
//                                                   TextOverflow.ellipsis,
//                                               fontWeight: FontWeight.w500,
//                                               color: Colors.black54,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                   Row(
//                                     crossAxisAlignment: CrossAxisAlignment.end,
//                                     children: [
//                                       CustomText(
//                                           text: timeago.format(
//                                             DateTime.fromMicrosecondsSinceEpoch(
//                                               int.parse(lastMessage.date ?? ""),
//                                             ),
//                                           ),
//                                           size: 10,
//                                           fontWeight: FontWeight.w500,
//                                           color: Colors.black54)
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         }),
//                   )
//                 : const Text("No User Found ")
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   ChatsViewModel viewModelBuilder(
//     BuildContext context,
//   ) =>
//       ChatsViewModel();
// }

// ignore_for_file: unused_local_variable

import 'package:education/services/Model/chat_member.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import '../../../../widgets/app_utils.dart';
import '../../../../widgets/custom_text_form_field.dart';
import '../../../drawer/drawer_view.dart';
import 'chats_viewmodel.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'listview_widget.dart';

class ChatsView extends StackedView<ChatsViewModel> {
  const ChatsView({
    Key? key,
  }) : super(key: key);
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
    return Scaffold(
      drawer: const DrawerView(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.vertical_distribute_sharp,
                color: Colors.black54,
                size: 18,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Text(
          "Chats",
          textAlign: TextAlign.center,
          style: GoogleFonts.ibmPlexSans(
              fontSize: 18,
              color: const Color(0xff4873a6).withOpacity(0.7),
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              hintText: 'Search',
              controller: viewModel.searchCTRL,
              onChanged: (text) {
                viewModel.filterChatMembers(text);
              },
            ),
            const SizedBox(height: 14),
            const ButtonText(text: 'All Chats', color: Colors.black),
            const SizedBox(height: 14),
            viewModel.searchCTRL.text.isEmpty
                ? viewModel.chatMembers.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                            itemCount: viewModel.chatMembers.length,
                            itemBuilder: (BuildContext context, int index) {
                              ChatMember chatMember =
                                  viewModel.chatMembers[index];
                              LastMessage? lastMessage = chatMember.lastMessage;

                              return ListViewData(
                                  lastMessage: chatMember.lastMessage!,
                                  chatMember: viewModel.chatMembers[index]);
                            }),
                      )
                    : const Text("No User Found ")
                : viewModel.filteredChatMembers.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                            itemCount: viewModel.filteredChatMembers.length,
                            itemBuilder: (BuildContext context, int index) {
                              ChatMember chatMember =
                                  viewModel.chatMembers[index];
                              LastMessage lastMessage = chatMember.lastMessage!;

                              return ListViewData(
                                  lastMessage: chatMember.lastMessage!,
                                  chatMember: viewModel.chatMembers[index]);
                            }),
                      )
                    : const Text("No User Found ")
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
