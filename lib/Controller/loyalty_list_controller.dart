
import 'package:get/get.dart';
import 'package:loyelty_card/models/loyalty_list_model.dart';
import 'package:loyelty_card/repositories/loyalty_list_repo.dart';



class LoyaltyListController extends GetxController{
  RxBool isDataLoading = false.obs;
  Rx<LoyaltyListModel> model = LoyaltyListModel().obs;

  getData() async {
    isDataLoading.value = false;
    loyaltyCardList().then((value) {
      isDataLoading.value = true;
      model.value = value;
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