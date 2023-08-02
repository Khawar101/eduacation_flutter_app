import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import '../../../widgets/app_utils.dart';
import '../../../widgets/custom_text_form_field.dart';
import 'categories_viewmodel.dart';

class CategoriesView extends StackedView<CategoriesViewModel> {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CategoriesViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
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
            "Categories",
            textAlign: TextAlign.center,
            style: GoogleFonts.ibmPlexSans(
                fontSize: 18,
                color: const Color(0xff4873a6).withOpacity(0.7),
                fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: () => viewModel.openBottomSheet(context),
              child: const Padding(
                padding: EdgeInsets.only(right: 15),
                child: Image(
                  image: AssetImage('assets/icons/slider.png'),
                  color: Colors.black45,
                  width: 24,
                ),
              ),
            ),
          ]),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormField(
              hintText: 'Product Design',
              prefix: const Icon(
                Icons.search_rounded,
                size: 18,
              ),
              suffix: IconButton(
                onPressed: () {
                },
                icon: const Icon(Icons.highlight_off),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.025),
            SizedBox(
              height: 30,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.04,
                        top: MediaQuery.of(context).size.height * 0.00),
                    child: Container(
                      //   width: 130.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xff4873a6).withOpacity(0.7),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.03),
                        child: const Center(
                            child: SmallText(
                                text: 'Visual identity', color: Colors.white)),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Expanded(
              child: ListView.builder(
                  //    shrinkWrap: true,
                  itemCount: 8,
                  // physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.015),
                      child: Container(
                        //    height: 70,
                        decoration: BoxDecoration(
                            color: const Color(0xff4873a6).withOpacity(0.7),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.03,
                              vertical:
                                  MediaQuery.of(context).size.height * 0.018),
                          child: Row(
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Colors.black,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/images/images.jpg',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.09),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Product Design v1.0",
                                    style: GoogleFonts.ibmPlexSans(
                                        color: const Color(0xffffffff)),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.005),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Icon(
                                        Icons.person,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.01),
                                      Text(
                                        "Robertson Connie",
                                        style: GoogleFonts.ibmPlexSans(
                                            fontSize: 10,
                                            color: const Color(0xffffffff)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.009),
                                  const Row(
                                    children: [
                                      ButtonText(
                                        text: "\$190",
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 10),
                                      ButtonText(
                                        text: "16 hours",
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  @override
  CategoriesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CategoriesViewModel();
}
