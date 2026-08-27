import 'package:equatable/equatable.dart';

import '../../../auth/data/models/user_model.dart';

enum DashboardStatus { initial, loading, loaded, failure }

class DashboardState extends Equatable {
  final DashboardStatus status;
  final UserModel? user;
  final String? errorMessage;

  const DashboardState({
    this.status = DashboardStatus.initial,
    this.user,
    this.errorMessage,
  });

  DashboardState copyWith({
    DashboardStatus? status,
    UserModel? user,
    String? errorMessage,
  }) {
    return DashboardState(
      status: status ?? this.status,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, user, errorMessage];
}
