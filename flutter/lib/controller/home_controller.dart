import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:phonebook/core/constants/api_links.dart';
import 'package:phonebook/core/constants/routes_name.dart';
import '../core/models/all_contacts_model.dart';

abstract class HomeController extends GetxController {
  getAllContacts();
  editContact();
  deleteContact();
}

class HomeControllerImp extends HomeController {
  List allContacts = [];
  bool isLoading = false;

  @override
  getAllContacts() async {
    try {
      isLoading = true;
      update();
      final response = await http.get(
        Uri.parse(
          AppLinkApi.viewContacts,
        ),
      );
      isLoading = false;
      update();
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final allContactsInfo = AllContactsInfo.fromJson(jsonData);
        allContacts.addAll(allContactsInfo.data);
        update();
      }
    } catch (e) {
      // print('$e');
    }
  }

  @override
  void onInit() {
    getAllContacts();
    super.onInit();
  }

  @override
  deleteContact({int id = 0}) async {
    try {
      final response = await http.post(Uri.parse(AppLinkApi.deleteContacts),
          body: {"id": id.toString()});
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        if (responseBody["status"] == "success") {
          allContacts.clear();
          getAllContacts();
        }
        update();
      }
    } catch (e) {
      // print("$e");
    }
  }

  @override
  editContact(
      {int id = 0,
      String firstName = "",
      String lastName = "",
      int phoneNumber = 0,
      String email = ""}) {
    Get.toNamed(AppRoutes.editContact, arguments: {
      "id": id,
      "firstName": firstName,
      "lastName": lastName,
      "phoneNumber": phoneNumber,
      "email": email
    });
  }
}
