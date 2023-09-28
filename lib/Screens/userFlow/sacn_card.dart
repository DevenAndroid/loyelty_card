import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyelty_card/Screens/loyalty_card_list.dart';
import 'package:loyelty_card/models/profile_model.dart';
import 'package:loyelty_card/resourses/api_constant.dart';
import 'package:loyelty_card/routers/my_routers.dart';
import 'package:loyelty_card/widgets/circular_progressindicator.dart';
import 'package:loyelty_card/widgets/common_boder_button.dart';
import 'package:loyelty_card/widgets/common_error_widget.dart';

import '../../repositories/get_profile_repo.dart';
import '../../widgets/common_textfield.dart';

class ScanCard extends StatefulWidget {
  const ScanCard({super.key});

  @override
  State<ScanCard> createState() => _ScanCardState();
}

class _ScanCardState extends State<ScanCard> {
  Rx<RxStatus> statusOfProfile = RxStatus.empty().obs;
  Rx<ProfileModel> profileModel = ProfileModel().obs;

  getProfile() {
    getProfileRepo().then((value) {
      if (value.status!) {
        profileModel.value = value;
        statusOfProfile.value = RxStatus.success();
        showToast(value.message.toString());
      } else {
        statusOfProfile.value = RxStatus.error();
        showToast(value.message.toString());
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfile();
  }
  String _scanBarcode = '';
  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      Get.toNamed(MyRouters.cardRecordScreen);
      debugPrint(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }


  String _scanBarcode1 = '';
  Future<void> scanQR1() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      Get.toNamed(MyRouters.cardRecordScreen);
      debugPrint(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _scanBarcode1 = barcodeScanRes;
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
            const SizedBox(height: 10,),
            InkWell(
                onTap: () {
                  Get.toNamed(MyRouters.qrCodeList);
                },
                child: const CustomOutlineBoder2(
                  title: 'QR CARD LIST',
                )),
            const SizedBox(height: 10,),
            InkWell(
                onTap: () {
                  scanQR1();
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
                            child: CachedNetworkImage(
                              imageUrl: (profileModel.value.data!.profileImage?? "").toString(),

                              height: height * 0.12,
                              width: width * 0.12,
                              errorWidget: (_, __, ___) => Image.asset(
                                'assets/images/person.png',
                                fit: BoxFit.cover,
                                height: height * 0.12,
                                width: width * 0.12,
                              ),
                              placeholder: (_, __) => const SizedBox(),
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Logged in as:",
                                style: GoogleFonts.plusJakartaSans(
                                    fontSize: 15, fontWeight: FontWeight.w400, color: const Color(0xFF33454D)),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                profileModel.value.data!.name.toString(),
                                style: GoogleFonts.plusJakartaSans(
                                    fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xFF0073DA)),
                              ),
                            ],
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: (){
                              scanQR();
                            },
                            child: CircleAvatar(
                              radius: 20,
                              child: Image.asset('assets/images/ScanMenu.png'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Image.asset("assets/images/cardimage.png"),
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
