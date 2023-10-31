import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyelty_card/Controller/qr_list_controller.dart';
import 'package:loyelty_card/models/qr_details_model.dart';
import 'package:loyelty_card/repositories/qr_details_repo.dart';
import 'package:loyelty_card/routers/my_routers.dart';
import 'package:loyelty_card/widgets/circular_progressindicator.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  late QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QRView');
  Barcode? result;
  Rx<RxStatus> statusOfQr = RxStatus.empty().obs;
  Rx<QrDetailsModel> qRDetails = QrDetailsModel().obs;
  Rx<RxStatus> statusOfProfile = RxStatus.empty().obs;
  final qRController = Get.put(QrListController());

  getDetails() {
    getQrDetailsRepo(ids: result!.code.toString()).then((value) {
      qRDetails.value = value;
      statusOfQr.value = RxStatus.success();
      Get.toNamed(MyRouters.cardRecordScreen, arguments: [
        qRDetails.value.person!.emailAddress.toString(),
        qRDetails.value.person!.displayName.toString(),
        qRDetails.value.metaData!.remainingpoints.toString(),
        qRDetails.value.metaData!.stampStatus.toString()
      ]);

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    qRController.getToken();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body:    Column(
          children: [
            Expanded(
              flex: 5,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
              ),
            ),
            if (result != null)
              const Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    'Scanned Completed',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

          ]));

  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
      getDetails();

       print("gddfgfdg"+result!.code.toString(),) ;

      print("emitt done");
      controller.pauseCamera();
    });
  }
}
