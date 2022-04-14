import 'package:flutter/material.dart';


class ListScans extends StatefulWidget {

  const ListScans({
    Key? key,
  }) : super(key: key);

  static const String route = "/listScans";

  @override
  State<ListScans> createState() => _ListScansState();
}

class _ListScansState extends State<ListScans> {

  @override
  Widget build(BuildContext context) {
    return IconButton(
        color: Colors.white,
        icon: const Icon(Icons.flash_off, color: Colors.grey),
        onPressed: () {

        }
    );
  }
}