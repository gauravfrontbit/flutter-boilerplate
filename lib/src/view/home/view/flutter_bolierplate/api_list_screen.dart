import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/global/constants/app_color.dart';
import 'package:flutter_boiler_plate/global/constants/theme/app_text_style.dart';
import 'package:flutter_boiler_plate/src/view/home/view/flutter_bolierplate/estimate_Inquiry_screen.dart';
import 'package:flutter_boiler_plate/src/view/home/view/flutter_bolierplate/estimate_contact_screen.dart';
import 'package:flutter_boiler_plate/src/view/home/view/flutter_bolierplate/portfolio_contact_screen.dart';
import 'package:get/get.dart';

class ApiListScreen extends StatefulWidget {
  const ApiListScreen({super.key});

  @override
  State<ApiListScreen> createState() => _ApiListScreenState();
}

class _ApiListScreenState extends State<ApiListScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(onTap: (){
            Get.to(()=> PortFolioContactScreen());
          },child: Container(height:150,margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),color: AppColor.blue,child: Center(child: Text("PortFolio Contact",style: AppTextStyle.semiBold.copyWith(color: AppColor.white),)))),
          InkWell(
              onTap: (){
                Get.to(()=> EstimateInquirysScreen());
              },
              child: Container(height:150,margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),color: AppColor.red,child: Center(child: Text("Estimate Inquiry",style: AppTextStyle.semiBold.copyWith(color: AppColor.white),)))),
          InkWell(
              onTap: (){
                Get.to(()=> EstimateContactScreen());
              },
              child: Container(height:150,margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),color: AppColor.green,child: Center(child: Text("Estimate Contact",style: AppTextStyle.semiBold.copyWith(color: AppColor.white),)))),
        ],
      ),
    );
  }
}
