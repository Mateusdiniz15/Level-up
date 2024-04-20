import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

DateTime calculateDate(DateTime hora) {
  // Create function sum hours
// This function adds 3 hours to the input DateTime and returns the result
  return hora.add(Duration(hours: 1));
}

String splitFile(String fileName) {
  List<String> splitFileName = fileName.split(".");
  splitFileName = splitFileName.last.split("?");
  String firstString = splitFileName.first;

  return firstString;
}
