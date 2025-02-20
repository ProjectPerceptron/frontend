import 'package:flutter/material.dart';
import 'package:perceptron/core/constants/app_color.dart';
import 'package:perceptron/features/student/models/subject_info.dart';
class DashboardScreen extends StatelessWidget {
  final String userName;
  final List<SubjectInfo> subjectsList;
  
  DashboardScreen({required this.userName, required this.subjectsList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'GOOD EVENING,',
                style: const TextStyle(
                  color: AppColor.textDark,
                  fontSize: 14,
                ),
              ),
              Text(
                '$userName',
                style: const TextStyle(
                  color:AppColor.textDark,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              
              // Stats Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatCard('Overall Percentage', '78%'),
                  _buildStatCard('Completed Tests', '70%'),
                ],
              ),
              
              const SizedBox(height: 24),
              
              // Subject List
              Expanded(
                child: ListView.builder(
                  itemCount: subjectsList.length,
                  itemBuilder: (context, index) {
                    final subject = subjectsList[index];
                    return SubjectTile(
                      subjectName: subject.name,
                      teacherName: subject.teacher,
                      averagePercentage: subject.percentage,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, String value) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class SubjectTile extends StatefulWidget {
  final String subjectName;
  final String teacherName;
  final String averagePercentage;

  const SubjectTile({
    required this.subjectName,
    required this.teacherName,
    required this.averagePercentage,
    Key? key,
  }) : super(key: key);

  @override
  State<SubjectTile> createState() => _SubjectTileState();
}

class _SubjectTileState extends State<SubjectTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: AppColor.cardColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              leading: const Icon(
                Icons.library_books,
                color: Colors.white,
              ),
              title: Text(
                widget.subjectName,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.averagePercentage,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  AnimatedRotation(
                    turns: _isExpanded ? 0.25 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: const Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            AnimatedCrossFade(
              firstChild: const SizedBox.shrink(),
              secondChild: Padding(
                padding: const EdgeInsets.only(
                  left: 72,
                  right: 16,
                  bottom: 16,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.person_outline,
                      color: Colors.white70,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      widget.teacherName,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              crossFadeState: _isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300),
            ),
          ],
        ),
      ),
    );
  }
}