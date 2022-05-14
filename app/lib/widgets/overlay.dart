import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Overlay extends StatelessWidget {
  double? height, width;
  double inner_width = 0,
      border_width = 0,
      opac_border_width = 0,
      opac_border_height = 0;
  @override
  Widget build(BuildContext context) {
    border_width = 3;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    if (width == null || height == null) {
      return Container();
    }
    if (height! < width!) {
      //Screen rotated
      double tmp = height!;
      height = width;
      width = tmp;
    }
    inner_width = 60 / 100 * width!;
    opac_border_width = (width! - inner_width - border_width) / 2;
    opac_border_height = (height! - inner_width - border_width) / 2;
    return Center(
        child: ClipRect(
            clipBehavior: Clip.hardEdge,
            child: OverflowBox(
              maxHeight: double.infinity,
              maxWidth: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        width: height!, color: Colors.grey.withOpacity(0.5))),
                child: Container(
                  width: inner_width,
                  height: inner_width,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0),
                    border: Border.all(
                      width: border_width,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            )
            // child: Container(width: 1, height: 1, color: Colors.blue),
            ));
  }
}
