
import 'package:get/get.dart';
import 'package:loyelty_card/models/model_get_token.dart';
import 'package:loyelty_card/repositories/loyalty_list_repo.dart';
import 'package:loyelty_card/repositories/token_repo.dart';
import 'package:loyelty_card/resourses/api_constant.dart';

import '../models/loyalty_list_model.dart';
import '../models/qr_list_model.dart';
import '../repositories/qr_list_repo.dart';

class QrListController extends GetxController{

  Rx<QRListModel> qrModel = QRListModel().obs;
  Rx<RxStatus> statusOfQr = RxStatus.empty().obs;

  getDataQr() {
    qrListRepo().then((value) async {
      if (value.status==true) {
        qrModel.value = value;
        statusOfQr.value = RxStatus.success();
        // showToast(value.message.toString());

      } else {
        statusOfQr.value = RxStatus.error();
        // showToast(value.message.toString());
      }
    });
  }
  String testToken="";
  Rx<ModelGetToken> token = ModelGetToken().obs;
  Rx<RxStatus> statusOfGetToken = RxStatus.empty().obs;
  getToken() {
    getTokenRepo().then((value) async {
      if (value.status!) {
        token.value = value;
        testToken  =  token.value.data!.token.toString();
        statusOfGetToken.value = RxStatus.success();
        print(testToken);


      } else {
        statusOfGetToken.value = RxStatus.error();
        // showToast(value.message.toString());
      }
    });
  }
}