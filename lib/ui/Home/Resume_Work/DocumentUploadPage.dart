import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; // Import for kIsWeb
import 'package:flutter_application_1/ui/Home/mt_home.dart';

class DocumentUploadPage extends StatefulWidget {
  @override
  _DocumentUploadPageState createState() => _DocumentUploadPageState();
}

class _DocumentUploadPageState extends State<DocumentUploadPage> {
  File? _file;
  FilePickerResult? _result; // Add this to hold the result
  bool _isUploading = false;
  String _uploadStatus = '';
  TextEditingController _linkController = TextEditingController();

  // Function to pick file
  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _result = result; // Store the result
        if (kIsWeb) {
          // On web, you don't need the path
          _file = null; // No need for a file instance
        } else {
          // On mobile, use the path
          _file = File(result.files.single.path!);
        }
      });
    }
  }

  // Function to handle file upload
  Future<void> _uploadFile() async {
    if (_file == null && _result == null) {
      setState(() {
        _uploadStatus = 'No file selected!';
      });
      return;
    }

    setState(() {
      _isUploading = true;
      _uploadStatus = 'Uploading...';
    });

    try {
      // Generate unique ID
      String docId = FirebaseFirestore.instance.collection('resumes').doc().id;

      // Track upload progress
      UploadTask uploadTask;
      if (kIsWeb) {
        // Web upload: use bytes instead of path
        final fileBytes = _result!.files.single.bytes; // Get file bytes from web
        Reference storageRef = FirebaseStorage.instance
            .ref()
            .child('resumes/$docId/${_result!.files.single.name}');
        uploadTask = storageRef.putData(fileBytes!); // Upload bytes for web
      } else {
        // Mobile upload: use path as usual
        Reference storageRef = FirebaseStorage.instance
            .ref()
            .child('resumes/$docId/${_file!.path.split('/').last}');
        uploadTask = storageRef.putFile(_file!); // Upload file for mobile
      }

      // Add a listener to track progress
      uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
        if (snapshot.state == TaskState.running) {
          // Ensure the task is running before showing progress
          double progress = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
          setState(() {
            _uploadStatus = 'Uploading... ${progress.toStringAsFixed(2)}%';
          });
        }
      });

      // Wait for the task to complete
      TaskSnapshot snapshot = await uploadTask;

      // Get download URL
      String downloadURL = await snapshot.ref.getDownloadURL();

      // Store metadata in Firestore
      await FirebaseFirestore.instance.collection('resumes').doc(docId).set({
        'id': docId,
        'fileName': kIsWeb ? _result!.files.single.name : _file!.path.split('/').last,
        'downloadURL': downloadURL,
        'uploadedAt': Timestamp.now(),
      });

      setState(() {
        _isUploading = false;
        _uploadStatus = 'Upload complete!';
      });

      // Navigate back to HomeScreen after a short delay
      Future.delayed(Duration(seconds: 1), () {
        Navigator.pop(context);  // Close the dialog
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      });
    } catch (e) {
      setState(() {
        _isUploading = false;
        _uploadStatus = 'Upload failed: $e';
      });
    }
  }

  // Function to handle link submission
  void _uploadLink() {
    String link = _linkController.text;
    if (link.isEmpty) {
      setState(() {
        _uploadStatus = 'No link provided!';
      });
      return;
    }

    setState(() {
      _uploadStatus = 'Link submitted: $link';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.height * 0.6,
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Upload Document',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _pickFile,
              child: Text('Upload from Computer'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _linkController,
              decoration: InputDecoration(
                labelText: 'Enter Document Link',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _uploadLink,
              child: Text('Submit Link'),
            ),
            SizedBox(height: 16),
            if (_file != null) Text('Selected File: ${_file!.path.split('/').last}'),
            if (_result != null)
              Text('Selected File: ${_result!.files.single.name}'),
            if (_file != null || _result != null)
              ElevatedButton(
                onPressed: _uploadFile,
                child: Text('Upload Selected File'),
              ),
            if (_isUploading) CircularProgressIndicator(),
            SizedBox(height: 16),
            Text(
              _uploadStatus,
              style: TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
