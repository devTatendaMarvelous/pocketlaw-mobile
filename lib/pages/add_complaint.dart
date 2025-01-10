import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/complaint_service.dart';
import '../widgets/custom_buttom.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/custom_textformfield.dart';


class AddComplaint extends StatefulWidget {
  @override
  _AddComplaintState createState() => _AddComplaintState();
}

class _AddComplaintState extends State<AddComplaint> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _attachmentController = TextEditingController();

  final ComplaintService _complaintService = ComplaintService();

  void _submitComplaint() async {
    if (_titleController.text.isEmpty || _bodyController.text.isEmpty) {
      Get.snackbar('Error', 'Title and body cannot be empty',
          backgroundColor: Colors.redAccent, colorText: Colors.white);
      return;
    }

    final confirm = await Get.defaultDialog(
      title: "Confirmation",
      middleText: "Are you sure you want to submit this complaint?",
      textCancel: "No",
      textConfirm: "Yes",
      confirmTextColor: Colors.white,
      onConfirm: () {
        Get.back(result: true);
      },
      onCancel: () {
        Get.back(result: false);
      },
    );

    if (confirm == true) {
      final response = await _complaintService.addComplain(
        _titleController.text,
        _attachmentController.text,
        _bodyController.text,
      );

      if (response != null) {
        Get.snackbar('Success', 'Complaint submitted successfully',
            backgroundColor: Colors.green, colorText: Colors.white);
        _titleController.clear();
        _bodyController.clear();
        _attachmentController.clear();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Complaint'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Text(
              'Title',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            CustomTextFormField(
              controller: _titleController,
              labelText: 'Enter complaint title',
            ),
            SizedBox(height: 16),
            Text(
              'Attachment (Optional)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            CustomTextFormField(
              controller: _attachmentController,
              labelText: 'Enter attachment link',
            ),
            SizedBox(height: 16),
            Text(
              'Complaint Body',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            CustomTextFormField(
              controller: _bodyController,
              labelText: 'Describe your complaint',
              maxLines: 5,
            ),
            SizedBox(height: 32),
            SizedBox(
              width: 150,
              child: CustomButton(
                label: 'Submit Complaint',
                onPressed: _submitComplaint,
              ),
            ),
          ],
        ),
      ),
    );
  }


}


