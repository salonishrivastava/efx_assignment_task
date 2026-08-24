import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_routes.dart';

class Step1PersonalPage extends StatelessWidget {
  const Step1PersonalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Step 1'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.go(AppRoutes.dashboard);
          },
          child: const Text('Finish'),
        ),
      ),
    );
  }
}
