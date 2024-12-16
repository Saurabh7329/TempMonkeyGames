import 'package:flutter/material.dart';

class RowSpacer extends StatelessWidget {
  const RowSpacer(this.width, {Key? key}) : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}
