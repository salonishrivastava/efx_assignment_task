import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/constants/app_routes.dart';
import '../bloc/register_bloc.dart';
import '../bloc/register_event.dart';
import '../bloc/register_state.dart';

class Step3AddressPage extends StatefulWidget {
  const Step3AddressPage({super.key});

  @override
  State<Step3AddressPage> createState() => _Step3AddressPageState();
}

class _Step3AddressPageState extends State<Step3AddressPage> {
  final streetController = TextEditingController();
  final landmarkController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final zipController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    streetController.dispose();
    landmarkController.dispose();
    cityController.dispose();
    stateController.dispose();
    zipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Step 3 of 5'),
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
                  value: 0.6,
                  minHeight: 8,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  'Address Details',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Provide your residential address.',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 25),
                TextFormField(
                  controller: streetController,
                  maxLines: 3,
                  validator: (value) => Validators.requiredField(
                    value,
                    fieldName: "Street Address",
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Street Address',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 18),
                TextFormField(
                  controller: landmarkController,
                  decoration: const InputDecoration(
                    labelText: 'Landmark (Optional)',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 18),
                TextFormField(
                  controller: cityController,
                  validator: (value) => Validators.requiredField(
                    value,
                    fieldName: "City",
                  ),
                  decoration: const InputDecoration(
                    labelText: 'City',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 18),
                TextFormField(
                  controller: stateController,
                  validator: (value) => Validators.requiredField(
                    value,
                    fieldName: "State",
                  ),
                  decoration: const InputDecoration(
                    labelText: 'State',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 18),
                TextFormField(
                  controller: zipController,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  validator: Validators.validateZipCode,
                  decoration: const InputDecoration(
                    labelText: 'Zip Code',
                    border: OutlineInputBorder(),
                    counterText: '',
                  ),
                ),
                const SizedBox(height: 18),
                TextFormField(
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: 'Country',
                    border: OutlineInputBorder(),
                    hintText: 'India',
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
                        child: const Text('Back'),
                      ),
                    ),
                    const SizedBox(width: 15),
                    BlocBuilder<RegisterBloc, RegisterState>(
                        builder: (context, state) {
                      return Expanded(
                          child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<RegisterBloc>().add(
                                  UpdateAddressEvent(
                                    street: streetController.text,
                                    landmark: landmarkController.text,
                                    city: cityController.text,
                                    state: stateController.text,
                                    zipCode: zipController.text,
                                    country: "India",
                                  ),
                                );
                            context.push(AppRoutes.registerStep4);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(55),
                        ),
                        child: const Text('Next'),
                      ));
                    }),
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
