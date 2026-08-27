import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object?> get props => [];
}

/// Step 1
class UpdatePersonalEvent extends RegisterEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final String dob;
  final int age;
  final String primaryPhone;
  final String secondaryPhone;

  const UpdatePersonalEvent({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.dob,
    required this.age,
    required this.primaryPhone,
    required this.secondaryPhone,
  });

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
      ];
}

/// Step 2
class UpdateEducationEvent extends RegisterEvent {
  final String qualification;
  final String institution;
  final String passingYear;
  final String occupation;
  final String experience;

  const UpdateEducationEvent({
    required this.qualification,
    required this.institution,
    required this.passingYear,
    required this.occupation,
    required this.experience,
  });

  @override
  List<Object?> get props => [
        qualification,
        institution,
        passingYear,
        occupation,
        experience,
      ];
}

/// Step 3
class UpdateAddressEvent extends RegisterEvent {
  final String street;
  final String landmark;
  final String city;
  final String state;
  final String zipCode;
  final String country;

  const UpdateAddressEvent({
    required this.street,
    required this.landmark,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.country,
  });

  @override
  List<Object?> get props => [
        street,
        landmark,
        city,
        state,
        zipCode,
        country,
      ];
}

/// Step 4
class UpdateCredentialsEvent extends RegisterEvent {
  final String employeeId;
  final String password;

  const UpdateCredentialsEvent({
    required this.employeeId,
    required this.password,
  });

  @override
  List<Object?> get props => [
        employeeId,
        password,
      ];
}

/// Step 5
class SubmitRegistrationEvent extends RegisterEvent {
  const SubmitRegistrationEvent();
}
