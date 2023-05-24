import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:phonebook/core/constants/colors.dart';
import 'package:phonebook/view/widgets/custom_big_text.dart';
import '../../controller/home_controller.dart';
import '../../core/constants/routes_name.dart';
import '../widgets/custom_medium_text.dart';

class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Get.put(HomeControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundGreyColor,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        elevation: 0,
        title: const Text(
          "All Contacts",
          style: TextStyle(color: AppColor.black),
        ),
        centerTitle: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.addContact);
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColor.primaryColor, AppColor.primaryDark],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: GetBuilder<HomeControllerImp>(
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.blue,
              ),
            );
          } else if (controller.allContacts.isEmpty) {
            return Center(
              child: Column(
                children: [
                  Lottie.asset("assets/lottie/no_data.json",
                      width: width * 0.7, height: height * 0.4),
                  const CustomBigText(text: "No Data")
                ],
              ),
            );
          } else {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: CustomMediumText(text: "First Name")),
                    DataColumn(label: CustomMediumText(text: "Last Name")),
                    DataColumn(label: CustomMediumText(text: "Phone Number")),
                    DataColumn(label: CustomMediumText(text: "Email")),
                    DataColumn(label: Text('')),
                  ],
                  rows: controller.allContacts
                      .map(
                        (contact) => DataRow(
                          cells: [
                            DataCell(Text(contact.firstName)),
                            DataCell(Text(contact.lastName)),
                            DataCell(Text(contact.phoneNumber.toString())),
                            DataCell(Text(contact.email)),
                            DataCell(
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.edit,
                                      color: AppColor.primaryColor,
                                    ),
                                    onPressed: () {
                                      controller.editContact(
                                        id: contact.id,
                                        firstName: contact.firstName,
                                        lastName: contact.lastName,
                                        phoneNumber: contact.phoneNumber,
                                        email: contact.email,
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: AppColor.blue,
                                    ),
                                    onPressed: () {
                                      controller.deleteContact(id: contact.id);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
