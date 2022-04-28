import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Overlay extends StatelessWidget {
  const Overlay({
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 10,
        top: 5,
        // child: InkWell(
        //   child: Container(
        //     width: 100,
        //     height: 200,
        //     decoration: BoxDecoration(
        //       border: Border.all(
        //         width: 10,
        //         color: Colors.blue,
        //       ),
        //     ),
        //     child: Align(
        //       alignment: Alignment.topLeft,
        //       child: Container(
        //         color: Colors.blue,
        //         child: const Text(
        //           'Scanning...',
        //           style: TextStyle(color: Colors.white),
        //         ),
        //       ),
        //     ),
        //   ),
        // )
      child: Container(width: 1, height: 1, color: Colors.blue),
    );
  }

}