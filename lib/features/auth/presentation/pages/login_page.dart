import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/primary_button.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      context.read<LoginBloc>().add(
            LoginSubmitted(
              login: _loginController.text.trim(),
              password: _passwordController.text,
            ),
          );
    }
  }

  @override
  void initState() {
    super.initState();
    print("object-------------------------------------------1");
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.status == LoginStatus.success) {
            context.go(AppRoutes.dashboard);
          } else if (state.status == LoginStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage ?? 'Login failed.')),
            );
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Icon(
                        Icons.home,
                        size: 90,
                        color: AppColors.primary,
                      ),
                      const SizedBox(height: 30),
                      Text(
                        'Welcome Back',
                        style: AppTextStyles.heading,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Sign in to continue',
                        style: AppTextStyles.subHeading,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      CustomTextField(
                        controller: _loginController,
                        hintText: 'Employee ID / Email',
                        validator: (value) {
                          final text = value?.trim() ?? '';

                          if (text.contains('@')) {
                            return Validators.validateEmail(text);
                          }

                          return Validators.validateEmployeeId(text);
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: 'Password',
                        obscureText: _obscurePassword,
                        validator: Validators.validatePassword,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return PrimaryButton(
                            text: state.status == LoginStatus.loading
                                ? 'Signing In...'
                                : 'Sign In',
                            onPressed: state.status == LoginStatus.loading
                                ? null
                                : _login,
                          );
                        },
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: const [
                          Expanded(child: Divider()),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text("OR"),
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      const SizedBox(height: 24),
                      TextButton(
                        onPressed: () {
                          context.push(AppRoutes.register);
                        },
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 15,
                            ),
                            children: [
                              TextSpan(text: "Don't have an account? "),
                              TextSpan(
                                text: "Register",
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
