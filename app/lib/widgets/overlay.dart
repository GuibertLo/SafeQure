import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Overlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: InkWell(
      child: Container(
        width: 100,
        height: 200,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Colors.blue,
          ),
        ),
      ),
    )
        // child: Container(width: 1, height: 1, color: Colors.blue),
        );
  }
}
