import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/Home/Resume_Work/fetch_candidate_data.dart';
import 'package:flutter_application_1/ui/Home/Resume_Work/resume_detail.dart';

class CandidateResumeListPage extends StatefulWidget {
  @override
  _CandidateResumeListPageState createState() => _CandidateResumeListPageState();
}

class _CandidateResumeListPageState extends State<CandidateResumeListPage> {
  late CandidatesService _candidatesService;
  late Future<List<Map<String, dynamic>>> _candidatesFuture;

  @override
  void initState() {
    super.initState();
    _candidatesService = CandidatesService();
    _candidatesFuture = _candidatesService.fetchAllCandidates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Candidate Resumes'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _candidatesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No candidates found.'));
          }

          List<Map<String, dynamic>> candidates = snapshot.data!;

          return ListView.builder(
            itemCount: candidates.length,
            itemBuilder: (context, index) {
              var candidate = candidates[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Candidate Name
                        Text(
                          candidate['name'],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        // Candidate Position
                        Text(
                          'Position: ${candidate['position']}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 8),
                        // Candidate Email
                        Text(
                          'Email: ${candidate['email']}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 8),
                        // Candidate Phone
                        Text(
                          'Phone: ${candidate['phone']}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 8),
                        // Candidate Skills
                        Text(
                          'Skills: ${candidate['skills']}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 16),
                        // View Resume Button
                        ElevatedButton(
                          onPressed: () {
                            // Navigate to ResumeDetailPage and pass the candidate's data
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResumeDetailPage(
                                  candidateData: candidate,
                                ),
                              ),
                            );
                          },
                          child: Text('View Resume'),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
