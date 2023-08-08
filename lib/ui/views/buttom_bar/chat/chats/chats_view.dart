import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import '../../../../widgets/app_utils.dart';
import '../../../../widgets/custom_text_form_field.dart';
import '../../../drawer/drawer_view.dart';
import 'chats_viewmodel.dart';

class ChatsView extends StackedView<ChatsViewModel> {
  const ChatsView({Key? key}) : super(key: key);

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
            ),
            const SizedBox(height: 14),
            const ButtonText(text: 'My Groups', color: Colors.black),
            const SizedBox(height: 14),
            SizedBox(
              child: SizedBox(
                height: 80,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10, // Replace with your actual item count
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.red,
                            backgroundImage:
                                AssetImage('assets/images/tree.jpg'),
                          ),
                          SizedBox(height: 3),
                          CustomText(
                              text: 'Group Name',
                              size: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                          SizedBox(height: 3),
                          CustomText(
                              text: 'Description',
                              size: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54)
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 14),
            const ButtonText(text: 'All Chats', color: Colors.black),
            const SizedBox(height: 14),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: viewModel.usersStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Something went wrong');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text("Loading");
                    }
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          var data = snapshot.data!.docs[index];
                          String currentuID =
                              viewModel.loginService.UserData.uID.toString();

                          String otheruID = data['UID']
                              .toString(); // Replace with the user ID of the chat partner
                          List<String> chatIDs = [currentuID, otheruID]..sort();
                          String mergedChatID = chatIDs.join('_');

                          return GestureDetector(
                            onTap: () {
                              viewModel.navigateinbox(mergedChatID, context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 22,
                                        backgroundColor: Colors.red,
                                        backgroundImage: NetworkImage(
                                            data["profile"].toString()),
                                        // AssetImage('assets/images/tree.jpg'),
                                      ),
                                      const SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                              text: data["username"].toString(),
                                              size: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                          const SizedBox(height: 3),
                                          const CustomText(
                                              text: 'Subject name',
                                              size: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black54)
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      CustomText(
                                          text: '23/9/2023',
                                          size: 10,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black54)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  }),
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
