import 'package:flutter/material.dart';

// ignore: must_be_immutable
class button extends StatelessWidget {
  button({this.text,this.ontap});
  String? text;
  Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffB68B25),
        ),
        child: Center(
          child: Text(
            text!,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
