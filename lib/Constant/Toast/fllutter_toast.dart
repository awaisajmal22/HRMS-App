import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

 toast({required String msg}) {
  return Fluttertoast.showToast(msg: msg, gravity: ToastGravity.BOTTOM);
}
