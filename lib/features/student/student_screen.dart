import 'package:flutter/material.dart';
import 'package:perceptron/core/constants/app_color.dart';
import 'package:perceptron/features/student/dashboard_screen.dart';
import 'models/subject_info.dart';

final List<SubjectInfo> subjectsList = [
  SubjectInfo(
    name: 'English',
    teacher: 'Dr. Smith',
    percentage: '85%',
  ),
  SubjectInfo(
    name: 'Physics',
    teacher: 'Prof. Johnson',
    percentage: '92%',
  ),
  SubjectInfo(
    name: 'Chemistry',
    teacher: 'Dr. Williams',
    percentage: '88%',
  ),
  SubjectInfo(
    name: 'History',
    teacher: 'Prof. Brown',
    percentage: '90%',
  ),
  // Add more subjects as needed
];

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Track the selected index for BottomNavigationBar
  int _selectedIndex = 0;

  // List of screens or content for each tab
  final List<Widget> _screens = [
    HomeScreen(),
    PerformanceScreen(),
    AssignmentsScreen(),
    ProfileScreen(),
  ];

  // Update the selected index and change the screen
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex], // Display the current screen based on selected index
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.backgroundWhite,
        selectedItemColor: AppColor.primaryColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // Handle the tap event
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: 'Performance'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Notes'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// Example screen for Home
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DashboardScreen(userName: "Vilasini V", subjectsList: subjectsList,);
  }
}

// Example screen for Performance
class PerformanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Performance Screen", style: TextStyle(fontSize: 24)),
    );
  }
}

// Example screen for Assignments
class AssignmentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Assignments Screen", style: TextStyle(fontSize: 24)),
    );
  }
}

// Example screen for Profile
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Profile Screen", style: TextStyle(fontSize: 24)),
    );
  }
}