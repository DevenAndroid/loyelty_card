import 'dart:developer';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyelty_card/models/updateQrScan_model.dart';
import 'package:loyelty_card/repositories/update_qr_scan_repo.dart';
import 'package:loyelty_card/resourses/api_constant.dart';
import 'package:loyelty_card/widgets/common_boder_button.dart';
import 'package:open_filex/open_filex.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class CardRecordScreen extends StatefulWidget {
  const CardRecordScreen({super.key});

  @override
  State<CardRecordScreen> createState() => _CardRecordScreenState();
}

class _CardRecordScreenState extends State<CardRecordScreen> {
  int _itemCount = 0;

  var recordEmail = Get.arguments[0];
  var recordName = Get.arguments[1];
  var recordRemainStamp = Get.arguments[2];
  var recordStamp = Get.arguments[3];
  int countOnes1 = 0;

  dynamic staffName = "";
  dynamic staffId = "";

  getStaffName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    staffName = pref.getString('staffName');
    staffId = pref.getString('staffId');
    setState(() {});
  }

  Rx<RxStatus> statusOfUpdate = RxStatus.empty().obs;
  Rx<ModelQRUpdate> update = ModelQRUpdate().obs;

  updateQr() {
    getUpdateRepo(id: staffId.toString(), context: context).then((value) async {
      if (value.status!) {
        update.value = value;
        statusOfUpdate.value = RxStatus.success();
        print("staffid :::::::::::::::::" + staffId.toString());
        showToast(value.message.toString());

        // Get.offAllNamed(MyRouters.loginScreen);
      } else {
        statusOfUpdate.value = RxStatus.error();
        showToast(value.message.toString());
      }
    });
  }

  void main() {
    var myInt = int.parse(recordStamp.toString());
    int number = myInt; // Replace this with the integer you want to convert

    // Convert the integer to binary
    String binaryRepresentation = number.toRadixString(2);

    countOnes1 = binaryRepresentation
        .split("")
        .map((e) => int.tryParse(e) ?? 0)
        .toList()
        .sum;
    log("binaryRepresentation....     ${binaryRepresentation}");
  }


  int countOnes(String binaryString) {
    int count = 0;
    for (int i = 0; i < binaryString.length; i++) {
      if (binaryString[i] == '1') {
        count++;
      }
    }
    return count;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    main();
    getStaffName();
  }

  int get finalInt => countOnes1+ _itemCount;

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      floatingActionButton:  Padding(
        padding: const EdgeInsets.only(bottom: 150.0, right: 10),
        child: FloatingActionButton(
          onPressed: () {
            updateQr();
          },
          child: Image.asset("assets/images/stamps.png"),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C91FF),

        leading: InkWell(
            onTap: (){
              Get.back();
            },
            child: const Icon(Icons.arrow_back,size: 20,color: Colors.white,)),
       elevation: 0,
       title: Text("Card Record" ,style: GoogleFonts.plusJakartaSans(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white),),
        centerTitle: true,
      ),
      // bottomNavigationBar:  Padding(
      //   padding: EdgeInsets.only(bottom: 28.0),
      //   child: InkWell(
      //       onTap: (){
      //         scanQR();
      //       },
      //       child: CustomOutlineBoder(title: "Buy",)),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                height: 150,
                decoration: BoxDecoration(
                  color: const Color(0xFFE1C8A0),
                  borderRadius: BorderRadius.circular(10)

                ),
                  child: Column(
                    children: [
                      GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5
                      ),
                          shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: (c,i){
                       return GestureDetector(
                         onTap: (){
                           _itemCount = i+1;
                           setState(() {});
                         },
                         child: finalInt < i+1 ?
                         Image.asset("assets/images/cup.png",width: 60,height: 60,) :
                         SvgPicture.asset("assets/images/cup1.svg",width: 60,height: 60,),
                       );
                      }),
                      // Row(
                      //   children: [
                      //     SvgPicture.asset("assets/images/cup1.svg",width: 60,height: 60,),
                      //     Image.asset("assets/images/cup.png",width: 60,height: 60,),
                      //     Image.asset("assets/images/cup.png",width: 60,height: 60,),
                      //     Image.asset("assets/images/cup.png",width: 60,height: 60,),
                      //     Image.asset("assets/images/cup.png",width: 60,height: 60,),
                      //   ],
                      // ),
                      // const SizedBox(height: 7,),
                      // Row(
                      //   children: [
                      //     Image.asset("assets/images/cup.png",width: 60,height: 60,),
                      //     Image.asset("assets/images/cup.png",width: 60,height: 60,),
                      //     Image.asset("assets/images/cup.png",width: 60,height: 60,),
                      //     Image.asset("assets/images/cup.png",width: 60,height: 60,),
                      //     Image.asset("assets/images/cup.png",width: 60,height: 60,),
                      //   ],
                      // ),
                    ],
                  )
              ),

              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name:",style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF3E3E3E)),),

                  Text(recordName,style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF454545)),),
                ],
              ),
              const SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email:",style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF3E3E3E)),),
                  Text(recordEmail,style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF454545)),),
                ],
              ),
              const SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Lifetime Stamps:",style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF3E3E3E)),),
                  Text(recordRemainStamp,style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF454545)),),
                ],
              ),
              // const SizedBox(height: 15,),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text("Rewards Available:",style: GoogleFonts.plusJakartaSans(
              //         fontSize: 16,
              //         fontWeight: FontWeight.w600,
              //         color: const Color(0xFF3E3E3E)),),
              //     Text("0",style: GoogleFonts.plusJakartaSans(
              //         fontSize: 16,
              //         fontWeight: FontWeight.w400,
              //         color: const Color(0xFF454545)),),
              //   ],
              // ),
              // const SizedBox(height: 15,),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text(
              //       "Last Visit:",
              //       style: GoogleFonts.plusJakartaSans(
              //           fontSize: 16,
              //           fontWeight: FontWeight.w600,
              //           color: const Color(0xFF3E3E3E)),
              //     ),
              //     Text(
              //       "2023-08-28 15:26",
              //       style: GoogleFonts.plusJakartaSans(
              //           fontSize: 16,
              //           fontWeight: FontWeight.w400,
              //           color: const Color(0xFF454545)),
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Add Stemps:",
                    style: GoogleFonts.plusJakartaSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF3E3E3E)),
                  ),
                  Text(
                    _itemCount.toString(),
                    style: GoogleFonts.plusJakartaSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF454545)),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                height: 50,
                width: 155,
                decoration: BoxDecoration(
                    color: const Color(0xFF2C91FF),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _itemCount != 0
                        ? InkWell(
                      onTap: (){
                        _itemCount--;
                        setState(() {

                        });
                      },
                          child: Padding(
                              padding: const EdgeInsets.only(bottom: 18.0),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                                onPressed: () => setState(() => _itemCount--),
                              ),
                            ),
                        )
                        : IconButton(
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                    // InkWell(
                    //     onTap: (){_itemCount--},
                    //     child: Text(
                    //       "-",style: GoogleFonts.plusJakartaSans(
                    //         fontSize: 22,
                    //         fontWeight: FontWeight.w800,
                    //         color: Colors.white),
                    //     ),
                    // ),
                    //       const SizedBox(width: 10,),
                    Container(
                      height: 25,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3)),
                      child: Center(
                        child: Text(
                          _itemCount.toString(),
                          style: GoogleFonts.plusJakartaSans(
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    // const SizedBox(width: 10,),
                    finalInt != 10?
                    InkWell(
                      onTap: (){
                        _itemCount++;
                        setState(() {

                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 18.0),
                        child: IconButton(
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: () => setState(() => _itemCount++)),
                      ),
                    ) : IconButton(
    icon: const Icon(
    Icons.add,
    color: Colors.white,
    ),
    onPressed: () {},
    ),
                    // InkWell(
                    //     onTap: (){},
                    //     child: Text(
                    //       "+",style: GoogleFonts.plusJakartaSans(
                    //         fontSize: 22,
                    //         fontWeight: FontWeight.w800,
                    //         color: Colors.white),
                    //     ),
                    // ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "No Rewards Available",
                style: GoogleFonts.plusJakartaSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF3E3E3E)),
              ),
              // InkWell(
              //   onTap: () async {
              //     final Uri url = Uri.parse(_scanBarcode);
              //     try {
              //       await launchUrl(url, mode: LaunchMode.externalApplication);
              //     } catch (e) {
              //       throw Exception(e);
              //     }
              //     OpenFilex.open(url.path);
              //   },
              //   child: Text(
              //     ' $_scanBarcode\n',
              //     style: const TextStyle(
              //         fontSize: 20, decoration: TextDecoration.underline),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
