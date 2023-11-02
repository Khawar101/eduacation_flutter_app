// ignore_for_file: unused_local_variable
import 'package:education/services/Model/chat_member.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import '../../../../widgets/app_utils.dart';
import '../../../../widgets/custom_text_form_field.dart';
import '../../../drawer/drawer_view.dart';
import 'chats_viewmodel.dart';
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
        title: CustomText(
            text: "Chats",
            textAlign: TextAlign.center,
            fontSize: 18,
            color: const Color(0xff4873a6).withOpacity(0.7),
            fontWeight: FontWeight.w600),
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
                                  viewModel.filteredChatMembers[index];
                              LastMessage lastMessage = chatMember.lastMessage!;

                              return ListViewData(
                                  lastMessage: chatMember.lastMessage!,
                                  chatMember:
                                      viewModel.filteredChatMembers[index]);
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
