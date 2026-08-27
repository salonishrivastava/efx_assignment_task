import 'package:equatable/equatable.dart';

class RegisterState extends Equatable {
  // Step 1
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final String dob;
  final int age;
  final String primaryPhone;
  final String secondaryPhone;

  // Step 2
  final String qualification;
  final String institution;
  final String passingYear;
  final String occupation;
  final String experience;

  // Step 3
  final String street;
  final String landmark;
  final String city;
  final String state;
  final String zipCode;
  final String country;

  // Step 4
  final String employeeId;
  final String password;

  const RegisterState({
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.gender = '',
    this.dob = '',
    this.age = 0,
    this.primaryPhone = '',
    this.secondaryPhone = '',
    this.qualification = '',
    this.institution = '',
    this.passingYear = '',
    this.occupation = '',
    this.experience = '',
    this.street = '',
    this.landmark = '',
    this.city = '',
    this.state = '',
    this.zipCode = '',
    this.country = 'India',
    this.employeeId = '',
    this.password = '',
  });

  RegisterState copyWith({
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
    return RegisterState(
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

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        gender,
        dob,
        age,
        primaryPhone,
        secondaryPhone,
        qualification,
        institution,
        passingYear,
        occupation,
        experience,
        street,
        landmark,
        city,
        state,
        zipCode,
        country,
        employeeId,
        password,
      ];
}
