import 'package:flutter/material.dart';

backgroundGradient({required BuildContext context, required Widget widget}) {
  return Container(
    height: MediaQuery.of(context).size.height * 100,
    width: MediaQuery.of(context).size.width * 100,
    decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Color(0xff077ED8), Color(0xffA6CEEB)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight)),
    child: widget,
  );
}
