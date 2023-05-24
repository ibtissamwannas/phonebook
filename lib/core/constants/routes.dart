import 'package:get/get.dart';
import 'package:phonebook/view/screens/add_contact.dart';
import 'package:phonebook/view/screens/edit_contact.dart';
import 'package:phonebook/view/screens/home.dart';
import 'routes_name.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: "/",
    page: () => const Home(),
  ),
  GetPage(
    name: AppRoutes.addContact,
    page: () => const AddContact(),
  ),
  GetPage(
    name: AppRoutes.editContact,
    page: () => const EditContact(),
  ),
];
