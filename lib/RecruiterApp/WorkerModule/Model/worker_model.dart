import 'package:flutter/material.dart';

class WorkerModel {
  String? title;
  Function(BuildContext, int, int) callBack;
  WorkerModel({
    this.title,
    required this.callBack,
  });
}
