import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../core/constants/api_links.dart';
import '../core/constants/routes_name.dart';

abstract class AddContactController extends GetxController {
  addContact();
}

class AddContactControllerImp extends AddContactController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController phoneNumber;
  late TextEditingController email;
  bool isLoading = false;

  @override
  addContact() async {
    try {
      var formStateResp = formState.currentState;
      if (formStateResp!.validate()) {
        isLoading = true;
        update();
        var data = {
          "firstName": firstName.text,
          "lastName": lastName.text,
          "phoneNumber": phoneNumber.text,
          "email": email.text,
        };
        var response = await http.post(
          Uri.parse(AppLinkApi.addContacts),
          body: data,
        );
        isLoading = false;
        update();
        var responseBody = jsonDecode(response.body);
        if (responseBody["status"] == "success") {
          Get.offAllNamed(AppRoutes.home);
        } else {
          var messages = responseBody["message"];
          Get.defaultDialog(
            title: "Warning",
            middleText: messages,
          );
        }
        update();
      }
    } catch (e) {
      // print('$e');
    }
  }

  @override
  void onInit() {
    firstName = TextEditingController();
    lastName = TextEditingController();
    phoneNumber = TextEditingController();
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    phoneNumber.dispose();
    email.dispose();
    super.dispose();
  }
}
