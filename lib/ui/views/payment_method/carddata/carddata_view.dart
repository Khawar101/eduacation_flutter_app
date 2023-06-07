import 'package:education/ui/views/payment_method/carddata/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

import '../../../widgets/app_utils.dart';
import 'carddata_viewmodel.dart';

class CarddataView extends StackedView<CarddataViewModel> {
  const CarddataView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CarddataViewModel viewModel,
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BigText(
                  text: "Add your payment method", color: Colors.black),
              SizedBox(height: MediaQuery.of(context).size.height * 0.07),
              const ButtonText(text: "Card Name", color: Colors.black),
              SizedBox(height: MediaQuery.of(context).size.height * 0.009),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: const Color(0xff4873a6).withOpacity(0.7),
                        width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  //  controller: email,
                  decoration: InputDecoration(
                      hintText: "My VISA card",
                      hintStyle:
                          const TextStyle(color: Colors.grey, fontSize: 14),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.width * 0.04)),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              const ButtonText(text: "Card Number", color: Colors.black),
              SizedBox(height: MediaQuery.of(context).size.height * 0.009),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: const Color(0xff4873a6).withOpacity(0.7),
                        width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(16),
                    CreditCardInputFormat()
                  ],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "XXXX XXXX XXXX XXXX",
                      hintStyle:
                          const TextStyle(color: Colors.grey, fontSize: 14),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.width * 0.04)),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ButtonText(text: "Exp Date", color: Colors.black),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.013),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            border: Border.all(
                                color: const Color(0xff4873a6).withOpacity(0.7),
                                width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(6),
                            CardMonthInputFormatter(),
                          ],
                          decoration: InputDecoration(
                              hintText: "DD/MM/YY",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width *
                                          0.04)),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ButtonText(text: "CVV2", color: Colors.black),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.013),
                      Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            border: Border.all(
                                color: const Color(0xff4873a6).withOpacity(0.7),
                                width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(3),
                            CreditCardInputFormat()
                          ],
                          decoration: InputDecoration(
                              hintText: "XXX",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width *
                                          0.04)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              GestureDetector(
                onTap: viewModel.navigatecard,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xff4873a6).withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                      child: ButtonText(
                    text: 'Continue',
                    color: Colors.white,
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  CarddataViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CarddataViewModel();
}
