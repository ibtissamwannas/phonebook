import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../core/constants/api_links.dart';
import '../core/constants/routes_name.dart';

abstract class EditContactController extends GetxController {
  editContact();
}

class EditContactControllerImp extends EditContactController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController phoneNumberController;
  late TextEditingController emailController;
  bool isLoading = false;

  @override
  editContact() async {
    var formStateResp = formState.currentState;
    if (formStateResp!.validate()) {
      isLoading = true;
      update();
      var response = await http.post(
        Uri.parse(AppLinkApi.editContacts),
        body: {
          "id": Get.arguments["id"].toString(),
          "firstName": firstNameController.text,
          "lastName": lastNameController.text,
          "phoneNumber": phoneNumberController.text,
          "email": emailController.text,
        },
      );
      isLoading = false;
      update();
      var responseBody = jsonDecode(response.body);
      var status = responseBody["status"];
      if (status == "success") {
        Get.offAllNamed(AppRoutes.home);
      } else {
        var message = responseBody["message"];
        Get.defaultDialog(
          title: "Warning",
          middleText: message,
        );
      }
    }
  }

  @override
  void onInit() {
    firstNameController = TextEditingController(
      text: Get.arguments["firstName"],
    );
    lastNameController = TextEditingController(
      text: Get.arguments["lastName"],
    );
    phoneNumberController = TextEditingController(
      text: Get.arguments["phoneNumber"].toString(),
    );
    emailController = TextEditingController(
      text: Get.arguments["email"],
    );
    super.onInit();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
