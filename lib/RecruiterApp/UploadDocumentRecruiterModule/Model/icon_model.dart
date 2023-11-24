import 'package:flutter/material.dart';

class TabBarModel {
  String? icon;
  String? title;
  VoidCallback? onTap;
  TabBarModel({this.icon, this.title, this.onTap});
}
