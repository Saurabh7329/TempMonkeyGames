import 'package:flutter/material.dart';

class ColumnSpacer extends StatelessWidget {
  const ColumnSpacer(this.height, {Key? key}) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}
