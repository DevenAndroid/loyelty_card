import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyelty_card/Controller/qr_list_controller.dart';
import 'package:loyelty_card/Screens/loyalty_card_list.dart';
import 'package:loyelty_card/models/model_logout.dart';
import 'package:loyelty_card/models/profile_model.dart';
import 'package:loyelty_card/models/qr_details_model.dart';
import 'package:loyelty_card/repositories/logout%20repo.dart';
import 'package:loyelty_card/repositories/qr_details_repo.dart';
import 'package:loyelty_card/resourses/api_constant.dart';
import 'package:loyelty_card/routers/my_routers.dart';
import 'package:loyelty_card/widgets/circular_progressindicator.dart';
import 'package:loyelty_card/widgets/common_boder_button.dart';
import 'package:loyelty_card/widgets/common_colour.dart';
import 'package:loyelty_card/widgets/common_error_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/model_get_data.dart';
import '../../repositories/get_profile_repo.dart';
import '../../widgets/common_textfield.dart';

class ScanCard extends StatefulWidget {
  const ScanCard({super.key});

  @override
  State<ScanCard> createState() => _ScanCardState();
}

class _ScanCardState extends State<ScanCard> {
  final controller = Get.put(QrListController());
  Rx<RxStatus> statusOfProfile = RxStatus.empty().obs;
  Rx<ProfileModel> profileModel = ProfileModel().obs;

  getProfile() {
    getProfileRepo().then((value) async {
      if(value.message=="Unauthenticated.") {
        Get.toNamed(MyRouters.loginScreen);
        showToast("user is logout ");
      }
      if (value.status!) {
        profileModel.value = value;
        statusOfProfile.value = RxStatus.success();
        showToast(value.message.toString());}


        else {
        statusOfProfile.value = RxStatus.error();
        showToast(value.message.toString());
      }
    });
  }

  Rx<RxStatus> statusOfLogout = RxStatus.empty().obs;
  Rx<ModelLogout> logoutId = ModelLogout().obs;

  logout() {
    getLogoutRepo(context).then((value) async {
      if (value.status!) {
        logoutId.value = value;
        statusOfLogout.value = RxStatus.success();
        SharedPreferences pref = await SharedPreferences.getInstance();
        showToast(value.message.toString());
        pref.clear();
        Get.offAllNamed(MyRouters.loginScreen);
      } else {
        statusOfLogout.value = RxStatus.error();
        showToast(value.message.toString());
      }
    });
  }

  Rx<RxStatus> statusOfQr = RxStatus.empty().obs;
  Rx<ModelQrDetails> qRDetails = ModelQrDetails().obs;

  getDetails() {
    getQrDetailsRepo(ids: _scanBarcode2).then((value) {
      qRDetails.value = value;
      statusOfProfile.value = RxStatus.success();
      Get.toNamed(MyRouters.cardRecordScreen, arguments: [
        qRDetails.value.data!.id.toString(),
        qRDetails.value.data!.token.toString(),
        qRDetails.value.data!.name.toString(),
        qRDetails.value.data!.email.toString(),
        qRDetails.value.data!.stampsCollected.toString(),
        qRDetails.value.data!.stampsRemaining.toString(),
      ]);

    });
  }

  dynamic staffName = "";
  getStaffName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    staffName = pref.getString('staffName');
    setState(() {});
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.getToken();
    getProfile();
    getStaffName();
  }



  String _scanBarcode2 = 'Unknown';

  /// For Continuous scan
  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', '', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  Future<void> barcodeScan() async {
    String? barcodeScanRes;

    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', '', true, ScanMode.QR);


      print(barcodeScanRes);
      getDetails();
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted)   getDetails();
    setState(() {
      _scanBarcode2 = barcodeScanRes!;
      // controller.getToken();
      getDetails();
    });
  }



  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
                onTap: () {
                  Get.toNamed(LoyaltyCardListScreen.loyaltyCardListScreen);
                },
                child: const CustomOutlineBoder2(
                  title: 'LOYALTY CARD LIST',
                )),
            const SizedBox(
              height: 10,
            ),
            InkWell(
                onTap: () {
                  Get.toNamed(MyRouters.qrCodeList);
                },
                child: const CustomOutlineBoder2(
                  title: 'QR CARD LIST',
                )),
            const SizedBox(
              height: 10,
            ),
            InkWell(
                onTap: () {
                  controller.getToken();
                  // barcodeScan();
                  Get.toNamed(MyRouters.scannerScreen);
                  // Get.toNamed(MyRouters.scannerScreen);
                  // Get.toNamed(MyRouters.cardRecordScreen);
                },
                child: const CustomOutlineBoder(
                  title: 'SCAN CARD',
                ))
          ],
        ),
      ),
      body: Obx(() {
        return profileModel.value.status == true
            ? SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Image.network(profileModel.value.data!.profileImage.toString()),
                          CircleAvatar(
                            radius: 20,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: CachedNetworkImage(
                                imageUrl:
                                    (profileModel.value.data!.profileImage ??
                                            "")
                                        .toString(),
                                height: height * 0.13,
                                width: width * 0.13,
                                errorWidget: (_, __, ___) => Image.asset(
                                  'assets/images/profile.png',
                                  fit: BoxFit.cover,
                                  height: height * 0.12,
                                  width: width * 0.18,
                                ),
                                placeholder: (_, __) => const SizedBox(),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {

                                },
                                child: Text(
                                  "Logged in as:",
                                  style: GoogleFonts.plusJakartaSans(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF33454D)),
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                staffName.toString(),
                                style: GoogleFonts.plusJakartaSans(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF0073DA)),
                              ),
                            ],
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              controller.getToken();
                              Get.toNamed(MyRouters.scannerScreen);
                            },
                            child: CircleAvatar(
                              radius: 20,
                              child: Image.asset('assets/images/Scan.png'),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                              onTap: () {
                                logout();
                              },
                              child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF2C91FF),
                                  ),
                                  child: Icon(
                                    Icons.exit_to_app,
                                    color: Colors.white,
                                  ))),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(child: Image.asset("assets/images/card1.png")),

                      // Text('Scan result : $_scanBarcode2\n',
                      //     style: const TextStyle(
                      //         fontSize: 20, fontWeight: FontWeight.bold)),
                      // SizedBox(
                      //   height: 45,
                      //   child: ElevatedButton(
                      //       style: ElevatedButton.styleFrom(
                      //         primary: Colors.cyan,
                      //       ),
                      //       onPressed: () => barcodeScan(),
                      //       child: const Text('Barcode Scan',
                      //           style: TextStyle(
                      //               fontSize: 17, fontWeight: FontWeight.bold))),
                      // ),
                    ],
                  ),
                ),
              )
            : statusOfProfile.value.isError
                ? CommonErrorWidget(
                    errorText: profileModel.value.message.toString(),
                    onTap: () {
                      getProfile();
                    },
                  )
                : const CommonProgressIndicator();
      }),
    );
  }
}
