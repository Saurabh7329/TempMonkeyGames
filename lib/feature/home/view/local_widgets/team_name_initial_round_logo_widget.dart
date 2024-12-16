import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TeamNameInitialLogoWidget extends StatelessWidget {
  final String name;
  final double height;
  final double width;

  TeamNameInitialLogoWidget({
    required this.name,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: CircleAvatar(
        backgroundColor: Colors.red,
        radius: (height < width ? height : width) / 2,
        child: Text(
          getInitial(name),
          style: TextStyle(
            color: Colors.white,
            fontSize:height == 56 ? 24 : 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  String getInitial(String name) {
    return name.isNotEmpty ? name[0].toUpperCase() : '';
  }
}
