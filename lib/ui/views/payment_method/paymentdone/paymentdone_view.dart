import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:lottie/lottie.dart';
import '../../../widgets/app_utils.dart';
import 'paymentdone_viewmodel.dart';

class PaymentdoneView extends StackedView<PaymentdoneViewModel> {
  const PaymentdoneView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PaymentdoneViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 20, vertical: MediaQuery.of(context).size.height * 0.2),
        child: Column(
          children: [
            Center(
                child: Lottie.asset('assets/lottie/lottie_success.json',
                    width: 130, height: 130)),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            const BigText(text: "Successful purchase!", color: Colors.black),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            GestureDetector(
              onTap: viewModel.navigateListOfCourses,
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                    color: const Color(0xff4873a6).withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child:
                      ButtonText(text: "Start learning", color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  PaymentdoneViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PaymentdoneViewModel();
}
