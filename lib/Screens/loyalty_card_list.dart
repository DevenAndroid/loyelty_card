import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyelty_card/routers/my_routers.dart';
import 'package:loyelty_card/widgets/common_button.dart';

import '../Controller/loyalty_list_controller.dart';

class LoyaltyCardListScreen extends StatefulWidget {
  const LoyaltyCardListScreen({super.key});
  static var loyaltyCardListScreen = '/loyaltyCardListScreen';
  @override
  State<LoyaltyCardListScreen> createState() => _LoyaltyCardListScreenState();
}

class _LoyaltyCardListScreenState extends State<LoyaltyCardListScreen> {
  final controller = Get.put(LoyaltyListController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getData();
  }
  @override
  Widget build(BuildContext context) {
    return  Obx(() {
      return Scaffold(
          appBar: backAppBar(title: 'Loyalty Card List', context: context),
        body:  SingleChildScrollView(
          
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  controller.isDataLoading.value && controller.model.value.data != null ?
                  SingleChildScrollView(
                    child: ListView.builder(
                      
                        itemCount: controller.model.value.data!.length,
                        shrinkWrap: true,
         physics:  NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context,int index){
                          return  Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: InkWell(
                                  onTap: (){
                                    Get.toNamed(MyRouters.qrCodeList);
                                  },
                                  child: Container(
                                   height: 120 ,
                                   padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(color: Color(0xFF2C91FF),borderRadius: BorderRadius.circular(10)),
                                    child: Row(
                                      children: [

                                        ClipRRect(
                                           borderRadius: BorderRadius.all(Radius.circular(6)),
                                          child: Container(
                                            decoration: BoxDecoration(color: Colors.white),
                                            child: CachedNetworkImage(
                                              imageUrl: (controller.model.value.data![index].businessLogo ?? "").toString(),
                                              height: 110,
                                              width: 110,
                                              errorWidget: (_, __, ___) => Image.asset(
                                                'assets/images/profile.png',
                                                fit: BoxFit.cover,
                                                height: 110,
                                                width: 110,
                                              ),
                                              placeholder: (_, __) => const SizedBox(),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 30,),
                                        Expanded(
                                          child: Text(controller.model.value.data![index].businessName.toString().capitalizeFirst.toString(),style: GoogleFonts.playball(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white
                                          ),),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        }),
                  ): const Center(child: CircularProgressIndicator())
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
