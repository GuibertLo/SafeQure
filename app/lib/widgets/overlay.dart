import 'package:app/widgets/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Overlay extends StatefulWidget {
  QrData? qr;
  Overlay({this.qr, Key? key}) : super(key: key);

  @override
  State<Overlay> createState() => _OverlayState();
}

class _OverlayState extends State<Overlay> {
  double? height, width;
  double inner_width = 0, border_width = 0;

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
    // opac_border_width = (width! - inner_width - border_width) / 2;
    // opac_border_height = (height! - inner_width - border_width) / 2;
    return Center(
        child: ClipRect(
            clipBehavior: Clip.hardEdge,
            child: OverflowBox(
              maxHeight: double.infinity,
              maxWidth: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        width: height!, color: Colors.black.withOpacity(0.35))),
                child: Column(children: [
                  Container(
                    width: inner_width,
                    height: inner_width,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: border_width,
                        color: Colors.blue.withOpacity(0.35),
                      ),
                    ),
                  ),
                  widget.qr != null ? widget.qr! : Container()
                ]),
              ),
            )
            // child: Container(width: 1, height: 1, color: Colors.blue),
            ));
  }
}
