import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phonebook/view/widgets/custom_button.dart';
import 'package:phonebook/view/widgets/custom_text_form_field.dart';
import 'package:phonebook/view/widgets/custom_medium_text.dart';
import '../../controller/add_contact_controller.dart';
import '../../core/constants/colors.dart';
import '../../core/functions/valid_input.dart';

class AddContact extends StatelessWidget {
  const AddContact({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddContactControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundGreyColor,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        elevation: 0,
        title: const Text(
          "Add Contact",
          style: TextStyle(color: AppColor.black),
        ),
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Platform.isIOS ? Icons.arrow_back_ios_new : Icons.arrow_back,
            color: AppColor.black,
          ),
        ),
      ),
      body: GetBuilder<AddContactControllerImp>(builder: (controller) {
        if (controller.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColor.blue,
            ),
          );
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: controller.formState,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomMediumText(
                      text: "First Name",
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextFormField(
                      myController: controller.firstName,
                      hintText: "john",
                      isNumber: false,
                      validator: (val) {
                        return validInput(
                          val,
                          3,
                          20,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomMediumText(
                      text: "Last Name",
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextFormField(
                      myController: controller.lastName,
                      hintText: "smith",
                      isNumber: false,
                      validator: (val) {
                        return validInput(
                          val,
                          3,
                          20,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomMediumText(
                      text: "Phone Number",
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextFormField(
                      myController: controller.phoneNumber,
                      hintText: "71116962",
                      isNumber: false,
                      validator: (val) {
                        return validInput(
                          val,
                          8,
                          20,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomMediumText(
                      text: "Email",
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextFormField(
                      myController: controller.email,
                      hintText: "example@gmail.com",
                      isNumber: false,
                      validator: (val) {
                        return validInput(
                          val,
                          10,
                          100,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomTextButton(
                      text: "Create",
                      onPressed: () => controller.addContact(),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      }),
    );
  }
}
