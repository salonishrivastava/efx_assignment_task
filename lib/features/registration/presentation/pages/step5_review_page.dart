import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_routes.dart';
import '../bloc/register_bloc.dart';
import '../bloc/register_event.dart';
import '../bloc/register_state.dart';

class Step5ReviewPage extends StatelessWidget {
  const Step5ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Step 5 of 5"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: BlocBuilder<RegisterBloc, RegisterState>(
                builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LinearProgressIndicator(
                    value: 1.0,
                    minHeight: 8,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    "Review & Submit",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Please verify your information before submitting.",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 25),
                  _buildSection(
                    title: "Personal Information",
                    children: [
                      _InfoTile("First Name", state.firstName),
                      _InfoTile("Last Name", state.lastName),
                      _InfoTile("Email", state.email),
                      _InfoTile("Gender", state.gender),
                      _InfoTile("DOB", state.dob),
                      _InfoTile("Age", "${state.age} Years"),
                      _InfoTile("Primary Phone", state.primaryPhone),
                      _InfoTile("Secondary Phone", state.secondaryPhone),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildSection(
                    title: "Education & Work",
                    children: [
                      _InfoTile("Qualification", state.qualification),
                      _InfoTile("Institution", state.institution),
                      _InfoTile("Passing Year", state.passingYear),
                      _InfoTile("Occupation", state.occupation),
                      _InfoTile("Experience", state.experience),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildSection(
                    title: "Address",
                    children: [
                      _InfoTile("Street", state.street),
                      _InfoTile("Landmark", state.landmark),
                      _InfoTile("City", state.city),
                      _InfoTile("State", state.state),
                      _InfoTile("Zip Code", state.zipCode),
                      _InfoTile("Country", state.country),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildSection(
                    title: "Account",
                    children: [
                      _InfoTile("Employee ID", state.employeeId),
                      _InfoTile("Password", "********"),
                    ],
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
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<RegisterBloc>().add(
                                  const SubmitRegistrationEvent(),
                                );
                            context.go(AppRoutes.dashboard);
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(55),
                          ),
                          child: const Text("Submit"),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            })),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> children,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // const Icon(
                //   Icons.edit,
                //   size: 20,
                // ),
              ],
            ),
            const Divider(height: 25),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final String title;
  final String value;

  const _InfoTile(
    this.title,
    this.value,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
