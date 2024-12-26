import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/ui/Home/mt_home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();  // Initialize Firebase
  runApp(MaterialApp(
    home: JobApplicationForm(),
  ));
}

class JobApplicationForm extends StatefulWidget {
  @override
  _JobApplicationFormState createState() => _JobApplicationFormState();
}

class _JobApplicationFormState extends State<JobApplicationForm> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();
  final TextEditingController _degreeController = TextEditingController();
  final TextEditingController _universityController = TextEditingController();
  final TextEditingController _yearsExperienceController = TextEditingController();
  final TextEditingController _skillsController = TextEditingController();

  // Firebase Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Function to handle form submission and save data to Firebase
  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Use the candidate's email as a unique document ID
        await _firestore.collection('candidates').doc(_emailController.text).set({
          'name': _nameController.text,
          'email': _emailController.text,
          'phone': _phoneController.text,
          'address': _addressController.text,
          'position': _positionController.text,
          'salary': _salaryController.text,
          'degree': _degreeController.text,
          'university': _universityController.text,
          'years_of_experience': _yearsExperienceController.text,
          'skills': _skillsController.text,
        });

        // Show a success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Form Submitted and Data Saved to Firebase')),
        );

        // Navigate back to HomeScreen after a short delay
        Future.delayed(Duration(seconds: 1), () {
          Navigator.pop(context);  // Close the current screen
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        });

      } catch (e) {
        // Handle any errors
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving data: $e')),
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Job Application Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text('Personal Information', style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 16),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Full Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email Address'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email address';
                  }
                  if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zAZ0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              Text('Address Information', style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 16),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Address'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              Text('Job Information', style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 16),
              TextFormField(
                controller: _positionController,
                decoration: InputDecoration(labelText: 'Position Applied For'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the position you are applying for';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _salaryController,
                decoration: InputDecoration(labelText: 'Expected Salary'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your expected salary';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              Text('Education Background', style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 16),
              TextFormField(
                controller: _degreeController,
                decoration: InputDecoration(labelText: 'Degree'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your degree';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _universityController,
                decoration: InputDecoration(labelText: 'University Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your university name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              Text('Work Experience', style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 16),
              TextFormField(
                controller: _yearsExperienceController,
                decoration: InputDecoration(labelText: 'Years of Experience'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your years of experience';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              Text('Skills', style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 16),
              TextFormField(
                controller: _skillsController,
                decoration: InputDecoration(labelText: 'List Your Skills'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your skills';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit Application'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
