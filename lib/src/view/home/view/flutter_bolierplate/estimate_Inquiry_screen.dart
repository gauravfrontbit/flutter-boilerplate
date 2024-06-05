import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/global/constants/app_color.dart';
import 'package:flutter_boiler_plate/global/constants/theme/app_text_style.dart';
import 'package:flutter_boiler_plate/src/view/home/controller/estimate_inquiry_controller.dart';
import 'package:get/get.dart';

class EstimateInquirysScreen extends StatefulWidget {
  const EstimateInquirysScreen({super.key});

  @override
  State<EstimateInquirysScreen> createState() => _EstimateInquirysScreenState();
}

class _EstimateInquirysScreenState extends State<EstimateInquirysScreen> {
  final estimateInquiryController = Get.find<EstimateInquiryController>();

  Random color = Random();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await estimateInquiryController.getEstimateInquiryApi();
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Estimate Inquiry"),
          centerTitle: true,
        ),
        body: Obx(() => ListView.builder(
            shrinkWrap: true,
            itemCount: estimateInquiryController.estimateInquiryList.length,
            itemBuilder: (context,index){
              var data = estimateInquiryController.estimateInquiryList[index];
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
                          '${data["company"]}',
                          style:  AppTextStyle.semiBold.copyWith(fontSize: 20,color: AppColor.blue),
                          gradient: const LinearGradient(
                              colors: [
                            AppColor.blue,
                            Colors.black,
                          ]),
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

                  ],),
                ),
              );
            }),),
      ),
    );
  }
}


class GradientText extends StatelessWidget {
  const GradientText(
      this.text, {super.key,
        required this.gradient,
        this.style,
      });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}