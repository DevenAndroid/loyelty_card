
import 'package:get/get.dart';
import 'package:loyelty_card/repositories/loyalty_list_repo.dart';

import '../models/loyalty_list_model.dart';
import '../models/qr_list_model.dart';
import '../repositories/qr_list_repo.dart';

class QrListController extends GetxController{
  RxBool isDataLoading = false.obs;
  Rx<QRListModel> qrModel = QRListModel().obs;

  getDataQr() async {
    isDataLoading.value = false;
    qrListRepo().then((value) {
      isDataLoading.value = true;
      qrModel.value = value;
    });
  }
// getData() async {
//   isDataLoading.value = false;
//   notificationRepo().then((value) {
//     isDataLoading.value = true;
//     model.value = value;
//   });
// }

}