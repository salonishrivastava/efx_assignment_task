import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/constants/app_routes.dart';
import '../bloc/register_bloc.dart';
import '../bloc/register_event.dart';
import '../bloc/register_state.dart';

class Step4CredentialsPage extends StatefulWidget {
  const Step4CredentialsPage({super.key});

  @override
  State<Step4CredentialsPage> createState() => _Step4CredentialsPageState();
}

class _Step4CredentialsPageState extends State<Step4CredentialsPage> {
  final employeeIdController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool hidePassword = true;
  bool hideConfirmPassword = true;

  @override
  void dispose() {
    employeeIdController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Step 4 of 5"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LinearProgressIndicator(
                  value: 0.8,
                  minHeight: 8,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  "Account Credentials",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Create your login credentials.",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 25),
                TextFormField(
                  controller: employeeIdController,
                  validator: Validators.validateEmployeeId,
                  decoration: const InputDecoration(
                    labelText: "Employee ID / Login ID",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 18),
                TextFormField(
                  controller: passwordController,
                  obscureText: hidePassword,
                  validator: Validators.validatePassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                      icon: Icon(
                        hidePassword ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Password Strength",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                const LinearProgressIndicator(
                  value: 0.7,
                  minHeight: 8,
                ),
                const SizedBox(height: 15),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("✓ At least 8 characters"),
                    SizedBox(height: 5),
                    Text("✓ One uppercase letter"),
                    SizedBox(height: 5),
                    Text("✓ One lowercase letter"),
                    SizedBox(height: 5),
                    Text("✓ One number"),
                    SizedBox(height: 5),
                    Text("✓ One special character"),
                  ],
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: confirmPasswordController,
                  obscureText: hideConfirmPassword,
                  validator: (value) => Validators.validateConfirmPassword(
                    passwordController.text,
                    value,
                  ),
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          hideConfirmPassword = !hideConfirmPassword;
                        });
                      },
                      icon: Icon(
                        hideConfirmPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          context.pop();
                        },
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size.fromHeight(55),
                        ),
                        child: const Text("Back"),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: BlocBuilder<RegisterBloc, RegisterState>(
                          builder: (context, state) {
                        return ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<RegisterBloc>().add(
                                    UpdateCredentialsEvent(
                                      employeeId:
                                          employeeIdController.text.trim(),
                                      password: passwordController.text,
                                    ),
                                  );

                              context.push(AppRoutes.registerStep5);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(55),
                          ),
                          child: const Text("Next"),
                        );
                      }),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
