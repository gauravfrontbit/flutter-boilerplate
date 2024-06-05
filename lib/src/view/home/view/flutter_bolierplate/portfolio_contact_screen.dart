import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/global/constants/app_color.dart';
import 'package:flutter_boiler_plate/global/constants/theme/app_text_style.dart';
import 'package:flutter_boiler_plate/src/view/home/controller/portfolio_contact_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PortFolioContactScreen extends StatefulWidget {
  const PortFolioContactScreen({super.key});

  @override
  State<PortFolioContactScreen> createState() => _PortFolioContactScreenState();
}

class _PortFolioContactScreenState extends State<PortFolioContactScreen> {
  final portFolioContactController = Get.find<PortFolioContactController>();

  Random color = Random();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await portFolioContactController.getPortFolioContactApi();
    });
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("PortFolio Contact"),
          centerTitle: true,
        ),
        body: Obx(
          () => ListView.builder(
              shrinkWrap: true,
              itemCount: portFolioContactController.portFolioContactList.length,
              itemBuilder: (context, index) {
                var data = portFolioContactController.portFolioContactList[index];
                return Card(
                  elevation: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.primaries[
                                color.nextInt(Colors.primaries.length)],
                            child: Text(
                              "${data["name"][0].toUpperCase()}",
                              style: AppTextStyle.semiBold
                                  .copyWith(fontSize: 15, color: AppColor.white),
                            ),
                          ),
                          title: Text(
                            "${data["name"]}",
                            style: AppTextStyle.semiBold
                                .copyWith(fontSize: 15, color: AppColor.black),
                          ),
                          subtitle: Text("${data["email"]}"),
                          trailing: Text("${data["created_at"]}"),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
