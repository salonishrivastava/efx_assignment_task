import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/data/datasource/local_data_source.dart';
import '../../../auth/data/models/user_model.dart';
import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  // final AuthRepository repository;

  RegisterBloc() : super(const RegisterState()) {
    on<UpdatePersonalEvent>(_onUpdatePersonal);
    on<UpdateEducationEvent>(_onUpdateEducation);
    on<UpdateAddressEvent>(_onUpdateAddress);
    on<UpdateCredentialsEvent>(_onUpdateCredentials);
    on<SubmitRegistrationEvent>(_onSubmitRegistration);
  }

  void _onUpdatePersonal(
    UpdatePersonalEvent event,
    Emitter<RegisterState> emit,
  ) {
    print("printing............${event.firstName}");
    emit(
      state.copyWith(
        firstName: event.firstName,
        lastName: event.lastName,
        email: event.email,
        gender: event.gender,
        dob: event.dob,
        age: event.age,
        primaryPhone: event.primaryPhone,
        secondaryPhone: event.secondaryPhone,
      ),
    );
  }

  void _onUpdateEducation(
    UpdateEducationEvent event,
    Emitter<RegisterState> emit,
  ) {
    emit(
      state.copyWith(
        qualification: event.qualification,
        institution: event.institution,
        passingYear: event.passingYear,
        occupation: event.occupation,
        experience: event.experience,
      ),
    );
  }

  void _onUpdateAddress(
    UpdateAddressEvent event,
    Emitter<RegisterState> emit,
  ) {
    emit(
      state.copyWith(
        street: event.street,
        landmark: event.landmark,
        city: event.city,
        state: event.state,
        zipCode: event.zipCode,
        country: event.country,
      ),
    );
  }

  void _onUpdateCredentials(
    UpdateCredentialsEvent event,
    Emitter<RegisterState> emit,
  ) {
    emit(
      state.copyWith(
        employeeId: event.employeeId,
        password: event.password,
      ),
    );
  }

  Future<void> _onSubmitRegistration(
    SubmitRegistrationEvent event,
    Emitter<RegisterState> emit,
  ) async {
    await submitRegistration();
  }

  Future<void> submitRegistration() async {
    final user = UserModel(
      firstName: state.firstName,
      lastName: state.lastName,
      email: state.email,
      gender: state.gender,
      dob: state.dob,
      age: state.age,
      primaryPhone: state.primaryPhone,
      secondaryPhone: state.secondaryPhone,
      qualification: state.qualification,
      institution: state.institution,
      passingYear: state.passingYear,
      occupation: state.occupation,
      experience: state.experience,
      street: state.street,
      landmark: state.landmark,
      city: state.city,
      state: state.state,
      zipCode: state.zipCode,
      country: state.country,
      employeeId: state.employeeId,
      password: state.password,
    );
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${state.employeeId}object");
    await AuthLocalDataSource.saveUser(user);
    await AuthLocalDataSource().saveCurrentUser(user.employeeId);
  }
}
