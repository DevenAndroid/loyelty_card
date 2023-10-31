import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyelty_card/models/staff_model.dart';
import 'package:loyelty_card/repositories/stafList_repo.dart';
import 'package:loyelty_card/resourses/api_constant.dart';
import 'package:loyelty_card/routers/my_routers.dart';
import 'package:loyelty_card/widgets/circular_progressindicator.dart';
import 'package:loyelty_card/widgets/common_error_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StaffListScreen extends StatefulWidget {
  const StaffListScreen({super.key});

  @override
  State<StaffListScreen> createState() => _StaffListScreenState();
}

class _StaffListScreenState extends State<StaffListScreen> {
  Rx<RxStatus> statusOfStaffList = RxStatus.empty().obs;
  Rx<ModelStaffList> staffList = ModelStaffList().obs;

  staff() {
    getStaffRepo().then((value) async {
      if (value.status!) {
        staffList.value = value;
        statusOfStaffList.value = RxStatus.success();

        showToast(value.message.toString());

        // Get.offAllNamed(MyRouters.loginScreen);
      } else {
        statusOfStaffList.value = RxStatus.error();
        showToast(value.message.toString());
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    staff();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Get.toNamed(MyRouters.loginScreen);
              },
              child: Icon(Icons.arrow_back)),
          title: Text(
            "Staff List",
            style: GoogleFonts.plusJakartaSans(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
        ),
        body: Obx(() {
          return statusOfStaffList.value.isSuccess
              ? ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: staffList.value.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: InkWell(
                          onTap: () async {
                            SharedPreferences pref = await SharedPreferences.getInstance();
                            pref.setString('staffName', staffList.value.data![index].staffName
                                .toString());
                            pref.setString('staffId', staffList.value.data![index].id
                                .toString());
                            Get.offAllNamed(MyRouters.scanCard);
                          },
                          child: Container(
                            padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                    boxShadow: [
                    BoxShadow(
                    color: Colors.grey,
                    offset: Offset(1, 1), //(x,y)
                    blurRadius: 1.1,
                    ),
                    ],
                    color: const Color(0xffFAFAFA),
                    borderRadius: BorderRadius.circular(10)),
                    child:Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    SharedPreferences pref = await SharedPreferences.getInstance();
                                    pref.setString('staffName', staffList.value.data![index].staffName
                                        .toString());
                                    pref.setString('staffId', staffList.value.data![index].id
                                        .toString());
                                    Get.offAllNamed(MyRouters.scanCard);
                                  },
                                  child: Text(
                                      staffList.value.data![index].staffName
                                          .toString(),
                                      style: GoogleFonts.plusJakartaSans(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black)),
                                )
                              ])),
                        ));
                  })
              : statusOfStaffList.value.isError
                  ? CommonErrorWidget(
                      errorText: staffList.value.message.toString(),
                      onTap: () {
                        staff();
                      },
                    )
                  : const CommonProgressIndicator();
        }));
  }
}
