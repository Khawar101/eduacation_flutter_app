import 'package:education/app/app.router.dart';
import 'package:education/services/Model/EbookModel.dart';
import 'package:education/services/ebook_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';

class EBookViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final eBookService = locator<EbookService>();
  navigateBookDetail(EbookModel data) {
    _navigationService.navigateToBookDetailView(eBookModel: data);
  }

  navigateNotification() {
    _navigationService.navigateToNotificationView();
  }

  navigateBack() {
    _navigationService.back();
  }

  buyEbookpdf() {}
}
