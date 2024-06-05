


import 'package:flutter_boiler_plate/src/view/home/controller/estimate_contact_controller.dart';
import 'package:flutter_boiler_plate/src/view/home/controller/estimate_inquiry_controller.dart';
import 'package:flutter_boiler_plate/src/view/home/controller/portfolio_contact_controller.dart';
import 'package:get/get.dart';


getXPutInitializer() {


  Get.put(EstimateInquiryController());
  Get.put(EstimateContactController());
  Get.put(PortFolioContactController());





}
