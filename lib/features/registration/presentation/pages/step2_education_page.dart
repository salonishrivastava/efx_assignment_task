import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/constants/app_routes.dart';
import '../bloc/register_bloc.dart';
import '../bloc/register_event.dart';
import '../bloc/register_state.dart';

class Step2EducationPage extends StatefulWidget {
  const Step2EducationPage({super.key});

  @override
  State<Step2EducationPage> createState() => _Step2EducationPageState();
}

class _Step2EducationPageState extends State<Step2EducationPage> {
  final qualificationController = TextEditingController();
  final institutionController = TextEditingController();
  final occupationController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String? selectedYear;
  String? selectedExperience;

  final List<String> years = List.generate(
    30,
    (index) => (DateTime.now().year - index).toString(),
  );

  final List<String> experienceList = [
    'Fresher',
    '1 Year',
    '2 Years',
    '3 Years',
    '4 Years',
    '5+ Years',
  ];

  @override
  void dispose() {
    qualificationController.dispose();
    institutionController.dispose();
    occupationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Step 2 of 5'),
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
                  value: 0.4,
                  minHeight: 8,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  'Education & Work',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Tell us about your education and profession.',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 25),
                TextFormField(
                  controller: qualificationController,
                  validator: (value) => Validators.requiredField(
                    value,
                    fieldName: "Highest Qualification",
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Highest Qualification',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 18),
                TextFormField(
                  controller: institutionController,
                  validator: (value) => Validators.requiredField(
                    value,
                    fieldName: "Institution",
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Institution / University',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 18),
                DropdownButtonFormField<String>(
                  value: selectedYear,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Passing Year is required";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Passing Year',
                    border: OutlineInputBorder(),
                  ),
                  items: years
                      .map(
                        (year) => DropdownMenuItem(
                          value: year,
                          child: Text(year),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedYear = value;
                    });
                  },
                ),
                const SizedBox(height: 18),
                TextFormField(
                  controller: occupationController,
                  validator: (value) => Validators.requiredField(
                    value,
                    fieldName: "Occupation",
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Occupation',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 18),
                DropdownButtonFormField<String>(
                  value: selectedExperience,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Experience is required";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Experience',
                    border: OutlineInputBorder(),
                  ),
                  items: experienceList
                      .map(
                        (exp) => DropdownMenuItem(
                          value: exp,
                          child: Text(exp),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedExperience = value;
                    });
                  },
                ),
                const SizedBox(height: 35),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size.fromHeight(55),
                        ),
                        child: const Text('Back'),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(child: BlocBuilder<RegisterBloc, RegisterState>(
                        builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<RegisterBloc>().add(
                                  UpdateEducationEvent(
                                    qualification: qualificationController.text,
                                    institution: institutionController.text,
                                    passingYear: selectedYear!,
                                    occupation: occupationController.text,
                                    experience: selectedExperience!,
                                  ),
                                );
                            context.push(AppRoutes.registerStep3);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(55),
                        ),
                        child: const Text('Next'),
                      );
                    })),
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
