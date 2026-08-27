import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/datasource/local_data_source.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthLocalDataSource _localDataSource;

  LoginBloc({AuthLocalDataSource? localDataSource})
      : _localDataSource = localDataSource ?? AuthLocalDataSource(),
        super(const LoginState()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: LoginStatus.loading));

    try {
      final users = await _localDataSource.getUsers();
      final matches = users.where(
        (user) =>
            (user.employeeId == event.login || user.email == event.login) &&
            user.password == event.password,
      );

      if (matches.isEmpty) {
        emit(
          state.copyWith(
            status: LoginStatus.failure,
            errorMessage: 'Invalid employee ID/email or password.',
          ),
        );
        return;
      }

      await _localDataSource.saveCurrentUser(matches.first.employeeId);
      emit(state.copyWith(status: LoginStatus.success));
    } catch (_) {
      emit(
        state.copyWith(
          status: LoginStatus.failure,
          errorMessage: 'Unable to sign in. Please try again.',
        ),
      );
    }
  }
}
