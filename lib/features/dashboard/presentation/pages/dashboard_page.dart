import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../auth/data/datasource/local_data_source.dart';
import '../../../auth/data/models/user_model.dart';
import '../bloc/dashboard_bloc.dart';
import '../bloc/dashboard_state.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dashboard",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: "Logout",
            icon: const Icon(
              Icons.logout_rounded,
              color: Colors.black,
            ),
            onPressed: () async {
              await AuthLocalDataSource().logout();
              context.go(AppRoutes.login);
            },
          ),
        ],
      ),
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          if (state.status == DashboardStatus.loading ||
              state.status == DashboardStatus.initial) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == DashboardStatus.failure || state.user == null) {
            return Center(child: Text(state.errorMessage ?? 'No user data.'));
          }

          return currentIndex == 0
              ? HomePage(user: state.user!)
              : ProfilePage(user: state.user!);
        },
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        backgroundColor: AppColors.secondary,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final UserModel user;

  const HomePage({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Card(
            elevation: 3,
            child: ListTile(
              leading: const CircleAvatar(
                radius: 25,
                child: Icon(Icons.person),
              ),
              title: Text(
                "Welcome, ${user.firstName} ${user.lastName}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(user.occupation),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: _buildCard(
                  "Profile",
                  Icons.person,
                  "Completed",
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: _buildCard(
                  "Status",
                  Icons.check_circle,
                  "Active",
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: _buildCard(
                  "Experience",
                  Icons.work,
                  user.experience,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: _buildCard(
                  "Location",
                  Icons.location_on,
                  user.country,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
    String title,
    IconData icon,
    String value,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 25,
        ),
        child: Column(
          children: [
            Icon(icon, size: 35),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final UserModel user;

  const ProfilePage({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 45,
            child: Icon(
              Icons.person,
              size: 45,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            "${user.firstName} ${user.lastName}",
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(user.email),
          const SizedBox(height: 25),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.badge),
                  title: Text("Employee ID"),
                  subtitle: Text(user.employeeId),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text("Phone"),
                  subtitle: Text(user.primaryPhone),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.location_city),
                  title: Text("City"),
                  subtitle: Text(user.city),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          // SizedBox(
          //   width: double.infinity,
          //   child: ElevatedButton.icon(
          //     onPressed: () {
          //       context.go(AppRoutes.login);
          //     },
          //     icon: const Icon(Icons.logout),
          //     label: const Text("Logout"),
          //   ),
          // ),
        ],
      ),
    );
  }
}
