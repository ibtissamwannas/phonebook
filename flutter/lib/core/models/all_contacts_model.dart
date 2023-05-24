class AllContactsInfo {
  final String status;
  final List<Person> data;

  AllContactsInfo({
    required this.status,
    required this.data,
  });

  factory AllContactsInfo.fromJson(Map<String, dynamic> json) {
    return AllContactsInfo(
      status: json['status'],
      data: List<Person>.from(json['data'].map((x) => Person.fromJson(x))),
    );
  }
}

class Person {
  final int id;
  final String firstName;
  final String lastName;
  final int phoneNumber;
  final String email;

  Person({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      phoneNumber: json['phone_number'],
      email: json['email'],
    );
  }
}
