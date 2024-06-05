import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/global/constants/api_string.dart';
import 'package:flutter_boiler_plate/global/utils/services/network_http.dart';
import 'package:flutter_boiler_plate/global/widgets/loading_dialog.dart';
import 'package:flutter_boiler_plate/global/widgets/snackbar.dart';
import 'package:get/get.dart';

class EstimateContactController extends GetxController{

  RxList estimateContactList = [].obs;

  getEstimateContactApi() async {
    try {
      showLoadingDialog();
      await HttpHandler.getHttpMethod(
        url: ApiString.getEstimateContactList,
        successCallBack: (p0, p1) async {

          estimateContactList.value = p1;

          log("Contact >>>>>>>><<<<<<< ${p1}");
          hideLoadingDialog();

        },

        failureCallBack: (p0, p1) {
          hideLoadingDialog();
          showSnackbar(title: "Warning", message: "No Data Found");
        },
      );
    } catch (e, s) {
      debugPrint("Login Error -- $e  $s");
    }
  }

  void showSnackbar({required String title, required String message}) {}

}