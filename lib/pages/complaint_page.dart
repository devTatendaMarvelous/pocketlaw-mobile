import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:pocket_law/widgets/custom_buttom.dart';
import 'package:pocket_law/widgets/custom_textformfield.dart';

class ComplaintPage extends StatefulWidget {
  @override
  _ComplaintPageState createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  File? _selectedFile;
  bool _isLoading = false; // Track loading state

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.single.path != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    }
  }

  Widget _buildThumbnail() {
    if (_selectedFile == null) return SizedBox.shrink();

    final fileExtension = _selectedFile!.path.split('.').last.toLowerCase();
    final imageExtensions = ['png', 'jpg', 'jpeg', 'gif'];

    if (imageExtensions.contains(fileExtension)) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Image.file(
          _selectedFile!,
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
      );
    }


    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        children: [
          Icon(Icons.insert_drive_file, size: 50, color: Colors.blue.shade900),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              _selectedFile!.path.split('/').last,
              style: TextStyle(color: Colors.blue.shade700),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _submitComplaint() async {
    if (_titleController.text.isEmpty || _bodyController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    setState(() {
      _isLoading = true; // Start loading
    });

    try {

      var data = FormData.fromMap({
        if (_selectedFile != null) // Include file only if selected
          'attachment': [
            await MultipartFile.fromFile(
              _selectedFile!.path,
              filename: _selectedFile!.path.split('/').last,
            )
          ],
        'title': _titleController.text,
        'body': _bodyController.text,
      });

      var dio = Dio();
      var response = await dio.request(
        'https://pocketlaw.easygrab.co.zw/api/complaints',
        options: Options(method: 'POST'),
        data: data,
      );

      if (response.statusCode == 200) {
        print(response.data);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Complaint submitted successfully')),
        );
      } else {
        print(response.data);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to submit: ${response.statusMessage}')),
        );
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false; // Stop loading
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Submit Complaint'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFormField(
                  controller: _titleController,
                  labelText: 'Title',
                ),
                SizedBox(height: 16),
                CustomTextFormField(
                  controller: _bodyController,
                  maxLines: 4, labelText: 'Body',
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: 100,
                  child: CustomButton(
                    onPressed: _pickFile,
                    label: 'Pick File 📁',
                  ),
                ),


                _buildThumbnail(),
                SizedBox(height: 16),
                Center(
                  child: SizedBox(
                    width: 120,
                    child: CustomButton(
                      onPressed: _isLoading ? null : _submitComplaint,
                      label: 'Submit',
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (_isLoading)
            Container(
              color: Colors.black.withAlpha(50),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
