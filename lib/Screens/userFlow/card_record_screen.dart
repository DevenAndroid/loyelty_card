import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyelty_card/widgets/common_boder_button.dart';
class CardRecordScreen extends StatefulWidget {
  const CardRecordScreen({super.key});

  @override
  State<CardRecordScreen> createState() => _CardRecordScreenState();
}

class _CardRecordScreenState extends State<CardRecordScreen> {
  int _itemCount = 0;
  String _scanBarcode = '';
  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      debugPrint(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
      bottomNavigationBar:  Padding(
        padding: EdgeInsets.only(bottom: 28.0),
        child: InkWell(
            onTap: (){
              scanQR();
            },
            child: CustomOutlineBoder(title: "Buy",)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name:",style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF3E3E3E)),),
                  Text("Pradeep Kumar",style: GoogleFonts.plusJakartaSans(
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
                  Text("15",style: GoogleFonts.plusJakartaSans(
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
                  Text("Rewards Available:",style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF3E3E3E)),),
                  Text("0",style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF454545)),),
                ],
              ),
              const SizedBox(height: 15,),  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Last Visit:",style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF3E3E3E)),),
                  Text("2023-08-28 15:26",style: GoogleFonts.plusJakartaSans(
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
                  Text("Add Stemps:",style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF3E3E3E)),),
                  Text(_itemCount.toString(),style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF454545)),),
                ],
              ),
              const SizedBox(height: 30,),
              Container(
                padding: const EdgeInsets.all(8),
                height: 50,
                width: 155,
                decoration: BoxDecoration(
                  color: const Color(0xFF2C91FF),
                  borderRadius: BorderRadius.circular(10)
                ),
child: Row(
  // mainAxisAlignment: MainAxisAlignment.start,
  // crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    _itemCount!=0? Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: IconButton(icon: const Icon(Icons.remove,color: Colors.white,),onPressed: ()=>setState(()=>_itemCount--),),
    ):IconButton(icon:  const Icon(Icons.remove,color: Colors.white,),onPressed: (){},),
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
                borderRadius: BorderRadius.circular(3)
            ),
          child: Center(
            child: Text(
              _itemCount.toString(),style: GoogleFonts.plusJakartaSans(
                fontSize: 19,
                fontWeight: FontWeight.w600,
                color: Colors.black),
            ),
          ),
          ),
    // const SizedBox(width: 10,),
    IconButton(icon: const Icon(Icons.add,color: Colors.white,),onPressed: ()=>setState(()=>_itemCount++)),
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
              const SizedBox(height: 10,),
              Text("No Rewards Available",style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF3E3E3E)),),

              // Text(' $_scanBarcode\n',
              //     style: const TextStyle(fontSize: 20))
            ],
          ),
        ),
      ),
    );
  }
}
