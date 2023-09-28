import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyelty_card/routers/my_routers.dart';

import '../Controller/qr_list_controller.dart';
import '../widgets/common_button.dart';

class QrCodeList extends StatefulWidget {
  const QrCodeList({super.key});

  @override
  State<QrCodeList> createState() => _QrCodeListState();
}

class _QrCodeListState extends State<QrCodeList> {
  final controller = Get.put(QrListController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getDataQr();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: backAppBar(title: 'QR Code List', context: context),
        body: SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  controller.isDataLoading.value && controller.qrModel.value.data != null ?
                  SingleChildScrollView(
                    child: ListView.builder(

                        itemCount: controller.qrModel.value.data!.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                child: InkWell(
                                  onTap: () {
                                    Get.toNamed(MyRouters.qrScreen,arguments: [controller.qrModel.value.data![index].image.toString(),controller.qrModel.value.data![index].businessName.toString(),]);
                                  },
                                  child: Container(

                                    height: 50,
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(color: Color(0xFFE1E1E1))),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const SizedBox(width: 15,),
                                        Expanded(
                                          child: Text(controller.qrModel.value.data![index
                                          ].businessName
                                              .toString()
                                              .capitalizeFirst
                                              .toString(), style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF2A363E)
                                          ),),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Get.toNamed(MyRouters.qrScreen,arguments: [controller.qrModel.value.data![index].image.toString(),controller.qrModel.value.data![index].businessName.toString(),]);
                                          },
                                          child: Icon(
                                            Icons.remove_red_eye_outlined, color: Color(0xFF2C91FF),),
                                        ), SizedBox(width: 10,)
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        }),
                  )
                      : const Center(child: CircularProgressIndicator())
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
