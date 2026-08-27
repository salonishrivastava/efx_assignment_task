class UserModel {
  // Step 1 - Personal
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final String dob;
  final int age;
  final String primaryPhone;
  final String secondaryPhone;

  // Step 2 - Education
  final String qualification;
  final String institution;
  final String passingYear;
  final String occupation;
  final String experience;

  // Step 3 - Address
  final String street;
  final String landmark;
  final String city;
  final String state;
  final String zipCode;
  final String country;

  // Step 4 - Credentials
  final String employeeId;
  final String password;

  const UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.dob,
    required this.age,
    required this.primaryPhone,
    required this.secondaryPhone,
    required this.qualification,
    required this.institution,
    required this.passingYear,
    required this.occupation,
    required this.experience,
    required this.street,
    required this.landmark,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.country,
    required this.employeeId,
    required this.password,
  });

  UserModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? gender,
    String? dob,
    int? age,
    String? primaryPhone,
    String? secondaryPhone,
    String? qualification,
    String? institution,
    String? passingYear,
    String? occupation,
    String? experience,
    String? street,
    String? landmark,
    String? city,
    String? state,
    String? zipCode,
    String? country,
    String? employeeId,
    String? password,
  }) {
    return UserModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      dob: dob ?? this.dob,
      age: age ?? this.age,
      primaryPhone: primaryPhone ?? this.primaryPhone,
      secondaryPhone: secondaryPhone ?? this.secondaryPhone,
      qualification: qualification ?? this.qualification,
      institution: institution ?? this.institution,
      passingYear: passingYear ?? this.passingYear,
      occupation: occupation ?? this.occupation,
      experience: experience ?? this.experience,
      street: street ?? this.street,
      landmark: landmark ?? this.landmark,
      city: city ?? this.city,
      state: state ?? this.state,
      zipCode: zipCode ?? this.zipCode,
      country: country ?? this.country,
      employeeId: employeeId ?? this.employeeId,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "gender": gender,
      "dob": dob,
      "age": age,
      "primaryPhone": primaryPhone,
      "secondaryPhone": secondaryPhone,
      "qualification": qualification,
      "institution": institution,
      "passingYear": passingYear,
      "occupation": occupation,
      "experience": experience,
      "street": street,
      "landmark": landmark,
      "city": city,
      "state": state,
      "zipCode": zipCode,
      "country": country,
      "employeeId": employeeId,
      "password": password,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json["firstName"] ?? "",
      lastName: json["lastName"] ?? "",
      email: json["email"] ?? "",
      gender: json["gender"] ?? "",
      dob: json["dob"] ?? "",
      age: json["age"] ?? 0,
      primaryPhone: json["primaryPhone"] ?? "",
      secondaryPhone: json["secondaryPhone"] ?? "",
      qualification: json["qualification"] ?? "",
      institution: json["institution"] ?? "",
      passingYear: json["passingYear"] ?? "",
      occupation: json["occupation"] ?? "",
      experience: json["experience"] ?? "",
      street: json["street"] ?? "",
      landmark: json["landmark"] ?? "",
      city: json["city"] ?? "",
      state: json["state"] ?? "",
      zipCode: json["zipCode"] ?? "",
      country: json["country"] ?? "India",
      employeeId: json["employeeId"] ?? "",
      password: json["password"] ?? "",
    );
  }
}


//So far, I have created the Git repository
// and pushed the initial project setup to the development branch. 
//I completed the application structure i mean clean architecture, configured GoRouter for navigation,
// and implemented the UI for the splash screen, login screen, multi-step registration flow,
// and dashboard. I also added form validations for the registration and login screens. 
//Currently,  creating the UserModel and will next implement 
//local data persistence using SharedPreferences, followed by the BLoC architecture." 
//todays work i will push 
// after meeting im just sharing the repo url you can check activity