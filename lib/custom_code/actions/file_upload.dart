// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_cache_manager/file.dart';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<String> fileUpload(DocumentReference? user) async {
  // upload the file for firebase storage
// Import necessary packages

// Select the file to upload
  FilePickerResult? file = await FilePicker.platform.pickFiles();

// Get the file name and extension
  String fileName = file!.files.first as String;

  FFAppState().fileNameAppState = fileName;

// Create a reference to the Firebase storage bucket
  final Reference storageReference =
      FirebaseStorage.instance.ref().child('users/$user/uploads/$fileName');

// Upload the file to Firebase storage
  UploadTask uploadTask = storageReference.putFile(file as File);

// Get the download URL of the uploaded file
  String downloadURL = await (await uploadTask).ref.getDownloadURL();

// Return the download URL
  return downloadURL;
}
