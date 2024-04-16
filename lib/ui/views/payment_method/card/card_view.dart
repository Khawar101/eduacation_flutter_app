import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
// import 'package:flutter_credit_card/credit_card_brand.dart';
// import 'package:flutter_credit_card/credit_card_widget.dart';
// import 'package:flutter_credit_card/glassmorphism_config.dart';
import '../../../widgets/app_utils.dart';
import 'card_viewmodel.dart';

class CardView extends StackedView<CardViewModel> {
  const CardView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CardViewModel viewModel,
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
          "Payment Method",
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              const BigText(text: "\$74.00 ", color: Colors.black),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              const ButtonText(text: "My card", color: Colors.black),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              // CreditCardWidget(
              //   glassmorphismConfig: viewModel.useGlassMorphism
              //       ? Glassmorphism.defaultConfig()
              //       : null,
              //   cardNumber: viewModel.cardNumber,
              //   expiryDate: viewModel.expiryDate,
              //   cardHolderName: viewModel.cardHolderName,
              //   cvvCode: viewModel.cvvCode,
              //   bankName: 'Axis Bank',
              //   frontCardBorder: !viewModel.useGlassMorphism
              //       ? Border.all(color: Colors.grey)
              //       : null,
              //   backCardBorder: !viewModel.useGlassMorphism
              //       ? Border.all(color: Colors.grey)
              //       : null,
              //   showBackView: viewModel.isCvvFocused,
              //   obscureCardNumber: true,
              //   obscureCardCvv: true,
              //   isHolderNameVisible: true,
              //   cardBgColor: const Color(0xff4873a6).withOpacity(0.7),
              //   backgroundImage:
              //       viewModel.useBackgroundImage ? 'assets/card_bg.png' : null,
              //   isSwipeGestureEnabled: true,
              //   onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
              //   // customCardTypeIcons: <CustomCardTypeIcon>[
              //   //   CustomCardTypeIcon(
              //   //     cardType: CardType.mastercard,
              //   //     cardImage: Image.asset(
              //   //       'assets/mastercard.png',
              //   //       height: 48,
              //   //       width: 48,
              //   //     ),
              //   //   ),
              //   // ],
              // ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              GestureDetector(
                onTap: () => viewModel.openBottomSheet(context),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff4873a6).withOpacity(0.7),
                  ),
                  child: const Center(
                    child: ButtonText(
                      text: 'Pay Now',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  CardViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CardViewModel();
}
