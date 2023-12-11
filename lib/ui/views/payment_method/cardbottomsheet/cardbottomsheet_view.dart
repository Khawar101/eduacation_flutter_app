import 'package:numeric_keyboard/numeric_keyboard.dart';
import '../../../widgets/app_utils.dart';
import 'cardbottomsheet_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CardbottomsheetView extends StackedView<CardbottomsheetViewModel> {
  const CardbottomsheetView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CardbottomsheetViewModel viewModel,
    Widget? child,
  ) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      child: Scaffold(
        backgroundColor: const Color(0xff4873a6).withOpacity(0.7),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            child: Column(
              children: [
                const BigText(text: 'Payment Password', color: Colors.white),
                const SizedBox(height: 6),
                const SmallText(
                    text: 'Please enter the payment password',
                    color: Colors.white),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (var i = 0; i < viewModel.codes.length; i++)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: const Color(0xff4873a6)
                                          .withOpacity(0.7),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  viewModel.codes[i],
                                  style: const TextStyle(fontSize: 24),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                NumericKeyboard(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  onKeyboardTap: (value) =>
                      viewModel.onKeyboardTap(value, context),
                  textColor: Colors.white,
                  rightButtonFn: () {
                    for (var i = viewModel.codes.length - 1; i >= 0; i--) {
                      if (viewModel.codes[i].isNotEmpty) {
                        viewModel.clearCodeField(i, context);
                        break;
                      }
                    }
                  },
                  leftButtonFn: viewModel.navigatesuccessdone,
                  leftIcon: const Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                  rightIcon: const Icon(
                    Icons.backspace,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  CardbottomsheetViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CardbottomsheetViewModel();
}
