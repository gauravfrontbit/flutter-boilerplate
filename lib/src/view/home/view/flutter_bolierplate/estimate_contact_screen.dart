import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/global/constants/app_color.dart';
import 'package:flutter_boiler_plate/global/constants/theme/app_text_style.dart';
import 'package:flutter_boiler_plate/src/view/home/controller/estimate_contact_controller.dart';
import 'package:flutter_boiler_plate/src/view/home/view/flutter_bolierplate/estimate_Inquiry_screen.dart';
import 'package:get/get.dart';

class EstimateContactScreen extends StatefulWidget {
  const EstimateContactScreen({super.key});

  @override
  State<EstimateContactScreen> createState() => _EstimateContactScreenState();
}

class _EstimateContactScreenState extends State<EstimateContactScreen> {
  final estimateContactController = Get.find<EstimateContactController>();

  Random color = Random();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await estimateContactController.getEstimateContactApi();
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Estimate Contact"),
          centerTitle: true,
        ),
        body: Obx(() => ListView.builder(
            shrinkWrap: true,
            itemCount: estimateContactController.estimateContactList.length,
            itemBuilder: (context,index){
              var data = estimateContactController.estimateContactList[index];
              return Card(
                elevation: 10,
                margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10.0),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5.0,),
                      Center(
                        child: GradientText(
                          '${data["country"]}',
                          style:  AppTextStyle.semiBold.copyWith(fontSize: 20,color: AppColor.blue),
                          gradient: const LinearGradient(
                              colors: [
                                Colors.blue,
                                Colors.pink,
                              ]
                          ),
                        ),
                      ),
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
                        trailing: Text("mobile: \n${data["phone"]}"),
                      ),
                      Center(child: Text("${data["budget"]}",style: AppTextStyle.semiBold.copyWith(fontSize: 15,color: AppColor.green),)),
                    ],),
                ),
              );
            }),),
      ),
    );
  }
}
