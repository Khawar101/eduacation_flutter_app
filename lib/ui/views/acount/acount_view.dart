import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/app_utils.dart';
import 'acount_viewmodel.dart';

class AcountView extends StackedView<AcountViewModel> {
  const AcountView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AcountViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      // backgroundColor: const Color(0xffe5f1f8),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
            size: 18,
          ),
        ),
        title: Text(
          "Acount",
          textAlign: TextAlign.center,
          style: GoogleFonts.ibmPlexSans(
              fontSize: 18,
              color: const Color(0xff4873a6).withOpacity(0.7),
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                //     width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFF4873A6).withOpacity(0.7),
                ),
                child:  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText(
                          text: 'General Setting',
                          size: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white)),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xFF4873A6).withOpacity(0.7),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonText(
                        text: 'PIN',
                        color: const Color(0xFF4873A6).withOpacity(0.7),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: const Color(0xFF4873A6).withOpacity(0.7),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Container(
                height: 40,
                //     width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFF4873A6).withOpacity(0.7),
                ),
                child:  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText(
                          text: 'Support',
                          size: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white)),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              bottom:
                                  MediaQuery.of(context).size.height * 0.015),
                          child: Container(
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color(0xFF4873A6).withOpacity(0.7),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ButtonText(
                                    text: viewModel.Support[index].toString(),
                                    color: const Color(0xFF4873A6)
                                        .withOpacity(0.7),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 18,
                                    color: const Color(0xFF4873A6)
                                        .withOpacity(0.7),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  @override
  AcountViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AcountViewModel();
}
