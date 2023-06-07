import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CardViewModel extends BaseViewModel {
   void _openBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return const FractionallySizedBox(
            heightFactor: 0.7, 
            //child: BottomSheetOpen()
            );
      },
      backgroundColor:
          Colors.transparent, // Set the background color to transparent
      isScrollControlled: true,
    );
  }

  //  StreamController<ErrorAnimationType> errorController = StreamController<ErrorAnimationType>();
  String text = '';

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    // super.initState();
  }
}
