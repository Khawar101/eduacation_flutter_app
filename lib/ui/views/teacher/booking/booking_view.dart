import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:calender_picker/calender_picker.dart';
import '../../../widgets/app_utils.dart';
import 'booking_viewmodel.dart';

class BookingView extends StackedView<BookingViewModel> {
  const BookingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BookingViewModel viewModel,
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
            "Teachers Booking",
            textAlign: TextAlign.center,
            style: GoogleFonts.ibmPlexSans(
                fontSize: 18,
                color: const Color(0xff4873a6).withOpacity(0.7),
                fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15, top: 10),
              child: GestureDetector(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: ((context) => const NotificationScreen())));
                },
                child: Stack(
                  children: [
                    const Icon(
                      Icons.notifications_none_outlined,
                      color: Colors.black45,
                      size: 26,
                    ),
                    Positioned(
                      top: 3,
                      left: 2.5,
                      child: CircleAvatar(
                        radius: 4.5,
                        backgroundColor:
                            const Color(0xff4873a6).withOpacity(0.7),
                      ),
                    )
                  ],
                ),
              ),
            )
          ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          // vertical: MediaQuery.of(context).size.height * 0.03
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ButtonText(text: "Book appointment", color: Colors.black),
                Image.asset(
                  'assets/icons/adjust-48.png',
                  width: 18,
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            Container(
              decoration: BoxDecoration(
                  color: const Color(0xff4873a6).withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CalenderPicker(
                  DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: const Color(0xff4873a6).withOpacity(0.7),
                  selectedTextColor: Colors.white,
                  dateTextStyle: const TextStyle(fontSize: 16),
                  onDateChange: (date) {
                    // New date selected
                    //   _selectedValue = date;
                  },
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.025),
            RichText(
              text: TextSpan(
                text: '3 ',
                style: GoogleFonts.ibmPlexSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
                children: <TextSpan>[
                  const TextSpan(text: 'Teacher available on'),
                  TextSpan(
                      text: ' 21 March "2023',
                      style: GoogleFonts.ibmPlexSans(
                        color: const Color(0xff4873a6).withOpacity(0.7),
                      )),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Expanded(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>const TeacherDetail()));
                  },
                  child: ListView.builder(
                    itemCount: 13,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.01),
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0xff4873a6).withOpacity(0.7),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.02,
                              //    vertical: MediaQuery.of(context).size.height * 0.009
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 90,
                                      width: 90,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                            'assets/images/download (1).jpeg',
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                    const SizedBox(width: 10),
                                    const ButtonText(
                                        text: "Adobe XD", color: Colors.white)
                                    //
                                  ],
                                ),
                                Container(
                                  height: 90,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: '03',
                                              style: GoogleFonts.ibmPlexSans(
                                                  color: Colors.black,
                                                  fontSize: 20)),
                                          TextSpan(
                                              text: '\nYears',
                                              style: GoogleFonts.ibmPlexSans(
                                                  color: Colors.black,
                                                  fontSize: 12)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ), //Calender part
    );
  }

  @override
  BookingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BookingViewModel();
}
