import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_equifax_assignment/features/registration/presentation/bloc/register_state.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_routes.dart';
import '../../../../core/utils/validators.dart';
import '../bloc/register_bloc.dart';
import '../bloc/register_event.dart';

class Step1PersonalPage extends StatefulWidget {
  const Step1PersonalPage({super.key});

  @override
  State<Step1PersonalPage> createState() => _Step1PersonalPageState();
}

class _Step1PersonalPageState extends State<Step1PersonalPage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final primaryPhoneController = TextEditingController();
  final secondaryPhoneController = TextEditingController();
  final dobController = TextEditingController();
  final ageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String gender = 'Male';
  DateTime? selectedDate;
  int? age;

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      final today = DateTime.now();

      int calculatedAge = today.year - pickedDate.year;

      if (today.month < pickedDate.month ||
          (today.month == pickedDate.month && today.day < pickedDate.day)) {
        calculatedAge--;
      }

      setState(() {
        selectedDate = pickedDate;
        age = calculatedAge;
        ageController.text = age.toString();
        dobController.text =
            "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Step 1 of 5"),
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
                  value: 0.2,
                  minHeight: 8,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                const SizedBox(height: 25),
                const Text(
                  "Personal Information",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Complete your basic details",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 25),
                TextFormField(
                  controller: firstNameController,
                  validator: (value) => Validators.validateName(
                    value,
                    fieldName: "First Name",
                  ),
                  decoration: const InputDecoration(
                    labelText: "First Name",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 18),
                TextFormField(
                  controller: lastNameController,
                  validator: (value) => Validators.validateName(
                    value,
                    fieldName: "Last Name",
                  ),
                  decoration: const InputDecoration(
                    labelText: "Last Name",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 18),
                TextFormField(
                  controller: emailController,
                  validator: Validators.validateEmail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "Email Address",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 22),
                const Text(
                  "Gender",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: ChoiceChip(
                        label: const Text("Male"),
                        selected: gender == "Male",
                        onSelected: (value) {
                          setState(() {
                            gender = "Male";
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ChoiceChip(
                        label: const Text("Female"),
                        selected: gender == "Female",
                        onSelected: (value) {
                          setState(() {
                            gender = "Female";
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 22),
                // TextField(
                //   readOnly: true,
                //   decoration: InputDecoration(
                //     labelText: "Date of Birth",
                //     border: const OutlineInputBorder(),
                //     suffixIcon: Icon(Icons.calendar_month),
                //   ),
                // ),
                // const SizedBox(height: 18),
                TextFormField(
                  readOnly: true,
                  controller: dobController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Date of Birth is required";
                    }
                    return null;
                  },
                  onTap: _selectDate,
                  decoration: InputDecoration(
                    labelText: "Date of Birth",
                    border: const OutlineInputBorder(),
                    suffixIcon: const Icon(Icons.calendar_today),
                    hintText: selectedDate == null
                        ? "Select Date"
                        : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                  ),
                ),
                const SizedBox(height: 18),
                TextField(
                  controller: ageController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: "Age",
                    border: const OutlineInputBorder(),
                    hintText: age == null ? "Auto Calculated" : "$age Years",
                  ),
                ),
                const SizedBox(height: 18),
                TextFormField(
                  controller: primaryPhoneController,
                  validator: Validators.validatePhone,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    prefixText: "+91 ",
                    labelText: "Primary Phone",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 18),
                TextField(
                  controller: secondaryPhoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    prefixText: "+91 ",
                    labelText: "Secondary Phone (Optional)",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 35),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<RegisterBloc>().add(
                                  UpdatePersonalEvent(
                                    firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                    email: emailController.text,
                                    gender: gender,
                                    dob: dobController.text,
                                    age: int.tryParse(ageController.text) ?? 0,
                                    primaryPhone: primaryPhoneController.text,
                                    secondaryPhone:
                                        secondaryPhoneController.text,
                                  ),
                                );

                            context.push(AppRoutes.registerStep2);
                            //   context.push(AppRoutes.registerStep2);
                          }
                        },
                        child: const Text(
                          "Next",
                          style: TextStyle(fontSize: 16),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
