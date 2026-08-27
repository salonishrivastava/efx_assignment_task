import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/data/datasource/local_data_source.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final AuthLocalDataSource _localDataSource;

  DashboardBloc({AuthLocalDataSource? localDataSource})
      : _localDataSource = localDataSource ?? AuthLocalDataSource(),
        super(const DashboardState()) {
    on<LoadDashboardEvent>(_onLoadDashboard);
  }

  Future<void> _onLoadDashboard(
    LoadDashboardEvent event,
    Emitter<DashboardState> emit,
  ) async {
    emit(state.copyWith(status: DashboardStatus.loading));

    try {
      final employeeId = await _localDataSource.getCurrentUser();
      final users = await _localDataSource.getUsers();
      final matches = users.where(
        (candidate) => candidate.employeeId == employeeId,
      );

      if (matches.isEmpty) {
        emit(
          state.copyWith(
            status: DashboardStatus.failure,
            errorMessage: 'No signed-in user was found.',
          ),
        );
        return;
      }

      emit(state.copyWith(status: DashboardStatus.loaded, user: matches.first));
    } catch (_) {
      emit(
        state.copyWith(
          status: DashboardStatus.failure,
          errorMessage: 'Unable to load profile data.',
        ),
      );
    }
  }
}
