import 'package:flutter/material.dart';

class ResumeDetailPage extends StatelessWidget {
  final Map<String, dynamic> candidateData;

  ResumeDetailPage({required this.candidateData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${candidateData['name']}\'s Resume'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Candidate Name
              Text(
                candidateData['name'],
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              // Candidate Position
              Text(
                'Position: ${candidateData['position']}',
                style: TextStyle(fontSize: 20, color: Colors.black54),
              ),
              SizedBox(height: 10),
              // Candidate Contact Details
              Row(
                children: [
                  Icon(Icons.email, color: Colors.black54),
                  SizedBox(width: 8),
                  Text(
                    candidateData['email'],
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(Icons.phone, color: Colors.black54),
                  SizedBox(width: 8),
                  Text(
                    candidateData['phone'],
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Address
              Text(
                'Address: ${candidateData['address']}',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 20),
              // Education
              Text(
                'Education:',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                '${candidateData['degree']} from ${candidateData['university']}',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 20),
              // Work Experience
              Text(
                'Work Experience:',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                'Years of Experience: ${candidateData['years_of_experience']}',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 20),
              // Skills
              Text(
                'Skills:',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                candidateData['skills'],
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 30),
              // Optionally, you can add more sections like hobbies, certifications, etc.
            ],
          ),
        ),
      ),
    );
  }
}
