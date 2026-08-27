import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../core/constants/app_routes.dart';
import '../features/registration/presentation/bloc/register_bloc.dart';
import '../features/registration/presentation/pages/step2_education_page.dart';
import '../features/registration/presentation/pages/step3_address_page.dart';
import '../features/registration/presentation/pages/step4_credentials_page.dart';
import '../features/registration/presentation/pages/step5_review_page.dart';
import '../features/splash/presentation/pages/splash_page.dart';
import '../features/auth/presentation/pages/login_page.dart';
import '../features/auth/presentation/bloc/login_bloc.dart';
import '../features/registration/presentation/pages/step1_personal_page.dart';
import '../features/dashboard/presentation/pages/dashboard_page.dart';
import '../features/dashboard/presentation/bloc/dashboard_bloc.dart';
import '../features/dashboard/presentation/bloc/dashboard_event.dart';

// Create a single RegisterBloc instance to persist data across steps
final registerBloc = RegisterBloc();

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => BlocProvider(
        create: (_) => LoginBloc(),
        child: const LoginPage(),
      ),
    ),
    GoRoute(
      path: AppRoutes.register,
      builder: (context, state) => BlocProvider.value(
        value: registerBloc,
        child: const Step1PersonalPage(),
      ),
    ),
    GoRoute(
      path: AppRoutes.dashboard,
      builder: (context, state) => BlocProvider(
        create: (_) => DashboardBloc()..add(const LoadDashboardEvent()),
        child: const DashboardPage(),
      ),
    ),
    GoRoute(
      path: AppRoutes.registerStep2,
      builder: (context, state) => BlocProvider.value(
        value: registerBloc,
        child: const Step2EducationPage(),
      ),
      //   builder: (context, state) => const Step2EducationPage(),
    ),
    GoRoute(
      path: AppRoutes.registerStep3,
      builder: (context, state) => BlocProvider.value(
        value: registerBloc,
        child: const Step3AddressPage(),
      ),
      // builder: (context, state) => const Step3AddressPage(),
    ),
    GoRoute(
      path: AppRoutes.registerStep4,
      builder: (context, state) => BlocProvider.value(
        value: registerBloc,
        child: const Step4CredentialsPage(),
      ),
      //  builder: (context, state) => const Step4CredentialsPage(),
    ),
    GoRoute(
      path: AppRoutes.registerStep5,
      builder: (context, state) => BlocProvider.value(
        value: registerBloc,
        child: const Step5ReviewPage(),
      ),
      //  builder: (context, state) => const Step5ReviewPage(),
    ),
  ],
);
