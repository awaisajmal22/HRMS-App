import 'package:flutter/material.dart';

class HomeModel {
  String? title;
  Function(BuildContext, int)? callBack;
  HomeModel({
    this.title,
    this.callBack,
  });
}
